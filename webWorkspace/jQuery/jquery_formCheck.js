// 회원 가입 폼 유효성 확인

$(document).ready(function(){
    // 시작 시 id 입력란에 포커스
    $('#id').focus();

    // 키보드 이벤트
    // 휴대폰 번호 첫 번째 입력란에 입력값이 3개가 되면 다음으로 포커스 이동
    $('#hp1').on('keyup',function(){
        if($(this).val().length==3){
            $('#hp2').focus();
        }
    });
    // 두번째 입력란에 4개 입력하면 다음으로
    $('#hp2').on('keyup',function(){
        if($(this).val().length==4){
            $('#hp3').focus();
        }
    });
    // 세번째 입력란에 4개 입력하면 다음으로
    $('#hp3').on('keyup',function(){
        if($(this).val().length==4){
            $(':radio').focus();
        }
    });

    // 엔터키 눌렀을 때 무조건 submit안되도록 문서 전체에 이벤트 처리
    // [enter] ascii code : 13
    $(document).on('keydown',function(e){
        if(e.keyCode == 13) return false;
    });

    // 엔터키 눌렀을 때 포커스 이동
    $('#id').on('keydown', function(e){
        // id를 입력하고 엔터키 눌렀을때
        if($('#id').val() != "" && e.keyCode == 13){
            $('#pwd').focus();
        }
    });


    // newMemberForm의 submit(전송)[완료] 버튼 눌렀을때
    $('#newMemberForm').on('submit',function(){

        //id입력하지 않은 경우
        if($('#id').val() == ""){
            alert('아이디를 입력하세요');
            $('#id').focus();
            return false; // server로 전송되지 않도록
        }
        // 비밀번호 입력하지 않은 경우

        // 라디오 버튼 (학년) 선택하지 않은 경우 : 상태 선택자 사용
        if(!$('input[type="radio"]').is(':checked')){
            alert("학년을 선택하세요");
            return false;
        }
    
        // checkbox
        // if(!$('input[type="checkbox"]').is(':checked')){
        if(!$(":checkbox").is(":checked")){         // 이렇게 생략할수 있다.
            alert("관심분야를 1개 이상 선택하세요.");
            return false;
        }
    
    }); // form submit끝

});