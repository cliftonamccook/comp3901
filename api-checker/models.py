class Report:
    def __init__(self, code, name) -> None:
        self.code = code
        self.name = name
        self.fulfilled = False
        self.credits = 0
        self.summary = {"incomplete": []}


class Node:
    def __init__(self):
        self.code = None
        self.name = None

    def audit(self):
        pass

    def __repr__(self):
        return f'{self.name}'


class Threshold(Node):
    def __init__(self, threshold):
        super().__init__()
        self.minimum_credits = threshold
        self.requirements = []

    def addchild(self, obj):
        self.requirements.append(obj)    
    
    def within_threshold(self, value) -> bool:
        return value >= self.minimum_credits


class ANDThreshold(Threshold):
    def __init__(self, min_credits):
        super().__init__(min_credits)

    def audit(self, record) -> Report:
        report = Report(self.code, self.name)
        requirement_states = []
        for requirement in self.requirements:
            sub_report = requirement.audit(record)
            if sub_report.fulfilled:
                report.credits += sub_report.credits
                report.summary[f'{requirement.name}'] = sub_report
            else:
                if isinstance(requirement, Threshold):
                    report.credits += sub_report.credits
                    sub_report.summary["incomplete"].extend([requirement.name])
            requirement_states.extend([sub_report.fulfilled])
        report.fulfilled = all(requirement_states) and self.within_threshold(report.credits)
        if report.fulfilled:
            report.summary["incomplete"].clear
        return report


class ORThreshold(Threshold):
    def __init__(self, min_credits):
        super().__init__(min_credits)

    def audit(self, record) -> Report:
        report = Report(self.code, self.name)
        requirement_states = []
        for requirement in self.requirements:
            sub_report = requirement.audit(record)
            if sub_report.fulfilled:
                report.credits += sub_report.credits
                report.summary[f'{requirement.name}'] = sub_report
            else:
                if isinstance(requirement, Threshold):
                    report.credits += sub_report.credits
                    sub_report.summary["incomplete"].extend([requirement.name])
            requirement_states.extend([sub_report.fulfilled])
        report.fulfilled = any(requirement_states) and self.within_threshold(report.credits)
        if report.fulfilled:
            report.summary["incomplete"].clear
        return report


class Course(Node):
    def __init__(self):
        super().__init__()
        self.credits = 3
        self.prerequisites = []
        self.corequisites = []
        self.antirequisites = []
        self.description = ""
        self.tags = []

    def audit(self, record):
        grades = {}
        for term in record["course history"]:
            for course_record in term["course records"]:
                grades[course_record["code"]] = {"name":course_record["name"], "grade":course_record["grade"]}
        report = Report(self.code, self.name)
        if self.code in grades.keys():
            if grades[f'{self.code}']["grade"] <= 'C':
                report.fulfilled = True
                report.credits = self.credits
        else:
            report.summary["incomplete"].extend(self.name)
        return report


class Auditor:
    def __init__(self, studentrecord, programmedata):
        self.programmedata = programmedata
        self.studentrecord = studentrecord

    def buildtree(self, obj):
        try:
            if obj["operation"] == "AND":
                tree = ANDThreshold(obj["minimum_credits"])
            if obj["operation"] == "OR":
                tree = ORThreshold(obj["minimum_credits"])
            for children in obj["requirements"]:
                tree.addchild(self.buildtree(children))
        except:
            tree = Course()
        finally:
            tree.name = obj["name"]
            tree.code = obj["code"]
            return tree

    def walktree(self, tree):
        report = tree.audit(self.studentrecord)
        return report
