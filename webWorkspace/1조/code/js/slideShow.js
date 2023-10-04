// slide show

$(function(){
    // 이동한 이미지의 Index값을 저장하기 위한 변수 (현재 위치)
    let movedIndex = 0;

    // slide panel을 움직이는 함수
    function moveSlide(index){
        // 전달받은 Index값을 현재 위치 변수에 저장
        movedIndex = index;

        // 슬라이드 이동
        let moveLeft = -(index*800);  // 왼쪽 으로 사진 크기*index만큼 이동거리
        $("#slidePanel").animate({'left':moveLeft}, 'slow');
        
    }

    // prevButton함수 호출했을 때
    $('#prevButton').on('click', function(){
        if(movedIndex != 0){
            movedIndex = movedIndex - 1;
        }
        moveSlide(movedIndex);
    });

    // nextButton함수 호출했을 때
    $('#nextButton').on('click', function(){
        if(movedIndex != 4){
            movedIndex = movedIndex + 1;
        }
        moveSlide(movedIndex);
    });

    // 초기 슬라이드 이미지 랜덤하게 출력
    let randomNum = Math.floor(Math.random()*5);
    moveSlide(randomNum);

    // 이미지 hover하면 opacity수정
    $('#slidePanel').each(function(index){
        $(this).hover(
            function(){
                $(this).css('opacity', '0.5');
            },
            function(){
                $(this).css('opacity', '1');
            }
    );
    });


    // 컨트롤 패널 : hover, click
    $('.controlButton').each(function(index){
        // 마우스 올렸을 때 버튼 이미지 변경 ( 1-> 2 )
        $(this).hover(
            function(){
                $(this).attr('src','image/controlButton2.png');
            },
            function(){
                $(this).attr('src','image/controlButton1.png');
            }
        );

        // 클릭했을 때 : moveSlide() 함수 호출하면서 Index 전달
        $(this).on('click', function(){
            moveSlide(index);
        });
    });


});
