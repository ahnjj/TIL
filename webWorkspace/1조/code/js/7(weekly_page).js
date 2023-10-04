$(function(){
    let $weeklyItem = $('#weekly_item div.weekly-box');

    // 첫 번째 탭메뉴 항목 선택되어 있게 설정
    $('#weekly_ul li').addClass('selectedItem1');  // 파란색
    // $('#weekly_ul li:first-child').text('selectedItem');  // 파란색
    $('#weekly_ul li:first-child').addClass('selectedItem2');  // 파란색
    

    $('#weekly_ul li').on('click', function(){
        // 클릭한 탭메뉴 항목 인덱스 알아오기
        let index = $(this).index();

        // 탭메뉴 항목 선택된 이미지로 변경
        // 모든 탭메뉴 항목 : 하나 선택 시 나머지에 적용된 css 효과 제거하고 (흰색으로 다시 바꾸기)
        $('#weekly_ul li').removeClass('selectedItem2');
    
        // 클릭한 항목에만 선택한 css효과 설정 : 파란색
        $(this).addClass('selectedItem2');

        // 컨텐츠 이미지 변경
        // content의 모든 div는 숨기고
        $weeklyItem.css('display', 'none');

        // 클릭한 탭메뉴 항목의 index에 해당하는 div만 보임
        $weeklyItem.eq(index).css('display', 'block');

    });
});