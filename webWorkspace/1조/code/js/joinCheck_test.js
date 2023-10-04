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
        if(($('#id').val() != "") && (e.keyCode == 13)){
            $('#password').focus();
        }
    });

    $('#password').on('keydown', function(e){
        // password를 입력하고 엔터키 눌렀을때
        if(($('#password').val() != "") && (e.keyCode == 13)){
            $('#passwordCheck').focus();
        }
    });

    $('#passwordCheck').on('keydown', function(e){
        // passwordCheck를 입력하고 엔터키 눌렀을때
        if(($('#passwordCheck').val() != "") && (e.keyCode == 13)){
            $('#hp1').focus();
        }
    });

    // if($('agree_all_chkBox').is(':checked')){
    //     $(':checkbox').is(':checked')
    // }
    $("#agree_all_chkBox").click(function() {
        if($("#agree_all_chkBox").prop("checked")) {
            $("input[name='chk']").prop("checked", true);}
        else {$("input[name='chk']").prop("checked", false);}
    });
    
    let total = $("input[name='chk']").length;
    let checked = $("input[name='chk']:checked").length;

    if(total != checked) {
        $("#agree_all_chkBox").prop("checked", true);
    }

    $("input[name='chk']").click(function() {
        let total = $("input[name='chk']").length;
        let checked = $("input[name='chk']:checked").length;
        if(total != checked) {
            $("#agree_all_chkBox").prop("checked", false);}
        else {$("#agree_all_chkBox").prop("checked", true);}
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
        if($('#password').val() == ""){
            alert('비밀번호를 입력하세요');
            $('#password').focus();
            return false; // server로 전송되지 않도록
        }
        
         // 비밀번호 일치 여부
        if($('#password').val() != $('#passwordCheck').val()){
            alert("비밀번호 확인이 일치하지 않습니다.");
            return false; 
        } 


    
        // checkbox
        if(!$(":checkbox").is(":checked")){        
            alert("관심분야를 1개 이상 선택하세요.");
            return false;
        }
    
    }); // form submit끝

});// ready 끝

