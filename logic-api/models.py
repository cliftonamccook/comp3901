from sys import maxsize


class Report:
    def __init__(self) -> None:
        self.fulfilled = False
        self.credits = 0
        self.incomplete = []
        self.breakdown = []

    def read(self):
        for i in self.breakdown:
            print(i)


class Node:
    """
    Generic tree node
    May represent any grouping or single course
    """
    def __init__(self, code, name, mincreds):
        self.code = code
        self.name = name
        # self.campus = campus
        # self.faculty = faculty
        self.requirements = []
        self.min_credits = mincreds
        self.max_credits = maxsize
        self.description = ""
        self.tag = []

    def within_threshold(self, value) -> bool:
        return value >= self.min_credits and value <= self.max_credits

    def __repr__(self):
        return f'{self.name}'


class Course(Node):
    def __init__(self, dpt):
        super().__init__()
        self.department = dpt
        self.corequisites = []
        self.antirequisites = []

class ANDGrouping(Node):
    def __init__(self):
        super().__init__()
        self.AND = all

    def check_requirements(self, record) -> Report:
        report = Report()
        prerequisite_states = []
        for requirement in self.prerequisite:
            state = requirement.check_requirements(record)
            report.breakdown.extend([f'Grouping => {requirement.name} Fulfilled => {state.fulfilled} Credits Obtained => {state.credits} incomplete => {state.incomplete}'])
            if state.fulfilled:
                report.credits += state.credits
            else:
                if isinstance(requirement, ANDGrouping) or isinstance(requirement, ORGrouping):
                    report.credits += state.credits
                    report.incomplete.extend([requirement.name])
                report.incomplete.extend(state.incomplete)
            prerequisite_states.extend([state.fulfilled])
        report.fulfilled = self.AND(prerequisite_states) and self.within_threshold(report.credits)
        if report.fulfilled:
            report.incomplete.clear
        # print(f'Grouping => {self.name} Fulfilled => {report.fulfilled} Credits Obtained => {report.credits} incomplete => {report.incomplete}')
        report.breakdown.extend([f'Grouping => {self.name} Fulfilled => {report.fulfilled} Credits Obtained => {report.credits} incomplete => {report.incomplete}'])
        return report


class ORGrouping(Node):
    def __init__(self):
        super().__init__()
        self.OR = any

    def check_requirements(self, record) -> Report:
        report = Report()
        prerequisite_states = []
        for requirement in self.prerequisite:
            state = requirement.check_requirements(record)
            report.breakdown.extend([f'Grouping => {requirement.name} Fulfilled => {state.fulfilled} Credits Obtained => {state.credits} incomplete => {state.incomplete}'])
            if state.fulfilled:
                report.credits += state.credits
            else:
                if isinstance(requirement, ANDGrouping) or isinstance(requirement, ORGrouping):
                    report.credits += state.credits
                    report.incomplete.extend([requirement.name])
                report.incomplete.extend(state.incomplete)
            prerequisite_states.extend([state.fulfilled])
        report.fulfilled = self.OR(prerequisite_states) and self.within_threshold(report.credits)
        if report.fulfilled:
            report.incomplete.clear
        # print(f'Grouping => {self.name} Fulfilled => {report.fulfilled} Credits Obtained => {report.credits} incomplete => {report.incomplete}')
        report.breakdown.extend([f'Grouping => {self.name} Fulfilled => {report.fulfilled} Credits Obtained => {report.credits} incomplete => {report.incomplete}'])
        return report


class StudentRecord:
    def __init__(self, name:str, id:int, campus:str, faculty:str, prog:str, terms:list) -> None:
        self.name = name
        self.id = id
        self.campus = campus
        self.faculty = faculty
        self.programme = prog
        self.course_history = terms


class TermRecord:
    def __init__(self, term:str, courserecords:list) -> None:
        self.term = term
        self.courserecords = courserecords



class CourseRecord:
    def __init__(self, course:Course, grade:str, cr:int) -> None:
        self.course = course
        self.grade = grade
        self.credits_earned = cr

    def __repr__(self) -> str:
        return self.course.code