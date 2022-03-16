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
        self.type = None
        self.code = None
        self.name = None
        self.start_year = None
        self.end_year = None
        self.faculty = None
        self.department = None
        self.parent = None
        self.semester = []
        self.prerequisite = []
        self.corequisite = []
        self.antirequisite = []
        self.min_credits = 0
        self.max_credits = 0
        self.description = ""
        self.tag = []
        self.state = False

    def is_grouping(self):
        return self.type == "grouping"

    def is_module(self):
        return self.type == "module"

    def __repr__(self):
        return f'{self.name}'


class ANDNode(Node):
    """
    True if all sub-objectives are fulfilled (True)
    """
    def __init__(self):
        super().__init__()

    def is_fulfilled(self, record):
        modules_taken = list(module for module in [term.courses for term in record.course_history])[0]
        if not self.is_grouping():
            if self.prerequisite == []:
                if self.code in [c.course.code for c in modules_taken]:
                    self.state = True
            else:
                prerequisite_states = []
                for module in self.prerequisite:
                    prerequisite_states.extend([module.is_fulfilled(record)])
                passed = self.code in [c.course.code for c in modules_taken]
                print(passed)
                prerequisite_states.append(passed)
                self.state = all(prerequisite_states)
                print(prerequisite_states)
        else:
            prerequisite_states = []
            for requirement in self.prerequisite:
                prerequisite_states.extend([requirement.is_fulfilled(record)])
            self.state = all(prerequisite_states)
            print(prerequisite_states)
        return self.state




class ORNode(Node):
    """
    True if any sub-objective is fulfilled (True)
    """
    def __init__(self):
        super().__init__()

    def is_fulfilled(self, record): # pass in student transcript object
        modules_taken = list(module for module in [term.courses for term in record.course_history])[0]
        if not self.is_grouping():
            if self.prerequisite == []:
                if self.code in [c.course.code for c in modules_taken]:
                    self.state = True
            else:
                prerequisite_states = []
                for module in self.prerequisite:
                    prerequisite_states.extend([module.is_fulfilled(record)])
                passed = self.code in [c.course.code for c in modules_taken]
                print(passed)
                prerequisite_states.append(passed)
                self.state = any(prerequisite_states)
                print(prerequisite_states)
        else:
            prerequisite_states = []
            for requirement in self.prerequisite:
                prerequisite_states.extend([requirement.is_fulfilled(record)])
            self.state = any(prerequisite_states)
            print(prerequisite_states)
        return self.state


# def postorder_traversal_iteratively(root: 'Node'): # pass in tree and student record
#     if not root:
#         return []
#     stack = [root]
#     last = None

#     while stack:
#         root = stack[-1]
#         if not root.prerequisite or last and (last in root.prerequisite):
#             '''
#             add current node logic here
#             '''
#             print(root.name)

#             stack.pop()
#             last = root
#         else:
#             for child in root.prerequisite[::-1]:
#                 stack.append(child)


class CourseRecord:
    def __init__(self, course, grade, cr) -> None:
        # self.name = name
        self.course = course
        self.grade = grade
        self.credits_earned = cr

    def __repr__(self) -> str:
        return self.course.code


class TermRecord:
    def __init__(self, year, sem) -> None:
        self.academic_year = year
        self.semester = sem
        self.courses = []


class StudentRecord:
    def __init__(self, name, campus, faculty, prog, start_year) -> None:
        self.name = name
        self.campus = campus
        self.faculty = faculty
        self.programme = prog
        self.enrollment_year = start_year
        self.major1 = None
        self.major2 = None
        self.minor1 = None
        self.minor2 = None
        self.course_history = []


# Core Courses
math1152 = ANDNode()
math1152.code = "MATH1152"
math1152.name = "Introduction to Formal Mathematics"
math1152.semester.extend([2])
math1152.min_credits = 3
math1152.type = "module"

comp1210 = ANDNode()
comp1210.code = "COMP1210"
comp1210.name = "Mathematics for Computing"
comp1210.semester.extend([1])
comp1210.min_credits = 3
comp1210.type = "module"

comp1220 = ANDNode()
comp1220.code = "COMP1220"
comp1220.name = "Computing and Society"
comp1220.semester.extend([2])
comp1220.min_credits = 3
comp1220.type = "module"

comp1126 = ANDNode()
comp1126.code = "COMP1126"
comp1126.name = "Introduction to Computing I"
comp1126.semester.extend([1])
comp1126.min_credits = 3
comp1126.type = "module"

comp1127 = ANDNode()
comp1127.code = "COMP1127"
comp1127.name = "Introduction to Computing II"
comp1127.semester.extend([1])
comp1127.min_credits = 3
comp1127.prerequisite.extend([comp1126])
comp1127.type = "module"

comp1161 = ANDNode()
comp1161.code = "COMP1161"
comp1161.name = "Object-Oriented Programming"
comp1161.semester.extend([2])
comp1161.min_credits = 3
comp1161.prerequisite.extend([comp1126, comp1127])
comp1161.type = "module"

comp2140 = ANDNode()
comp2140.code = "COMP2140"
comp2140.name = "Software Engineering"
comp2140.semester.extend([1])
comp2140.min_credits = 3
comp2140.prerequisite.extend([comp1126, comp1127])
comp2140.type = "module"

comp2171 = ANDNode()
comp2171.code = "COMP2171"
comp2171.name = "Object-Oriented Design and Implementation"
comp2171.semester.extend([2])
comp2171.min_credits = 3
comp2171.prerequisite.extend([comp2140])
comp2171.type = "module"

