from sys import maxsize


class Node(object):
    COUNT = 1
    """
    Generic tree node
    May represent any grouping or single course
    """
    def __init__(self):
        self.node = Node.COUNT
        Node.COUNT += 1
        self.id = None
        self.name = None
        self.start_year = None
        self.end_year = None
        self.faculty = None
        self.department = None
        self.prerequisite = []
        self.min_credits = 0
        self.max_credits = maxsize
        self.description = ""
        self.tag = []

    def __repr__(self):
        return f'{self.name}'


class Course(Node):
    def __init__(self):
        super().__init__()
        self.semester = []
        self.corequisite = []
        self.antirequisite = []
        self.code = None

    def check_requirements(self, record):
        terms_in_record = [term_record for term_record in record.course_history]
        modules_in_term = [term.courses for term in terms_in_record]
        modules_taken = [module for listing in modules_in_term for module in listing]
        grades = {module.course.code:module for module in modules_taken}
        report = {
            "fulfilled": False,
            "credits": 0,
            "need to do": []
            }

        if self.code in [c.course.code for c in modules_taken]:
            if grades[self.code].grade[0] <= 'C':
                report["fulfilled"] = True
                report["credits"] += grades[self.code].credits_earned
            else:
                report["need to do"].extend([self.code])
        else:
            report["need to do"].extend([self.code])
        return report


class ANDGrouping(Node):
    def __init__(self):
        super().__init__()

    def within_threshold(self, value):
        return value >= self.min_credits and value <= self.max_credits

    def check_requirements(self, record):
        report = {
            "fulfilled": False, 
            "credits": 0,
            "need to do": []
            }
        prerequisite_states = []
        for requirement in self.prerequisite:
            state = requirement.check_requirements(record)
            if state["fulfilled"]:
                report["credits"] += state["credits"]
            else:
                if isinstance(requirement, ANDGrouping) or isinstance(requirement, ORGrouping):
                    report["credits"] += state["credits"]
                    report["need to do"].extend([requirement.name])
                report["need to do"].extend(state["need to do"])
            prerequisite_states.extend([state["fulfilled"]])
        report["fulfilled"] = all(prerequisite_states) and self.within_threshold(report["credits"])
        if report["fulfilled"]:
            report["need to do"] = []
        print(f'Grouping => {self.name}: ', f'Fulfilled => {report["fulfilled"]}', f'Credits Obtained => {report["credits"]}', f'Need to do => {report["need to do"]}')
        return report



class ORGrouping(Node):
    def __init__(self):
        super().__init__()

    def within_threshold(self, value):
        return value >= self.min_credits and value <= self.max_credits

    def check_requirements(self, record):
        report = {
            "fulfilled": False,
            "credits": 0,
            "need to do": []
            }
        prerequisite_states = []
        for requirement in self.prerequisite:
            state = requirement.check_requirements(record)
            if state["fulfilled"]:
                report["credits"] += state["credits"]
            else:
                if isinstance(requirement, ANDGrouping) or isinstance(requirement, ORGrouping):
                    report["credits"] += state["credits"]
                    report["need to do"].extend([requirement.name])
                report["need to do"].extend(state["need to do"])
            prerequisite_states.extend([state["fulfilled"]])
        report["fulfilled"] = any(prerequisite_states) and self.within_threshold(report["credits"])
        if report["fulfilled"]:
            report["need to do"] = []
        print(f'Grouping => {self.name}: ', f'Fulfilled => {report["fulfilled"]} ', f'Credits Obtained => {report["credits"]}', f'Need to do => {report["need to do"]}')
        return report


class CourseRecord:
    def __init__(self, course, grade, cr) -> None:
        self.course = course
        self.grade = grade
        self.credits_earned = cr

    def __repr__(self) -> str:
        return self.course.code


class TermRecord:
    def __init__(self, year, sem, courses) -> None:
        self.academic_year = year
        self.semester = sem
        self.courses = courses


class StudentRecord:
    def __init__(self, name, campus, faculty, prog, start_year, terms:list) -> None:
        self.name = name
        self.campus = campus
        self.faculty = faculty
        self.programme = prog
        self.enrollment_year = start_year
        self.major1 = None
        self.major2 = None
        self.minor1 = None
        self.minor2 = None
        self.course_history = terms


# Core Courses
math1152 = Course()
math1152.code = "MATH1152"
math1152.name = "Introduction to Formal Mathematics"
math1152.semester.extend([2])
math1152.min_credits = 3

