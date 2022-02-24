const foun1401 = {
    prefix: "FOUN",
    code: "FOUN1401",
    title: "Critical Reading and Writing in Science and Technology and Medical Sciences",
    level: 1,
    credits: 3,
    semester: [1,2],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const foun1019 = {
    prefix: "FOUN",
    code: "FOUN1019",
    title: "Critical Reading and Writing in the Disciplines",
    level: 1,
    credits: 3,
    semester: [1,2],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const foun1101 = {
    prefix: "FOUN",
    code: "FOUN1101",
    title: "Caribbean Civilization",
    level: 1,
    credits: 3,
    semester: [1],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const foun1301 = {
    prefix: "FOUN",
    code: "FOUN1301",
    title: "Law, Governance, Economy and Society",
    level: 1,
    credits: 3,
    semester: [1],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

// COMP COURSES

const comp1126 = {
    prefix: "COMP",
    code: "COMP1126",
    title: "Introduction to Computing I",
    level: 1,
    credits: 3,
    semester: [1],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp1127 = {
    prefix: "COMP",
    code: "COMP1127",
    title: "Introduction to Computing II",
    level: 1,
    credits: 3,
    semester: [1],
    prerequisite: [3,[comp1126]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp1161 = {
    prefix: "COMP",
    code: "COMP1161",
    title: "Object-Oriented Programming",
    level: 1,
    credits: 3,
    semester: [2],
    prerequisite: [6,[comp1126,comp1127]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp1210 = {
    prefix: "COMP",
    code: "COMP1210",
    title: "Mathematics for Computing",
    level: 1,
    credits: 3,
    semester: [1],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp1220 = {
    prefix: "COMP",
    code: "COMP1220",
    title: "Computing and Society",
    level: 1,
    credits: 3,
    semester: [2],
    prerequisite: [],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp2140 = {
    prefix: "COMP",
    code: "COMP2140",
    title: "Software Engineering",
    level: 2,
    credits: 3,
    semester: [1],
    prerequisites: [9,[comp1126,comp1127,comp1161]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp2171 = {
    prefix: "COMP",
    code: "COMP2171",
    title: "Object-Oriented Design and Implementation",
    level: 2,
    credits: 3,
    semester: [2],
    prerequisite: [3,[comp2140]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp2190 = {
    prefix: "COMP",
    code: "COMP2190",
    title: "Net-Centric Computing",
    level: 2,
    credits: 3,
    semester: [1],
    prerequisite: [6,[comp1161,comp1210]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp2201 = {
    prefix: "COMP",
    code: "COMP2201",
    title: "Discrete Mathematics for Computer Science",
    level: 2,
    credits: 3,
    semester: [1],
    prerequisite: [3,[comp1210]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp2211 = {
    prefix: "COMP",
    code: "COMP2211",
    title: "Analysis of Algorithms",
    level: 2,
    credits: 3,
    semester: [2],
    prerequisite: [6,[comp1161,comp1210]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp2340 = {
    prefix: "COMP",
    code: "COMP2340",
    title: "Computer System Organization",
    level: 2,
    credits: 3,
    semester: [2],
    prerequisite: [6,[comp1161,comp1210]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp3101 = {
    prefix: "COMP",
    code: "COMP3101",
    title: "Operating Systems",
    level: 3,
    credits: 3,
    semester: [1],
    prerequisite: [3,[comp2340]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp3220 = {
    prefix: "COMP",
    code: "COMP3220",
    title: "Principles of Artificial Intelligence",
    level: 3,
    credits: 3,
    semester: [1],
    prerequisites: [6,[comp2201,comp2211]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp3161 = {
    prefix: "COMP",
    code: "COMP3161",
    title: "Introduction to Database Management Systems",
    level: 3,
    credits: 3,
    semester: [2],
    prerequisite: [6,[comp1210,comp1161]],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};

const comp3901 = {
    prefix: "COMP",
    code: "COMP3901",
    title: "Capstone Project",
    level: 3,
    credits: 3,
    semester: [1,2],
    prerequisite: [
        [6,[comp2140,comp2211]],
        [6,["advanced"]],
    ],
    corequisite: [],
    antirequisite: [],
    description: "",
    tags: []
};


const BSC_FST = {
    university: "UWI",
    campus: "Mona",
    title: "Bachelor of Science",
    faculty: "Science and Technology",
    description: "",
    minimumCredits: 93,
    requirements: [
            [3,[foun1401,foun1019],"compulsory foundation"],
            [6,[foun1301,foun1101],"optional foundation"],
            [18,[],"introductory faculty"],
            [6,[],"introductory free elective"]
            [60,[],"advanced"]
        ]
};

const csMajor = {
    BSC_FST,
    department: "Computer Science",
    type: "major",
    description: "",
    minimumCredits: 54,
    requirements: [
            [15,[comp1210,comp1220,comp1126,comp1127,comp1161],"introductory core"],
            [30,[comp2211,comp2201,comp2140,comp2340,comp2171,comp2190,comp3101,comp3220,comp3161,comp3901],"advanced core"],
            [9,[],"advanced elective"]
        ]
};


const studentRecord = {
    campus: "Mona",
    faculty: "Science and Technology",
    programme: [],
    name: "Suzie",
    id: 320059412,
    coursesDone: [comp1210, comp1126, comp1127],
    interests: []
};

function checkProgress(){
    // Check whether a student has fulfilled the requirements to complete a programme.
    var remainder = {};
    var r = csMajor.requirements.length;
    var c = studentRecord.coursesDone.length;
    for(i=0; i<r; i++){
        let group = csMajor.requirements[i][2];
        let creds = csMajor.requirements[i][0];
        remainder[group] = creds;
    }
    for(i=0; i<r; i++){
      for(j=0; j<c; j++){
        var grouplist = csMajor.requirements[i][1];
        var courseDone = studentRecord.coursesDone[j];
        var group = csMajor.requirements[i][2];
        const found = grouplist.some(el => el.title === courseDone.title);
        if (found){
            remainder[group] = remainder[group] - courseDone.credits;
        }
      }
    }
    console.log(remainder);
    // return remainder;
}

checkProgress();