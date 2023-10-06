// MongoDB Aggregate 기능
// Count() : collection내 document 수
use('new_db')
db.book.find().count()

// 배열 형태로 반환되지만 length 사용 안됨
use('new_db')
db.book.find().length

// 배열의 길이 속성 length 사용 가능
use('new_db')
db.book.distinct('bookAuthor').length

// 도큐먼트가 아닌 값인 경우 count() 사용하면 오류남
use('new_db')
db.book.distinct('bookAuthor').count()


// 집계 파이프라인
// 도서의 출판사별로 그룹지어 총재고수량 계산
use('new_db')
db.book.aggregate(
    [
        {
            '$group' :
            {
                '_id':{'출판사':'$publisher.pubName'},
                '총재고수량' : {$sum : '$bookStock'}
            }
        }
    ]
)

// 출판사별로 그룹지어 도서의 평균재고수량 계산
// $avg
use('new_db')
db.book.aggregate(
    [
        {
            '$group' :
            {
                '_id':{'출판사':'$publisher.pubName'},
                '총재고수량' : {$avg : '$bookStock'}
            }
        }
    ]
)


// 출판사별로 그룹지어 총재고수량 출력
// 총 재고수량 기준 내림차순 정렬
// 2개 스테이지 사용
// (1) 그룹화 $group
// (2) sort : $sort
use('new_db')
db.book.aggregate(
    [
        {
            '$group' :
            {
                '_id':{'출판사':'$publisher.pubName'},
                '총재고수량' : {$sum : '$bookStock'}
            }
        },
        {
            '$sort':{'총재고수량':-1}
        }
    ]
)


// 출판사별로 그룹지어 평균재고수량 출력
// 평균 재고수량 기준 오름차순 정렬
use('new_db')
db.book.aggregate(
    [
        {
            '$group' :
            {
                '_id':{'출판사':'$publisher.pubName'},
                '평균재고수량' : {$avg : '$bookStock'}
            }
        },
        {
            '$sort':{'평균재고수량':1}
        }
    ]
)

// 출판사별로 도서 최고가, 도서최소가
// 최대가격 오름차순
use('new_db')
db.book.aggregate(
    [
        {
            '$group' :
            {
                '_id':{'출판사':'$publisher.pubName'},
                '최대가격' : {$max : '$bookPrice'},
                '최소가격' : {$min : '$bookPrice'}
            }
        }
        ,
        {
            '$sort':{'최대가격':1}
        }
    ]
)

// 도서의 최대가 최소가

use('new_db')
db.book.aggregate(
    [
        {
            '$group' :
            {
                '_id':{},
                '도서의 최대가' : {$max : '$bookPrice'},
                '도서의 최소가' : {$min : '$bookPrice'}
            }
        }
    ]
)