comp1210 = Course()
comp1210.code = "COMP1210"
comp1210.name = "Mathematics for Computing"
comp1210.semester.extend([1])
comp1210.min_credits = 3

comp1220 = Course()
comp1220.code = "COMP1220"
comp1220.name = "Computing and Society"
comp1220.semester.extend([2])
comp1220.min_credits = 3

comp1126 = Course()
comp1126.code = "COMP1126"
comp1126.name = "Introduction to Computing I"
comp1126.semester.extend([1])
comp1126.min_credits = 3

comp1127 = Course()
comp1127.code = "COMP1127"
comp1127.name = "Introduction to Computing II"
comp1127.semester.extend([1])
comp1127.min_credits = 3
comp1127.prerequisite.extend([comp1126])

comp1161 = Course()
comp1161.code = "COMP1161"
comp1161.name = "Object-Oriented Programming"
comp1161.semester.extend([2])
comp1161.min_credits = 3
comp1161.prerequisite.extend([comp1126, comp1127])

comp2140 = Course()
comp2140.code = "COMP2140"
comp2140.name = "Software Engineering"
comp2140.semester.extend([1])
comp2140.min_credits = 3
comp2140.prerequisite.extend([comp1126, comp1127])

comp2171 = Course()
comp2171.code = "COMP2171"
comp2171.name = "Object-Oriented Design and Implementation"
comp2171.semester.extend([2])
comp2171.min_credits = 3
comp2171.prerequisite.extend([comp2140])

comp2201 = Course()
comp2201.code = "COMP2201"
comp2201.name = "Discrete Mathematics"
comp2201.semester.extend([1])
comp2201.min_credits = 3
comp2201.prerequisite.extend([comp1210, math1152])

comp2211 = Course()
comp2211.code = "COMP2211"
comp2211.name = "Analysis of Algorithms"
comp2211.semester.extend([2])
comp2211.min_credits = 3
comp2211.prerequisite.extend([comp1161, comp1210])

comp2190 = Course()
comp2190.code = "COMP2190"
comp2190.name = "Net-centric Computing"
comp2190.semester.extend([1])
comp2190.min_credits = 3
comp2190.prerequisite.extend([comp1161, comp1210])

comp2340 = Course()
comp2340.code = "COMP2340"
comp2340.name = "Computer System Organization"
comp2340.semester.extend([1])
comp2340.min_credits = 3
comp2340.prerequisite.extend([comp1161, comp1210])

comp3101 = Course()
comp3101.code = "COMP3101"
comp3101.name = "Operating Systems"
comp3101.semester.extend([1])
comp3101.min_credits = 3
comp3101.prerequisite.extend([comp2340])

comp3161 = Course()
comp3161.code = "COMP3161"
comp3161.name = "Database Management Systems"
comp3161.semester.extend([2])
comp3161.min_credits = 3
comp3161.prerequisite.extend([comp1161, comp1210])

comp3220 = Course()
comp3220.code = "COMP3220"
comp3220.name = "Principles of Artificial Intelligence"
comp3220.semester.extend([1])
comp3220.min_credits = 3
comp3220.prerequisite.extend([comp2201, comp2211])

comp3901 = Course()
comp3901.code = "COMP3901"
comp3901.name = "Capstone Project"
comp3901.semester.extend([1, 2])
comp3901.min_credits = 3
# subreq = ORNode()
# subreq.min_credits = 6
# subreq.prerequisite.extend(["advanced"])
comp3901.prerequisite.extend([comp2140, comp2211])

# Foundation Courses
foun1401 = Course()
foun1401.name = "Critical Reading and Writing in Science and Technology and Medical Sciences"
foun1401.code = "FOUN1401"
foun1401.min_credits = 3

foun1301 = Course()
foun1301.name = "Law, Governance, Economy & Society"
foun1301.code = "FOUN1301"
foun1301.min_credits = 3

foun1101 = Course()
foun1101.name = "Caribbean Civilization"
foun1101.code = "FOUN1101"
foun1101.min_credits = 3

foun1019 = Course()
foun1019.name = "Critical Reading and Writing in the Disciplines"
foun1019.code = "FOUN1019"
foun1019.min_credits = 3



# Foreign Language Courses
span1000 = Course()
span1000.name = "Spanish Language 1"
span1000.code = "SPAN1000"
span1000.min_credits = 3

span1001 = Course()
span1001.name = "Spanish Language 2"
span1001.code = "SPAN1001"
span1001.min_credits = 3


# Groupings
FST_COMP_FOUN = ORGrouping()
FST_COMP_FOUN.name = "Compulsory Foundation"
FST_COMP_FOUN.min_credits = 3
FST_COMP_FOUN.prerequisite.extend([foun1401, foun1019])

