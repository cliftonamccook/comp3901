import json

records = {
    "computer science student": {
        "name": "Jane Doe",
        "id": 620000000,
        "campus": "Mona",
        "faculty": "Science and Technology",
        "programme": "BSc Computer Science",
        "course history": [
            {
                "term": "2019-2020-S1",
                "course records": [
                    {
                        "name": "Introduction to Computing I",
                        "code": "COMP1126",
                        "grade": "C-"
                    },
                    {
                        "name": "Calculus I",
                        "code": "MATH1142",
                        "grade": "B+"
                    },
                    {
                        "name": "Introductory Linear Algebra and Analytic Geometry",
                        "code": "MATH1141",
                        "grade": "A"
                    },
                    {
                        "name": "Introduction to Computing II",
                        "code": "COMP1127",
                        "grade": "A"
                    },
                    {
                        "name": "Mathematics for Computing",
                        "code": "COMP1210",
                        "grade": "A"
                    },
                    {
                        "name": "Critical Reading and Writing in Science and Technology and Medical Sciences",
                        "code": "FOUN1401",
                        "grade": "A-"
                    }
                ]
            },
            {
                "term": "2019-2020-S2",
                "course records": [
                    {
                        "name": "Computing and Society",
                        "code": "COMP1220",
                        "grade": "A+"
                    },
                    {
                        "name": "Caribbean Civilization",
                        "code": "FOUN1101",
                        "grade": "A+"
                    },
                    {
                        "name": "Principles of Economics II",
                        "code": "ECON1012",
                        "grade": "A+"
                    },
                    {
                        "name": "Introduction to History",
                        "code": "HIST1703",
                        "grade": "A+"
                    },
                    {
                        "name": "Object-Oriented Programming",
                        "code": "COMP1161",
                        "grade": "A"
                    },
                    {
                        "name": "Law, Governance, Economy & Society",
                        "code": "FOUN1301",
                        "grade": "B+"
                    }
                ]
            },
            {
                "term": "2020-2021-S1",
                "course records": [
                    {
                        "name": "Software Engineering",
                        "code": "COMP2140",
                        "grade": "A+"
                    },
                    {
                        "name": "Net-Centric Computing",
                        "code": "COMP2190",
                        "grade": "A+"
                    },
                    {
                        "name": "Discrete Mathematics for Computer Science",
                        "code": "COMP2201",
                        "grade": "A+"
                    },
                    {
                        "name": "Dynamic Web Development I",
                        "code": "INFO2180",
                        "grade": "A+"
                    },
                    {
                        "name": "War and Conflict",
                        "code": "HIST2405",
                        "grade": "A"
                    },
                    {
                        "name": "Imperialism Since 1918",
                        "code": "HIST2602",
                        "grade": "B+"
                    }
                ]
            },
            {
                "term": "2020-2021-S2",
                "course records": [
                    {
                        "name": "Analysis of Algorithms",
                        "code": "COMP2211",
                        "grade": "A"
                    },
                    {
                        "name": "Computer System Organization",
                        "code": "COMP2340",
                        "grade": "A+"
                    },
                    {
                        "name": "Object-Oriented Design and Implementation",
                        "code": "COMP2171",
                        "grade": "A+"
                    },
                    {
                        "name": "Dynamic Web Development II",
                        "code": "INFO3180",
                        "grade": "A+"
                    },
                    {
                        "name": "Systems Programming",
                        "code": "COMP2130",
                        "grade": "A"
                    },
                    {
                        "name": "History of Modern China",
                        "code": "HIST2503",
                        "grade": "B+"
                    }
                ]
            },
            {
                "term": "2021-2022-S1",
                "course records": [
                    {
                        "name": "Operating Systems",
                        "code": "COMP3101",
                        "grade": "A"
                    },
                    {
                        "name": "Database Management Systems",
                        "code": "COMP3161",
                        "grade": "A+"
                    },
                    {
                        "name": "Principles of Artificial Intelligence",
                        "code": "COMP3220",
                        "grade": "A+"
                    },
                    {
                        "name": "Capstone Project",
                        "code": "COMP3901",
                        "grade": "A+"
                    },
                    {
                        "name": "African Philosophy I",
                        "code": "PHIL2602",
                        "grade": "A"
                    },
                    {
                        "name": "Game Theory",
                        "code": "ECON3003",
                        "grade": "B+"
                    }
                ]
            },
            {
                "term": "2021-2022-S2",
                "course records": [
                    {
                        "name": "E-Commerce",
                        "code": "INFO3435",
                        "grade": "A"
                    },
                    {
                        "name": "Information Assurance and Security",
                        "code": "INFO3155",
                        "grade": "A+"
                    },
                    {
                        "name": "User Interface Design for IT",
                        "code": "INFO3170",
                        "grade": "A+"
                    },
                    {
                        "name": "African Philosophy II",
                        "code": "PHIL2602",
                        "grade": "A+"
                    },
                    {
                        "name": "New Venture Management",
                        "code": "MGMT3058",
                        "grade": "A"
                    },
                    {
                        "name": "Business Strategy & Policy",
                        "code": "MGMT3031",
                        "grade": "B+"
                    }
                ]
            }
            
        ]
    },

    "general chemistry strudent": {
        "name": "Jane Doe",
        "id": 620000001,
        "campus": "Mona",
        "faculty": "Science and Technology",
        "programme": "BSc General Chemistry",
        "course history": [
            {
                "term": "2019-2020-S1",
                "course records": [
                    {
                        "name": "Introductory Chemistry I",
                        "code": "CHEM1810",
                        "grade": "A-"
                    },
                    {
                        "name": "Introductory Chemistry II",
                        "code": "CHEM1820",
                        "grade": "A"
                    },
                    {
                        "name": "Introductory Chemistry Laboratory I",
                        "code": "CHEM1811",
                        "grade": "A"
                    },
                    {
                        "name": "Calculus I",
                        "code": "MATH1142",
                        "grade": "B+"
                    },
                    {
                        "name": "Introductory Linear Algebra and Analytic Geometry",
                        "code": "MATH1141",
                        "grade": "A"
                    },
                    {
                        "name": "Critical Reading and Writing in Science and Technology and Medical Sciences",
                        "code": "FOUN1401",
                        "grade": "A-"
                    }
                ]
            },
            {
                "term": "2019-2020-S2",
                "course records": [
                    {
                        "name": "Introductory Chemistry III",
                        "code": "CHEM1910",
                        "grade": "A+"
                    },
                    {
                        "name": "Introductory Chemistry Laboratory II",
                        "code": "CHEM1911",
                        "grade": "A+"
                    },
                    {
                        "name": "Introductory Chemistry IV",
                        "code": "CHEM1920",
                        "grade": "A+"
                    },
                    {
                        "name": "Principles of Economics I",
                        "code": "ECON1000",
                        "grade": "A"
                    },
                    {
                        "name": "Introduction to History",
                        "code": "HIST1703",
                        "grade": "A"
                    },
                    {
                        "name": "Law, Governance, Economy & Society",
                        "code": "FOUN1301",
                        "grade": "B+"
                    }
                ]
            },
            {
                "term": "2020-2021-S1",
                "course records": [
                    {
                        "name": "Chemical Analysis A",
                        "code": "CHEM2010",
                        "grade": "A+"
                    },
                    {
                        "name": "Chemical Analysis Laboratory I",
                        "code": "CHEM2011",
                        "grade": "A+"
                    },
                    {
                        "name": "Organic Chemistry A",
                        "code": "CHEM2210",
                        "grade": "A+"
                    },
                    {
                        "name": "Organic Chemistry Laboratory I",
                        "code": "CHEM2211",
                        "grade": "A+"
                    },
                    {
                        "name": "Physical Chemistry A",
                        "code": "CHEM2310",
                        "grade": "A+"
                    },
                    {
                        "name": "Beginners' Spanish",
                        "code": "SPAN0101",
                        "grade": "B+"
                    }
                ]
            },
            {
                "term": "2020-2021-S2",
                "course records": [
                    {
                        "name": "Inorganic Chemistry A",
                        "code": "CHEM2110",
                        "grade": "A+"
                    },
                    {
                        "name": "Inorganic Chemistry Laboratory I",
                        "code": "CHEM2111",
                        "grade": "A+"
                    },
                    {
                        "name": "Physical Chemistry Laboratory I",
                        "code": "CHEM2311",
                        "grade": "A+"
                    },
                    {
                        "name": "Natural Products Chemistry",
                        "code": "CHEM3212",
                        "grade": "A+"
                    }
                ]
            },
            {
                "term": "2021-2022-S1",
                "course records": [
                    {
                        "name": "Inorganic Chemistry B",
                        "code": "CHEM3110",
                        "grade": "A+"
                    },
                    {
                        "name": "Applications of Organic Chemistry in Medicine and Agriculture",
                        "code": "CHEM3213",
                        "grade": "A+"
                    },
                    {
                        "name": "Chemistry of Materials",
                        "code": "CHEM3312",
                        "grade": "A+"
                    }
                ]
            },
            {
                "term": "2021-2022-S2",
                "course records": [
                    {
                        "name": "Physical Chemistry B",
                        "code": "CHEM3310",
                        "grade": "A+"
                    },
                    {
                        "name": "Chemical Analysis Laboratory II",
                        "code": "CHEM3011",
                        "grade": "A+"
                    },
                    {
                        "name": "Inorganic Chemistry Laboratory II",
                        "code": "CHEM3111",
                        "grade": "A+"
                    }
                ]
            }
            
        ]
    },
    "620000002": {},
    "620000003": {},
    "620000004": {}
}

with open('sampledata/json/student records.json', 'w') as json_file:
  json.dump(records, json_file)
