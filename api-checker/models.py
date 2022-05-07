class Report:
    def __init__(self, code, name) -> None:
        self.code = code
        self.name = name
        self.fulfilled = False
        self.credits = 0
        self.percentage = 0
        self.summary = []


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


class ANDNode(Threshold):
    def __init__(self, min_credits):
        super().__init__(min_credits)

    def audit(self, record) -> Report:
        report = Report(self.code, self.name)
        requirement_states = []
        for requirement in self.requirements:
            sub_report = requirement.audit(record)
            report.summary.append(sub_report)
            if sub_report.fulfilled:
                report.credits += sub_report.credits
            else:
                if isinstance(requirement, Threshold):
                    report.credits += sub_report.credits
            requirement_states.extend([sub_report.fulfilled])
        report.fulfilled = all(requirement_states) and self.within_threshold(report.credits)
        if self.minimum_credits > 0:
            report.percentage = (report.credits / self.minimum_credits) * 100
        return report


class ORNode(Threshold):
    def __init__(self, min_credits):
        super().__init__(min_credits)

    def audit(self, record) -> Report:
        report = Report(self.code, self.name)
        requirement_states = []
        for requirement in self.requirements:
            sub_report = requirement.audit(record)
            report.summary.append(sub_report)
            if sub_report.fulfilled:
                report.credits += sub_report.credits
            else:
                if isinstance(requirement, Threshold):
                    report.credits += sub_report.credits
            requirement_states.extend([sub_report.fulfilled])
        report.fulfilled = any(requirement_states) and self.within_threshold(report.credits)
        if self.minimum_credits > 0:
            report.percentage = (report.credits / self.minimum_credits) * 100
        return report


class Course(Node):
    def __init__(self):
        super().__init__()
        self.credits = 3
        # self.prerequisites = []
        # self.corequisites = []
        # self.antirequisites = []
        # self.description = ""
        # self.tags = []
        # self.report = {}

    def audit(self, grades):
        report = Report(self.code, self.name)
        if self.code in grades.keys():
            if grades[f'{self.code}']["grade"][0] <= 'C':
                report.fulfilled = True
                report.credits = self.credits
                report.percentage = 100
        return report


class Auditor:
    def __init__(self, studentrecord, programmedata):
        self.grades = self.flatten(studentrecord)
        self.tree = self.buildtree(programmedata)

    def gettree(self):
        return self.tree

    def settree(self, tree):
        self.tree = tree

    def flatten(self, record):
        grades = {}
        for term in record["course history"]:
            for course_record in term["course records"]:
                if course_record["grade"][0] <= 'C':
                    grades[course_record["code"]] = {"name":course_record["name"], "grade":course_record["grade"]}
        return grades
    
    def buildtree(self, obj):
        if obj is None:
            return None
        try:
            if obj["operation"] == "AND":
                tree = ANDNode(obj["minimum_credits"])
            if obj["operation"] == "OR":
                tree = ORNode(obj["minimum_credits"])
            for children in obj["requirements"]:
                tree.addchild(self.buildtree(children))
        except:
            tree = Course()
        finally:
            tree.name = obj["name"]
            tree.code = obj["code"]
            return tree

    def walktree(self):
        report = self.tree.audit(self.grades)
        return report
