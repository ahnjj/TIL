// 쿼리
// 연산자를 이용한 쿼리

// 비교 연산자
// 상품 가격이 1백만 이상인 도큐먼트
use('new_db')
db.product.find({prdPrice:{$gte:1000000}})

// 50만 이상~백만 미만(And)
use('new_db')
db.product.find({prdPrice:{$gte:500000, $lte:1000000}})

// 여러개의 필드에 조건 설정
// 가격 10000이상 이면서 재고 5개 이하인 도서
use('new_db')
db.book.find({bookPrice: {$gte:30000}, bookStock: {$lte : 5}})


// 논리 연산자
// 상품 제조회사가 '삼성전자' 또는 'LG전자'만 출력 : $or
use('new_db')
db.product.find(
    {
        $or:
        [
            { prdMaker:'삼성전자' },
            { prdMaker:'LG전자' }
        ]
    }
)

// $not : 부정
// 재고가 5 초과 안된것 gt (5이하)
use('new_db')
db.book.find({bookStock:{$not:{$gt:5}}})

// 도서 가격이 2만원 미만 이거나 3만원 이상인 도서 출력
use('new_db')
db.book.find(
    {
        $or:
        [
            {bookPrice: {$lt:20000}},
            {bookPrice: {$gte:30000}}
        ]
    }
 )
    


// 도서 가격이 2만원 이상 이거나 3만원 미만인 도서 출력
use('new_db')
db.book.find({bookPrice: {$gte:20000, $lt:30000}})
db.book.find(
    {
        $and:
        [
            {bookPrice: {$gte:20000}},
            {bookPrice: {$lt:30000}}
        ]
    }
 )

 // 문자열 검색
 // 검색 필드에 문자열 인덱스 설정해야 함
 // bookName과 bookAuthor 필드에 문자열 인덱스 생성
 use('new_db')
 db.book.createIndex({bookName:'text', bookAuthor:'text'})
 // $text, $search 연산자를 사용해서 문자열 검색
 db.book.find({$text:{$search : '프로그래밍'}})

 use('new_db')
 db.book.find({$text: {$search: '홍길동'}})

 // 정규식 : /정규표현/
 // 도서명이 '안'으로 시작하는 도서 출력
 use('new_db')
 db.book.find({bookName:/^안/})

// 도서명이 '밍'으로 끝나는 : $
 use('new_db')
 db.book.find({bookName:/밍$/})

 // 도서명이 '밍'으로 끝나는 도큐먼트 수 출력
 use('new_db')
 db.book.find({bookName:/밍$/}).count() // 5개

 // 도서명이 '밍'으로 끝나고, 가격이 25,000이상 ~ 30,000 이하인 도서
 use('new_db')
 db.book.find({
    $and:[
    {bookName:/밍$/,
    bookPrice: {$gte:25000, $lt:30000}}
    ]
})

// $regex : 한 필드에 여러 연산자를 같이 적용할 때 사용

use('new_db')
db.book.find({bookName: {$regex:/밍$/, $gte:'안', $lt:'자'}})


// // Array (배열 연산자)
use('new_db')
db.createCollection('inventory')

use('new_db')
db.inventory.insertMany([
    { item: "journal", qt : 25, tags: ['blank', 'red']},
    { item: "notebook", qt : 50, tags: ['red', 'blank']},
    { item: "paper", qt : 100, tags: []},
    { item: "planner", qt : 75, tags: ['blank', 'red']},
    { item: "postcard", qt : 45, tags: ['blue']}
])

// 'red'가 포함된 도큐먼트 출력
use('new_db')
db.inventory.find({tags:'red'})

// // 배열 안에서 값과 순서가 일치하는 도큐먼트 검색
use('new_db')
db.inventory.find({tags:['red','blank']})

// // $all : red, blank 순서 상관 없이 모두 만족
use('new_db')
db.inventory.find({tags: {$all:['red','blank']}})


use('new_db')
db.createCollection('fruits')

use('new_db')
db.fruits.insertOne({_id:2, fruit:['apple','pear','banana']})
db.fruits.insertOne({_id:1, fruit:['apple','banana', 'peach']})
db.fruits.insertOne({_id:3, fruit:['cherry','pear','strawberry']})
db.fruits.insertOne({_id:4, fruit:['rawsberry','cherry','banana']})

db.fruits.find()

// apple과 banana가 포함된 도큐먼트 출력
// $all : and
use('new_db')
db.fruits.find({fruit:{$all:['apple','banana']}})

// $in : or
use('new_db')
db.fruits.find({fruit:{$in:['apple','banana']}})

use('new_db')
db.fruits.insertOne({_id:5, fruit:['apple','cherry','pear','banana']})

// 배열 요소가 3개인 도큐먼트
use('new_db')
db.fruits.find({fruit: {$size : 3}})

// $push : 배열에 요소 추가
use('new_db')
db.fruits.updateOne({_id:4}, {$push : {fruit : 'strawberry'}})


use('new_db')
db.fruits.find({_id:4})
