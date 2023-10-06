
// new collection
use('new_db')
db.createCollection('board')

use('new_db')
db.board.insertOne({
    _id:1,
    title: '사용후기',
    writer: 'abcd',
    content: '가성비 최고',
    comments :
    [
        {id:1, content:'댓글1', user_id:'aaa'},
        {id:2, content:'댓글2', user_id:'bbb'},
        {id:3, content:'댓글3', user_id:'ccc'}
    ]
})
use('new_db')
db.board.insertOne({
    _id:2,
    title: '중고거래',
    writer: 'sky',
    content: '최저가 판매',
    comments :
    [
        {id:4, content:'댓글4', user_id:'ddd'},
        {id:5, content:'댓글5', user_id:'bbb'},
        {id:6, content:'댓글6', user_id:'ccc'},
    ]
})
use('new_db')
db.board.find()


// 임베디드 도큐먼트 접근 : 필드명.필드명
// 1번 아이디 댓글을 가진 뽑아내기
use('new_db')
db.board.find({"comments.id":1})

// 배열 인덱스 사용 : []없이 숫자만 (0-Indexed)
// comments배열의 첫번째 원소 : Comments.0.[key]
use('new_db')
db.board.find({"comments.0.id":1, "comments.0.user_id" : 'aaa'})

// 배열 안에서 요소 단위 찾음 
use("new_db")
db.board.findOne({comments: {$elemMatch :{id:4, user_id:'ddd'}}})

// 못찾음: null 나옴
use("new_db")
db.board.findOne({comments: {id:4, user_id:'ddd'}})

use("new_db")
db.board.find()


// 프로젝션 연산자 : 필드만 선택해서 표시 (1)
// Red가 있는 태그 필드는 다 출력
use('new_db')
db.inventory.find({tags: 'red'}, {tags:1})

// 프로젝션 연산자 : $
// red로 검색해서 red가 있는 부분만 출력
use('new_db')
db.inventory.find({tags:'red'},{'tags.$':true})