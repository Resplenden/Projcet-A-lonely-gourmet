<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>

function check(){
    var fm = document.frm;
    
    if(fm.id.value == ""){
       alert("���̵� �Է����ּ���.");
       fm.id.focus();
       return;
    }
    if(fm.password.value ==""){
       alert("��й�ȣ�� �Է����ּ���.");
       fm.password.focus();
       return;
    }
    if(fm.password2.value ==""){
       alert("��й�ȣ Ȯ���� �Է����ּ���.");
       fm.password2.focus();
       return;
    }
    if(fm.password.value != fm.password2.value){
       alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
       fm.password2.focus();
       return;
    }
    if(fm.name.value == ""){
       alert("�̸��� �Է��� �ּ���");
       fm.name.focus();   
       return;
    }
    if(fm.name.value == ""){
       alert("�̸��� �Է��� �ּ���");
       fm.password2.focus();
       return;
    }
    if(fm.addr.value == ""){
       alert("�ּҸ� �Է��� �ּ���");
       fm.addr.focus();   
       return;
    }
    if(fm.phone.value == ""){
       alert("����ó�� �Է��� �ּ���");
       fm.phone.focus();   
       return;
    }
    if(checkDupl()!=true){//���̵� �ߺ�üũ�� �����϶� ����Ǵ� �����̴�.
       alert("���̵� �ߺ�üũ�� ���ּ���.");         
       obj = fm.id.value();//obj defined�� ���������� check()���� obj�� ���� �־����� �ʾұ⿡ ����� �����̴�. �׷��Ƿ� obj���� �������־�� �Ѵ�.
       var flag = blurID(obj);//flag�� blurId(obj);�� �־��ش�. obj���� �����Ǿ��⿡ �����ϴ�.
       if (flag == false)   {/* flag�� �����Ͻ� �߻��ϴ� �����̴�. return���� if������ �����Ѵ�.
                    true�Ͻ� �� ������ �߻������ʰ� �׳� �Ѿ�� fm.action,fm.method,fm.submit������ ����ȴ�.
                       flag if ������ */
          alert("���̵� �ߺ��Ǿ����ϴ�.");
          return;
       }         
    }      
       
    fm.action = "<%=request.getContextPath()%>/user/join.do";
    fm.method = "post"; //���缭 �ѱ�� ��� Post
    fm.submit();
    
    return;
 }
 var idCheckFlag = false;
 var idCheckVal = "";
 function idCheck(){
    var id = $("#id").val();
    
    $.ajax({
       url:"idCheck.do",
       type:"post",
       data:"id="+id,
       success:function(result){
          if(id != ""){
             if(result == 1){
                alert("�ߺ��� ���̵��Դϴ�.");
                idCheckFlag = false;
                idCheckVal = "";                  
             }else{
                alert("��밡���� ���̵��Դϴ�.");
                idCheckFlag = true;
                idCheckVal = id;
             }
          }else{
             alert("���̵�� ������ �� �����ϴ�.");
          }
       }
       
    });
 }   
 
 function checkDupl(){
    if(!idCheckFlag){
       return false;
    }else if($("#id").val() == ""){         
       return false;
    }else{
       return true;
    }
 }   
    
 function blurId(obj){   
    var val = obj.value;
    
    if(idCheckFlag && val != idCheckVal){
       idCheckFlag = false;
    }
    
 }   


//��й�ȣ ��ġ Ȯ��
$("#pwd").blur(function{
	if($("#pwd").val() != $("#pwdCfm").val()) {
		$("#pwdCk_check").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		$("#pwdCk_check").css("color","red");
	} else {
		$("#pwdCk_check").text("");
	}
});



/*��й�ȣ ��ġȮ��*/
$('#pwdCfm').focusout(function () {
	var pwdReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	var pwdCfmReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	
	var pwd = $("#pwd").val();
	var pwdCfm = $("#pwdCfm").val();
 	
  if (pwdReg.test($("#pwd").val()) == pwdCfmReg.test($("#pwdCfm").val())) {
      $('#pwdCk_check').text('��й�ȣ�� ��ġ�մϴ�.');
      $('#pwdCk_check').css('color', 'green');
      checkPwdCkFlag = true;
           
   } else {
	   //alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
       $('#pwdCk_check').text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
       $('#pwdCk_check').css('color', 'red');
       checkPwdCkFlag = false;
       return;
   }	
  
  if($("#pwd").val() != $("#pwdCfm").val()) {
		$("#pwdCk_check").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		$("#pwdCk_check").css("color","red");
	} else {
		$("#pwdCk_check").text("");
	}
  	
});



//��й�ȣ
$("#pwd").blur(function(){
	var pwd = $("#pwd").val();
	//var pwdReg =/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]){4,10}$/;
	var pwdReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	
	if(pwd !=null) {
		//��й�ȣ �Է�
		//���Խ� �˻縦 ��
		if (pwdReg.test($(this).val())) {
			//alert("�˸��� �����Դϴ�");
			//��й�ȣ�� ���Ŀ� �´ٸ�
			checkPwdFlag = true; 
			checkPwdRegFlag = true;
			
			
		} else {
			//��й�ȣ�� ���Ŀ� ���� ���� ���
			//alert("��й�ȣ�� 4�ڸ� �̻� 8�ڸ� �ҹ���,����, Ư�����ڸ� �̿��� ������ּ���");
			$('#pwd_check').text('��й�ȣ�� 4�ڸ� �̻� 8�ڸ� �ҹ���, ����, Ư�����ڸ� �̿��� ������ּ���.');
			$('#pwd_check').css('color', 'red');
			//$("#pwd").focus();
			checkPwdFlag = false;
			checkPwdRegFlag = false;
			$("#pwd").focus();
			return;
		} 
	}	
    
});

$("#pwdCfm").blur(function(){
	var pwdCfm = $("#pwdCfm").val();
	//var pwdReg =/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]){4,8}$/;
	var pwdCfmReg=/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{4,10}$/;
	
	if(pwdCfm !=null) {
		//��й�ȣ �Է�
		//���Խ� �˻縦 ��
		if (pwdCfmReg.test($(this).val())) {
			//alert("�˸��� �����Դϴ�");
			//��й�ȣ�� ���Ŀ� �´ٸ�
			checkPwdCfmFlag = true; 
		} else {
			//��й�ȣ�� ���Ŀ� ���� ���� ���
			//alert("��й�ȣ�� 4�ڸ� �̻� 8�ڸ� �ҹ���,����, Ư�����ڸ� �̿��� ������ּ���");
			$('#pwdCk_check').text('��й�ȣ�� 4�ڸ� �̻� 8�ڸ� �ҹ���,����, Ư�����ڸ� �̿��� ������ּ���');
			$('#pwdCk_check').css('color', 'red');
			//$("#pwd").focus();
			checkPwdCfmFlag = false;
			return;
		} 
		
	if(pwd != pwdCfm) {
		$("#pwdCk_check").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		$("#pwdCk_check").css("color","red");
	}	
	
	}
	
    
});








</script>

</body>
</html>