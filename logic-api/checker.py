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
def checkprogress(SR:StudentData, Prog:ProgrammeData):
    # construct programme tree
    # cache tree in programmes dictionary
    # perform check (tree walk)
    # return report
    pass


# uvicorn checker:app --reload