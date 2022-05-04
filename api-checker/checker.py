import uvicorn
from fastapi import FastAPI, Request, HTTPException
from models import *


SERVER_PORT = 8000

app = FastAPI()

CACHED_PROGRAMMES = {} # cache of programme trees


@app.post("/checker/fastcheck/")
async def checkprogress(payload:Request):
    data = await payload.json()
    studentrecord = data[0]
    pid = data[1]["code"]
    try:
        tree = CACHED_PROGRAMMES[pid]
        auditor = Auditor(studentrecord, programmedata=None)
        report = auditor.walktree(tree) # perform check (tree walk) on cached programme tree
        return report
    except:
        raise HTTPException(status_code=404, detail=f'Programme with ID: {pid} not found')


@app.post("/checker/")
async def checkprogress(payload:Request):
    data = await payload.json()
    studentrecord = data[0]
    programmedata = data[1]
    auditor = Auditor(studentrecord, programmedata)
    tree = auditor.buildtree(programmedata) # construct programme tree from received ProgrammeData
    CACHED_PROGRAMMES[f'{programmedata["code"]}'] = tree # cache tree in programmes dictionary
    report = auditor.walktree(tree) # perform check (tree walk) on cached programme tree
    return report


if __name__ == "__main__":
    uvicorn.run("checker:app", host="127.0.0.1", port=SERVER_PORT, reload=True)
