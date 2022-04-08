from typing import Optional, List, Set
from fastapi import FastAPI
from pydantic import BaseModel
from models import ProgrammeTreeNode, Course, ANDGrouping, ORGrouping, StudentRecord, TermRecord, CourseRecord


app = FastAPI()


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
    tags: set = set([])


class GroupingData(BaseModel):
    name: str
    code: str
    operation: str
    minimum_credits: int
    requirements: list = []


class ProgrammeData(BaseModel):
    name: str
    code: str
    faculty: str
    operation: str
    minimum_credits: int
    requirements: list = []


class CourseRecordData(BaseModel):
    name: str
    code: str
    grade: str


class TermData(BaseModel):
    term: str
    course_records: List[CourseRecordData]


class StudentData(BaseModel):
    name: str
    id: int
    campus: str
    faculty: str
    programme: str
    course_history: List[TermData]


class AuditInput(BaseModel):
    audit_data: list


# Response Model
class ReportData(BaseModel):
    fulfilled: bool
    credits: int
    incomplete: list = []


programmes = {}


@app.get("/checker/")
def checkprogress():
    return "Progress Checker under construction"


# @app.post("/checker/")
# def checkprogress(SR:StudentData, ProgID:str):
#     if programmes[ProgID] is not None:
#         programme = programmes[ProgID]
#         # perform check (tree walk) on cached programme tree
#         # return report
#         pass
#     else:
#         return {"error message": "Programme not present", "error ID": 401}


@app.post("/checker/")
def checkprogress(payload:AuditInput):
        # construct programme tree from received ProgrammeData
        # cache tree in programmes dictionary
        # perform check (tree walk) on cached programme tree
        # return report
        student_record = payload.audit_data[0]
        programme = payload.audit_data[1]
        return student_record

# uvicorn checker:app --reload
