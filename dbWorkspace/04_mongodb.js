// 컬렉션 생성
use('new_db')
db.createCollection('candidate')


db.candidate.insertMany([
    {
        "memNo":1,
        "country":"korea",
        "city":"seoul",
        "member" : {
            "memFirstName":"jung",
            "memLastName":"kim"
        }
    },
    {
        "memNo":2,
        "country":"japan",
        "city":"yokohama",
        "member" : {
            "memFirstName":"tuzuki",
            "memLastName":"chihiro"
        }
    },
    {
        "memNo":3,
        "country":"canada",
        "city":"toronto",
        "member" : {
            "memFirstName":"Olivia",
            "memLastName":"yang"
        }
    },
    {
        "memNo":4,
        "country":"usa",
        "city":"newyork",
        "member" : {
            "memFirstName":"michelle",
            "memLastName":"quan"
        }
    },
    {
        "memNo":5,
        "country":"korea",
        "city":"yeosu",
        "member" : {
            "memFirstName":"sanyong",
            "memLastName":"kim"
        }
    },
    {
        "memNo":6,
        "country":"canada",
        "city":"ottawa",
        "member" : {
            "memFirstName":"lorellai",
            "memLastName":"gilmore"
        }
    },
    {
        "memNo":7,
        "country":"japan",
        "city":"fukuoka",
        "member" : {
            "memFirstName":"katae",
            "memLastName":"hinata"
        }
    }
])

db.candidate.find()


// update : 특정 키로 검색하여 값 수정
// 도큐먼트 1개 수정 / 여러 개 수정

use('new_db')
db.candidate.updateOne(
    {"memNo":1},
    {$set:
    {"member.memLastName":"Lee"}}
)

db.candidate.find()

// 도큐먼트 여러 개 수정
db.candidate.updateMany(
    {"country":"korea"},
    {$set:
        {"city":"jeju"}
    }
)

// delete : 특정 키로 검색하여 삭제

// 도큐먼트 1개 삭제 
db.candidate.deleteOne({memNo:'1'})

// 도큐먼트 여러 개 삭제
db.candidate.deleteMany(
    {country:'canada'}
)

db.candidate.find()