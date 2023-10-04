$(document).ready(function(){

    // [전체보기]항목 클릭했을 때 모든 서브 메뉴항목 보이게
    $('#showAllMenu').on('click', function(){
        if($(this).text() == '전체보기 ▼'){
            // SubMenuBox 보이고, 텍스트를 '메뉴닫기 ▼'로 변경
            $('#subMenuBox').css('visibility','visible');
            $(this).text('메뉴닫기 ▼').css('color','pink');
        } else {
            // SubMenuBox 숨기고, 텍스트를 '전체보기 ▼'로 변경
            $('#subMenuBox').css('visibility','hidden');
            $(this).text('전체보기 ▼').css('color','black');
        }
    });


});