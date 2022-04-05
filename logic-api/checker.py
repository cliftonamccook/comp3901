from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel
from models import ProgrammeTreeNode, Course, ANDGrouping, ORGrouping, StudentRecord, TermRecord, CourseRecord


app = FastAPI()


class StudentData(BaseModel):
    pass


class ProgrammeData(BaseModel):
    pass


# Response Model
class ReportData(BaseModel):
    pass


programmes = {}


@app.get("/checker/")
def checkprogress():
    return "Progress Checker under construction"


@app.post("/checker/")
def checkprogress(SR:StudentData, ProgID:str):
    if programmes[ProgID] is not None:
        # construct programme tree
        # cache tree in programmes dictionary
        # perform check (tree walk)
        # return report
        pass
    else:
        return {"error message": "Programme not present", "error ID": 401}


# uvicorn checker:app --reload