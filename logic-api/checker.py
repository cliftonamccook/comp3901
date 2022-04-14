from typing import Optional, List, Set
from fastapi import FastAPI
from pydantic import BaseModel
from models import Node, Course, ANDGrouping, ORGrouping, StudentRecord, TermRecord, CourseRecord
import os


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


class AuditRequest(BaseModel):
    audit_request_data: list


class AuditInput(BaseModel):
    audit_data: list


# Response Model
class ReportData(BaseModel):
    fulfilled: bool
    credits: int
    summary: list = []


programmes = {} # cache of programme trees


# @app.get("/checker/")
# def checkprogress():
#     return "Progress Checker under construction"


@app.post("/checker/fastcheck/")
def checkprogress(AR:AuditRequest):
    pid = AR.audit_request_data[1]["code"]
    try:
        if programmes[pid] is not None:
            programme = programmes[pid]
            report = ReportData()
            # perform check (tree walk) on cached programme tree
            # return report
            return pid
    except:
        return {"error": "Programme not present", "programme code": pid}


@app.post("/checker/")
def checkprogress(payload:AuditInput):
        # construct programme tree from received ProgrammeData
        # cache tree in programmes dictionary
        # perform check (tree walk) on cached programme tree
        # return report
        student_record = payload.audit_data[0]
        programme = payload.audit_data[1]

        # code = programme["code"]
        # name = programme["name"]
        # mincreds = programme["minimum_credits"]
        # reqs = programme["requirements"]
        # op = programme["operation"]

        # if op == "AND":
        #     root = ANDGrouping(code, name, mincreds)
        #     for req in reqs:
        #         if req["operation"] == None:
        #             course = Course(req["code"], req["name"], req["minimum_credits"], req["department"])
        #             root.requirements.extend(course)
        #         elif req["operation"] == "AND":
        #             group = ANDGrouping(req["code"], req["name"], req["minimum_credits"])
        #             root.requirements.extend(group)
        #         elif req["operation"] == "OR":
        #             group = ORGrouping(req["code"], req["name"], req["minimum_credits"])
        #             root.requirements.extend(group)
        # elif op == "OR":
        #     root = ORGrouping(code, name, mincreds)
        #     for req in reqs:
        #         if req["operation"] == None:
        #             course = Course(req["code"], req["name"], req["minimum_credits"], req["department"])
        #             root.requirements.extend(course)
        #         elif req["operation"] == "AND":
        #             group = ANDGrouping(req["code"], req["name"], req["minimum_credits"])
        #             root.requirements.extend(group)
        #         elif req["operation"] == "OR":
        #             group = ORGrouping(req["code"], req["name"], req["minimum_credits"])
        #             root.requirements.extend(group)


        return student_record
