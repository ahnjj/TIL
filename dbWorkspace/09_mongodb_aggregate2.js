// 도시별 총인구수 출력
// 인구수 기준 내림차순

use('new_db')
db.population.aggregate(
    [
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        },
        {'$sort': {'총인구수':-1}}
    ]
)

// _id출력 안되게 : 프로젝션 0 ($project사용)
use('new_db')
db.population.aggregate(
    [
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        },
        {
            $project:{'_id':0}
        },
        {
            '$sort': {'총인구수':-1}
        }
    ]
)

// 도시별 총 인구수 출력
// 인구수 기준 내림차순 정렬 : Top5만 출력
// $limit
use('new_db')
db.population.aggregate(
    [
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        },
        {
            '$sort': {'총인구수':-1}
        },
        {
            '$limit' : 5
        }
    ]
)

// 도시별 총인구수 출력
// 하위 5개 도시 출력
use('new_db')
db.population.aggregate(
    [
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        },
        {
            '$sort': {'총인구수':1}
        },
        {
            '$limit' : 5
        }
    ]
)

// 도시별로 총인구수를 구한 후 서울 지역만 출력
// 조건 : city_of_province = '서울'
// $match
// 방법1
use('new_db')
db.population.aggregate(
    [
        {
            '$match' : {city_or_province:'서울'}
        },
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        } 
    ]
)

// 방법2
use('new_db')
db.population.aggregate(
    [
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        },
        {
            '$match' : {'_id.도시':'서울'}
        }
    ]
)

// 조검 : 총 인구수가 3,000,000이상인 도시와 총인구수 출력
use('new_db')
db.population.aggregate(
    [
        {
            '$group':
            {
                '_id':{'도시':'$city_or_province'},
                '총인구수':{$sum: '$population'}
            }
        },
        {
            '$match' : {'총인구수':{$gte:3000000}}
        }
    ]
)

// 서울의 Local_government 수 출력
use('new_db')
db.population.aggregate(
    [
        {
            '$match' : {city_or_province:'서울'}
        },
        {
            
            '$group':
            {
                '_id':'서울',
                '지방정부수':{$sum:1}
            }
        }
    ]
)

// 방법2
use('new_db')
db.population.aggregate(
    [
        {
            '$match' : {city_or_province:'서울'}
        },
        {
            
            '$group':
            {
                '_id':'$local_government'
            }
        },
        {
            $count : 'count'
        }
    ]
)

// 방법3
use('new_db')
db.population.find({city_or_province:'서울'}).count()


// 인구수 500,000이상인 Local_government찾아서
// 도시(city_or_province)와 local_government, 평균 인구수 출력
// 10개
// 그룹 기준이 2개 (도시, 지방정부)

use('new_db')
db.population.aggregate([
    {
        '$match':{population:{$gte:500000}}
    },
    {
        '$group':
        {
            '_id':{'도시': '$city_or_province', 'local_government' : '$local_government'},
            '평균 인구수' : {$avg:'$population'}
        }
    },
    {
        '$limit':10
    }
])

// 책 162쪽
// 2차 지방자치단체의 올해 (당해연도) 시도별 의회비(this_term_expense) 평균 구하기
// 내림차순
use('new_db')
db.local.aggregate([
    {
        '$match' : {'sub_category':'의회비'}
    },
    {
        '$group':{
            '_id' : '$city_or_province',
            '의회비평균' : {$avg: '$this_term_expense'}
        }
    },
    {
        '$sort':{'의회비평균':-1}
    }
])
