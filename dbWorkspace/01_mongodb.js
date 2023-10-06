use('new_db')

db.product.find({'prdNo':"15"})

// 프로젝션 : 보여줄 필드 선택
// 1. 출력
db.product.find({'prdNo':'15'},{prdNo:1, prdName:1})

// show collections : shell 명령어 사용 못함 (오류)
// 모든 컬렉션 출력
db.getCollectionNames()

// 컬렉션 생성
db.createCollection('book2')

// 배열로 만들고 2개의 다큐먼트 넣기
db.product.insertMany([
    {
        "prdNo":"17",
        "prdName":"알뜰 냉장고",
        "prdPrice":50000,},
    {
        "prdNo":"18",
        "prdName":"알뜰 TV",
        "prdPrice":150000,
    }
])

prd1 = {
    "prdNo":  19,
        "prdName":"알뜰 냉장고2",
        "prdPrice":50000
    }

prd2 = {
    "prdNo":  20,
        "prdName":"알뜰 냉장고3",
        "prdPrice":50000
    }

db.product.insertMany([prd1, prd2])

use('new_db')
db.product.find({'prdNo':15},{prdNo:1, prdName:1})

use('new_db')
db.product.updateOne(
    {"prdNo":10},
    {"$set":
    {"prdPrice":777}
}
)

use("new_db")
db.product.find({'prdNo':10})


// 여러행 수정
db.book.updateMany(
    {'publisher.pubNo':3},
    {'$set':
        {'publisher.pubName':'정보출판'}
    }
)
db.book.find()

// Update : true : 조건에 해당되는 도큐먼트 없으면 새로 추가
db.book.updateOne(
    {'bookAuthor':'이길동'},
    {$set:
        {'book_author_first':'길동', 'book_author_last':'이'}},
    {upsert:true}
)
db.book.find()

use('new_db')
// delete
db.book.deleteOne({bookAuthor:'이길동'})
db.book.find()

// "키" : 따옴표 / 키:따옴표 없어도 오류 없음
db.book.deleteOne({prdMaker:'삼성전자'})
db.book.find()