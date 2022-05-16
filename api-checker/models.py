class Report:
    def __init__(self, code, name) -> None:
        self.code = code
        self.name = name
        self.fulfilled = False
        self.node_type = None
        self.credits_earned = 0
        self.credit_threshold = 0
        self.percentage = f'{0.00}%'
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
        report.node_type = "AND grouping"
        report.credit_threshold = self.minimum_credits
        requirement_states = []
        for requirement in self.requirements:
            sub_report = requirement.audit(record)
            report.summary.append(sub_report)
            if sub_report.fulfilled:
                report.credits_earned += sub_report.credits_earned
                if self.minimum_credits == 0:
                    report.percentage = f'{100.00}%'
            else:
                if isinstance(requirement, Threshold):
                    report.credits_earned += sub_report.credits_earned
            requirement_states.extend([sub_report.fulfilled])
        report.fulfilled = all(requirement_states) and self.within_threshold(report.credits_earned)
        if self.minimum_credits > 0:
            report.percentage = f'{(report.credits_earned / self.minimum_credits) * 100 :.2f}%'
        return report


class ORNode(Threshold):
    def __init__(self, min_credits):
        super().__init__(min_credits)

    def audit(self, record) -> Report:
        report = Report(self.code, self.name)
        report.node_type = "OR grouping"
        report.credit_threshold = self.minimum_credits
        requirement_states = []
        for requirement in self.requirements:
            sub_report = requirement.audit(record)
            report.summary.append(sub_report)
            if sub_report.fulfilled:
                report.credits_earned += sub_report.credits_earned
                if self.minimum_credits == 0:
                    report.percentage = f'{100.00}%'
            else:
                if isinstance(requirement, Threshold):
                    report.credits_earned += sub_report.credits_earned
            requirement_states.extend([sub_report.fulfilled])
        report.fulfilled = any(requirement_states) and self.within_threshold(report.credits_earned)
        if self.minimum_credits > 0:
            report.percentage = f'{(report.credits_earned / self.minimum_credits) * 100 :.2f}%'
        return report


class Course(Node):
    def __init__(self, credits):
        super().__init__()
        self.credits = credits

    def audit(self, grades):
        report = Report(self.code, self.name)
        report.node_type = "course"
        report.credit_threshold = self.credits
        if self.code in grades.keys():
            if grades[f'{self.code}']["grade"][0] <= 'C':
                report.fulfilled = True
                report.credits_earned = self.credits
                report.percentage = f'{100.00}%'
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
        for course_record in record["course records"]:
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
            tree = Course(obj["credits"])
        finally:
            tree.name = obj["name"]
            tree.code = obj["code"]
            return tree

    def walktree(self):
        report = self.tree.audit(self.grades)
        return report

