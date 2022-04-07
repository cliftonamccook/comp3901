from typing import Optional, List, Set
from fastapi import FastAPI
from pydantic import BaseModel
from models import ProgrammeTreeNode, Course, ANDGrouping, ORGrouping, StudentRecord, TermRecord, CourseRecord


app = FastAPI()


class StudentData(BaseModel):
    pass


class CourseData(BaseModel):
    name: str
    code: str
    semester: List[int]
    credits: int
    campus: str
    faculty: str
    department: str
    requirements: list = []
    corerequisite: list = []
    antirequisite: list = []
    description: str
    tags: set = {}


class GroupingData(BaseModel):
    name: str
    code: str
    operation: str
    minimum_credits: int
    requirements: list = []


class ProgrammeData(BaseModel):
    name: str
    code: str
    operation: str
    minimum_credits: int
    requirements: List[GroupingData, CourseData] = []


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
        programme = programmes[ProgID]
        # perform check (tree walk) on cached programme tree
        # return report
        pass
    else:
        return {"error message": "Programme not present", "error ID": 401}


@app.post("/checker/")
def checkprogress(SR:StudentData, Prog:ProgrammeData):
        # construct programme tree from received ProgrammeData
        # cache tree in programmes dictionary
        # perform check (tree walk) on cached programme tree
        # return report

# uvicorn checker:app --reload
