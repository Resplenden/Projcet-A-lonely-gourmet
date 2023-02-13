
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백
    var userInputId = getCookie("userInputId");
    $("#id").val(userInputId); 
     
    if($("#id").val().toString().length){ 
        $("#save_id").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#save_id").change(function(){ // 체크박스에 변화가 있을때,
        if($("#save_id").is(":checked")){ // ID 저장하기 체크했을때,
            var userInputId = $("#id").val();
            setCookie("userInputId", userInputId, 10); // 10일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 쿠키 저장.
    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#save_id").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#id").val();
            setCookie("userInputId", userInputId, 10); // 10일 동안 쿠키 보관
        }
    });
});

//쿠키 저장하기
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
  
//쿠키삭제  
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
  
//쿠키 가져오기  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){ //쿠키가 존재한다면
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length; //쿠키값의 마지막 위치 인덱스 번호 설정
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