FST_OPT_FOUN_1 = ORGrouping()
FST_OPT_FOUN_1.name = "Other Foundation"
FST_OPT_FOUN_1.min_credits = 3
FST_OPT_FOUN_1.max_credits = 6
FST_OPT_FOUN_1.prerequisite.extend([foun1101, foun1301])

FOREIGN_LANGUAGE = ORGrouping()
FOREIGN_LANGUAGE.name = "Foreign Language"
FOREIGN_LANGUAGE.min_credits = 0
FOREIGN_LANGUAGE.max_credits = 3
FOREIGN_LANGUAGE.prerequisite.extend([span1000, span1001])

FST_OPT_FOUN = ORGrouping()
FST_OPT_FOUN.name = "Optional Foundation"
FST_OPT_FOUN.min_credits = 6
FST_OPT_FOUN.prerequisite.extend([FST_OPT_FOUN_1, FOREIGN_LANGUAGE])

FST_FOUNDATION = ANDGrouping()
FST_FOUNDATION.name = "Foundation"
FST_FOUNDATION.min_credits = 9
FST_FOUNDATION.prerequisite.extend([FST_COMP_FOUN, FST_OPT_FOUN])

FST_CS_INTRO = ANDGrouping()
FST_CS_INTRO.name = "CS Core Introductory"
FST_CS_INTRO.min_credits = 15
FST_CS_INTRO.prerequisite.extend([comp1210, comp1220, comp1126, comp1127, comp1161])

FST_CS_ADVANCED = ANDGrouping()
FST_CS_ADVANCED.name = "CS Core Advanced"
FST_CS_ADVANCED.min_credits = 30
FST_CS_ADVANCED.prerequisite.extend([comp2140, comp2171, comp2201, comp2211, comp2190, comp2340, comp3101, comp3161, comp3220, comp3901])

FST_CS_MAJOR = ANDGrouping()
FST_CS_MAJOR.name = "Computer Science Major"
FST_CS_MAJOR.faculty = "Science and Technology"
FST_CS_MAJOR.min_credits = 54
FST_CS_MAJOR.prerequisite.extend([FST_CS_INTRO, FST_CS_ADVANCED])

BSC_CS = ANDGrouping()
BSC_CS.name = "BSc Computer Science"
BSC_CS.faculty = "Science and Technology"
BSC_CS.min_credits = 93
BSC_CS.prerequisite.extend([FST_CS_MAJOR, FST_FOUNDATION])


# print(BSC_CS.prerequisite)
# print(FST_CS_MAJOR.prerequisite)
# print(FST_CS_INTRO.prerequisite)
# print(comp2201.prerequisite)


# postorder_traversal_iteratively(BSC_CS)


c1 = CourseRecord(math1152, 'A', 3)
c2 = CourseRecord(comp1126, 'A+', 3)
c3 = CourseRecord(comp1127, 'C', 3)
c4 = CourseRecord(comp1161, 'A', 3)
c5 = CourseRecord(comp1210, 'B+', 3)
c6 = CourseRecord(comp1220, 'A+', 3)
c7 = CourseRecord(comp2140, 'B', 3)
c8 = CourseRecord(comp2171, 'B+', 3)
c9 = CourseRecord(comp2190, 'A', 3)
c10 = CourseRecord(comp2201, 'B+', 3)
c11 = CourseRecord(comp2211, 'A', 3)
c12 = CourseRecord(comp2340, 'A', 3)
c13 = CourseRecord(comp3101, 'A', 3)
c14 = CourseRecord(comp3161, 'A+', 3)
c15 = CourseRecord(comp3220, 'A', 3)
c16 = CourseRecord(comp3901, 'A+', 3)
c17 = CourseRecord(foun1401, 'A-', 3)
c18 = CourseRecord(foun1301, 'A+', 3)
c19 = CourseRecord(span1001, 'A+', 3)

t1 = TermRecord("2019/2020", 1, [c1, c2, c3, c4, c5, c6])
t2 = TermRecord("2019/2020", 2, [c8, c9, c10, c11, c12, c7, c17])
t3 = TermRecord("2020/2021", 1, [c13, c14, c15, c16, c18, c19])

student_record1 = StudentRecord("Jane", "Mona", "FST", "BSC_CS", "2019/2020", [t1, t2, t3])

# print(sr.course_history)


# print(CS_Core.is_fulfilled(sr))
print(BSC_CS.check_requirements(student_record1))
