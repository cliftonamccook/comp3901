import json

with open('sampledata/courses.json', 'r') as coursefile:
    courses = json.load(coursefile)

programmedata = {
    "name": "BACHELOR OF SCIENCE - COMPUTER SCIENCE",
    "code": "BSCCOMPSCI",
    "faculty": "Science and Technology",
    "operation": "AND",
    "minimum_credits": 93,
    "requirements": [
            {
                "name": "INSTITUTIONAL",
                "code": "UWIINST",
                "operation": "AND",
                "minimum_credits": 9,
                "requirements": [
                    {
                        "name": "FST INSTITUTIONAL MANDATORY",
                        "code": "FSTMANDFOUN",
                        "operation": "OR",
                        "minimum_credits": 3,
                        "requirements": [
                            courses["FOUN1401"],
                            courses["FOUN1019"]
                        ]
                    },
                    {
                        "name": "FST INSTITUTIONAL OPTIONS",
                        "code": "FSTINSTOPT",
                        "operation": "OR",
                        "minimum_credits": 6,
                        "requirements": [
                            {
                                "name": "Foreign Language",
                                "code": "FOERIGNLANG",
                                "operation": "OR",
                                "minimum_credits": 0,
                                "requirements": [
                                    courses["SPAN0101"],
                                    courses["SPAN1000"]
                                ]
                            },
                            courses["FOUN1301"],
                            courses["FOUN1101"]
                        ]
                    }
                ]
            },
        {
                "name": "FST INTRODUCTORY",
                "code": "INTRO",
                "operation": "AND",
                "minimum_credits": 24,
                "requirements": [
                    {
                        "name": "COMPUTER SCIENCE MAJOR INTRODUCTORY CORE",
                        "code": "FSTCSCOREINTRO",
                        "operation": "AND",
                        "minimum_credits": 15,
                        "requirements": [
                            courses["COMP1126"],
                            courses["COMP1127"],
                            courses["COMP1210"],
                            courses["COMP1220"],
                            courses["COMP1161"]
                        ]
                    },
                    {
                        "name": "INTRODUCTORY RESTRICTED ELECTIVES",
                        "code": "INTRORELECT",
                        "operation": "OR",
                        "minimum_credits": 3,
                        "requirements": [
                            courses["MATH1142"],
                            courses["MATH1151"],
                            courses["MATH1141"],
                            courses["STAT1001"],
                            courses["GEOG1131"],
                            courses["GEOG1132"]
                        ]
                    },
                    {
                        "name": "INTRODUCTORY FREE ELECTIVES",
                        "code": "INTROFELECT",
                        "operation": "OR",
                        "minimum_credits": 6,
                        "requirements": [
                            courses["ECON1000"],
                            courses["ECON1012"],
                            courses["SOCI1002"],
                            courses["HIST1703"],
                            courses["HIST1801"],
                            courses["HIST1901"],
                        ]
                    }
                ]
            },
        {
                "name": "FST ADVANCED",
                "code": "FSTADV",
                "operation": "AND",
                "minimum_credits": 60,
                "requirements": [
                    {
                        "name": "COMPUTER SCIENCE MAJOR ADVANCED",
                        "code": "FSTCSADV",
                        "operation": "AND",
                        "minimum_credits": 39,
                        "requirements": [
                            {
                                "name": "COMPUTER SCIENCE MAJOR LEVEL 2 CORE",
                                "code": "FSTCSADV",
                                "operation": "AND",
                                "minimum_credits": 18,
                                "requirements": [
                                    courses["COMP2140"],
                                    courses["COMP2171"],
                                    courses["COMP2190"],
                                    courses["COMP2201"],
                                    courses["COMP2211"],
                                    courses["COMP2340"],
                                ]
                            },
                            {
                                "name": "COMPUTER SCIENCE MAJOR LEVEL 3 CORE",
                                "code": "FSTCSADV",
                                "operation": "AND",
                                "minimum_credits": 12,
                                "requirements": [
                                    courses["COMP3101"],
                                    courses["COMP3161"],
                                    courses["COMP3220"],
                                    courses["COMP3901"]
                                ]
                            },
                            {
                                "name": "COMPUTER SCIENCE MAJOR ADVANCED RESTRICTED ELECTIVES",
                                "code": "FSTCSADVRELECT",
                                "operation": "OR",
                                "minimum_credits": 9,
                                "requirements": [
                                    courses["COMP2130"],
                                    courses["COMP2802"],
                                    courses["COMP3162"],
                                    courses["COMP3191"],
                                    courses["COMP3192"],
                                    courses["COMP3410"],
                                    courses["COMP3652"],
                                    courses["COMP3702"],
                                    courses["COMP3801"],
                                    courses["COMP3802"],
                                    courses["COMP3911"],
                                    courses["COMP3912"],
                                    courses["INFO3105"],
                                    courses["INFO3110"],
                                    courses["INFO3155"],
                                    courses["INFO3170"],
                                    courses["INFO2180"],
                                    courses["INFO3180"],
                                    courses["INFO3435"],
                                    courses["SWEN2165"],
                                    courses["SWEN3130"],
                                    courses["SWEN3145"],
                                    courses["SWEN3165"],
                                    courses["SWEN3185"]
                                ]
                            }
                        ]
                    },
                    {
                        "name": "ADVANCED FREE ELECTIVES",
                        "code": "FSTCSADV",
                        "operation": "OR",
                        "minimum_credits": 21,
                        "requirements": [
                            courses["HIST2405"],
                            courses["HIST2503"],
                            courses["HIST2602"],
                            courses["PHIL2028"],
                            courses["PHIL2601"],
                            courses["PHIL2602"],
                            courses["ECON3003"],
                            courses["ECON3005"],
                            courses["MGMT3058"],
                            courses["MGMT3031"]
                        ]
                    }
                ]
            }
    ]
}