comp2201 = ORNode()
comp2201.code = "COMP2201"
comp2201.name = "Discrete Mathematics"
comp2201.semester.extend([1])
comp2201.min_credits = 3
comp2201.prerequisite.extend([comp1210, math1152])
comp2201.type = "module"

comp2211 = ANDNode()
comp2211.code = "COMP2211"
comp2211.name = "Analysis of Algorithms"
comp2211.semester.extend([2])
comp2211.min_credits = 3
comp2211.prerequisite.extend([comp1161, comp1210])
comp2211.type = "module"

comp2190 = ANDNode()
comp2190.code = "COMP2190"
comp2190.name = "Net-centric Computing"
comp2190.semester.extend([1])
comp2190.min_credits = 3
comp2190.prerequisite.extend([comp1161, comp1210])
comp2190.type = "module"

comp2340 = ANDNode()
comp2340.code = "COMP2340"
comp2340.name = "Computer System Organization"
comp2340.semester.extend([1])
comp2340.min_credits = 3
comp2340.prerequisite.extend([comp1161, comp1210])
comp2340.type = "module"

comp3101 = ANDNode()
comp3101.code = "COMP3101"
comp3101.name = "Operating Systems"
comp3101.semester.extend([1])
comp3101.min_credits = 3
comp3101.prerequisite.extend([comp2340])
comp3101.type = "module"

comp3161 = ANDNode()
comp3161.code = "COMP3161"
comp3161.name = "Database Management Systems"
comp3161.semester.extend([2])
comp3161.min_credits = 3
comp3161.prerequisite.extend([comp1161, comp1210])
comp3161.type = "module"

comp3220 = ANDNode()
comp3220.code = "COMP3220"
comp3220.name = "Principles of Artificial Intelligence"
comp3220.semester.extend([1])
comp3220.min_credits = 3
comp3220.prerequisite.extend([comp2201, comp2211])
comp3220.type = "module"

comp3901 = ANDNode()
comp3901.code = "COMP3901"
comp3901.name = "Capstone Project"
comp3901.semester.extend([1, 2])
comp3901.min_credits = 3
# subreq = ORNode()
# subreq.min_credits = 6
# subreq.prerequisite.extend(["advanced"])
comp3901.prerequisite.extend([comp2140, comp2211])
comp3901.type = "module"

# Foundation Courses
foun1401 = ANDNode()
foun1401.name = "Critical Reading and Writing"
foun1401.code = "FOUN1401"
foun1401.min_credits = 3
foun1401.type = "module"

# Groupings
COMP_FOUN = ORNode()
COMP_FOUN.name = "Compulsory Foundation"
COMP_FOUN.min_credits = 3
COMP_FOUN.prerequisite.extend([foun1401])
COMP_FOUN.type = "grouping"

OPT_FOUN2 = ORNode()
OPT_FOUN2.name = "Other Foundation"
OPT_FOUN2.min_credits = 0
OPT_FOUN2.max_credits = 6
OPT_FOUN2.type = "grouping"

FL = ORNode()
FL.name = "Foreign Language"
FL.min_credits = 0
FL.max_credits = 6
FL.type = "grouping"

OPT_FOUN = ORNode()
OPT_FOUN.name = "Optional Foundation"
OPT_FOUN.min_credits = 6
OPT_FOUN.prerequisite.extend([OPT_FOUN2, FL])
OPT_FOUN.type = "grouping"

FOUNDATION = ANDNode()
FOUNDATION.name = "Foundation"
FOUNDATION.min_credits = 9
FOUNDATION.prerequisite.extend([COMP_FOUN, OPT_FOUN])
FOUNDATION.type = "grouping"

CS_Core = ANDNode()
CS_Core.name = "CS Core"
CS_Core.min_credits = 30
CS_Core.prerequisite.extend([comp1210, comp1220, comp1126, comp1127, comp1161,
                             comp2140, comp2171, comp2201, comp2211, comp2190,
                             comp2340, comp3101, comp3161, comp3220, comp3901])
CS_Core.type = "grouping"

CS = ANDNode()
CS.name = "Computer Science"
CS.type = "Major"
CS.faculty = "Science and Technology"
CS.min_credits = 39
CS.prerequisite.extend([CS_Core])
CS.type = "grouping"

BSc = ANDNode()
BSc.name = "BSc"
BSc.faculty = "Science and Technology"
BSc.type = "UG Degree"
BSc.min_credits = 93
BSc.prerequisite.extend([CS, FOUNDATION])
BSc.type = "grouping"


# print(BSc.prerequisite)
# print(CS.prerequisite)
# print(CS_Core.prerequisite)
# print(comp2201.prerequisite)


# postorder_traversal_iteratively(BSc)


c1 = CourseRecord(math1152, 'A', 3)
c2 = CourseRecord(comp1126, 'A+', 3)
c3 = CourseRecord(comp1127, 'A', 3)
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
c14 = CourseRecord(comp3161, 'A', 3)
c15 = CourseRecord(comp3220, 'A', 3)
c16 = CourseRecord(comp3901, 'A', 3)

t1 = TermRecord("2019/2020", 1)
t1.courses.extend([c1, c2, c3, c4, c5, c6, c7, c8, c9, c11, c12, c13, c14, c15, c16])

sr = StudentRecord("Jane", "Mona", "FST", "BSc", "2019/2020")
sr.course_history.extend([t1])

# print(sr.course_history)


print(CS_Core.is_fulfilled(sr))