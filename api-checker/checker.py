import uvicorn
from fastapi import FastAPI, Request, HTTPException
from models import *
from sampledata import bsccompsci, bscgenchem


SERVER_PORT = 8000

app = FastAPI()

CACHED_PROGRAMMES = {}

# comp = bsccompsci.programmedata
# chem = bscgenchem.programmedata

@app.post("/checker/fastcheck/")
async def checkprogress(payload:Request):
    data = await payload.json()
    studentrecord = data[0]
    pid = data[1]["code"]
    try:
        tree = CACHED_PROGRAMMES[pid]
        auditor = Auditor(studentrecord, programmedata=None)
        auditor.settree(tree)
        report = auditor.walktree()
        return report
    except:
        raise HTTPException(status_code=404, detail=f'Programme with ID: {pid} not found')


@app.post("/checker/")
async def checkprogress(payload:Request):
    data = await payload.json()
    studentrecord = data[0]
    programmedata = data[1]
    # programmedata = chem
    auditor = Auditor(studentrecord, programmedata)
    tree = auditor.gettree()
    CACHED_PROGRAMMES[f'{programmedata["code"]}'] = tree
    report = auditor.walktree()
    return report
    # return auditor.grades
    # return programmedata


if __name__ == "__main__":
    uvicorn.run("checker:app", host="127.0.0.1", port=SERVER_PORT, reload=True)
