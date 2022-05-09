import json

with open('sampledata/courses.json', 'r') as coursefile:
    courses = json.load(coursefile)

programmedata = {
    "name": "BACHELOR OF SCIENCE - GENERAL CHEMISTRY",
    "code": "BSCGENCHEM",
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
                    "name": "GENERAL CHEMISTRY MAJOR INTRODUCTORY CORE",
                    "code": "FSTGCCOREINTRO",
                    "operation": "AND",
                    "minimum_credits": 18,
                    "requirements": [
                        {
                            "name": "GENERAL CHEMISTRY L1 MATH REQUIREMENT",
                            "code": "FSTGCMATHL1",
                            "operation": "OR",
                            "minimum_credits": 6,
                            "requirements": [
                                courses["MATH1142"],
                                courses["MATH1151"],
                                courses["MATH1141"],
                                courses["STAT1001"]
                            ]
                        },
                        {
                            "name": "GENERAL CHEMISTRY L1 CORE",
                            "code": "FSTGCMATHL1",
                            "operation": "OR",
                            "minimum_credits": 12,
                            "requirements": [
                                courses["CHEM1901"],
                                courses["CHEM1902"]
                            ]
                        }
                    ]
                },
                {
                    "name": "INTRODUCTORY RESTRICTED ELECTIVES GEN CHEM",
                    "code": "INTRORELECTGENCHEM",
                    "operation": "OR",
                    "minimum_credits": 6,
                    "requirements": [
                        courses["MATH1142"],
                        courses["MATH1151"],
                        courses["MATH1141"],
                        courses["STAT1001"],
                        courses["GEOG1131"],
                        courses["GEOG1132"]
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
                    "name": "GENERAL CHEMISTRY MAJOR ADVANCED",
                    "code": "FSTGCADV",
                    "operation": "AND",
                    "minimum_credits": 39,
                    "requirements": [
                        {
                            "name": "GENERAL CHEMISTRY MAJOR LEVEL 2 CORE",
                            "code": "FSTGCADVL2CORE",
                            "operation": "AND",
                            "minimum_credits": 20,
                            "requirements": [
                                courses["CHEM2010"],
                                courses["CHEM2011"],
                                courses["CHEM2110"],
                                courses["CHEM2111"],
                                courses["CHEM2210"],
                                courses["CHEM2211"],
                                courses["CHEM2310"],
                                courses["CHEM2311"]
                            ]
                        },
                        {
                            "name": "GENERAL CHEMISTRY MAJOR LEVEL 3 CORE",
                            "code": "FSTGCADVL3CORE",
                            "operation": "AND",
                            "minimum_credits": 19,
                            "requirements": [
                                {
                                    "name": "ORGANIC+PHYSICAL CHEMISTRY 1",
                                    "code": "FSTORGPHYSCHEMADV1",
                                    "operation": "OR",
                                    "minimum_credits": 6,
                                    "requirements": [
                                        courses["CHEM3010"],
                                        courses["CHEM3110"],
                                        courses["CHEM3210"],
                                        courses["CHEM3310"]
                                    ]
                                },
                                {
                                    "name": "ORGANIC+PHYSICAL CHEMISTRY 2",
                                    "code": "FSTORGPHYSCHEMADV2",
                                    "operation": "OR",
                                    "minimum_credits": 4,
                                    "requirements": [
                                        courses["CHEM3011"],
                                        courses["CHEM3111"],
                                        courses["CHEM3211"],
                                        courses["CHEM3311"]
                                    ]
                                },
                                {
                                    "name": "CHEM GROUPING",
                                    "code": "FSTCHEMG",
                                    "operation": "OR",
                                    "minimum_credits": 3,
                                    "requirements": [
                                        courses["CHEM3112"],
                                        courses["CHEM3212"],
                                        courses["CHEM3213"],
                                        courses["CHEM3312"],
                                        courses["CHEM3313"]
                                    ]
                                },
                                {
                                    "name": "CHEM RESTRICTED ELECTIVES ADV",
                                    "code": "FSTGCRADVELECT",
                                    "operation": "AND",
                                    "minimum_credits": 6,
                                    "requirements": [
                                        courses["CHEM2410"],
                                        courses["CHEM2510"],
                                        courses["CHEM2511"],
                                        courses["CHEM3010"]
                                    ]
                                }
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


# with open('chem.json', 'w') as json_file:
#   json.dump(programmedata, json_file)
