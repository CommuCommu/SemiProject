<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
HashMap info = (HashMap)request.getAttribute("pInfo");
String id = (String)info.get("id");
String oldpw = (String)info.get("pw");
System.out.println("아이디:" + id);
String authNum = (String)session.getAttribute("authNum");
System.out.println("인증번호:" + authNum);
System.out.println("pw:" + oldpw);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<table>
<col width="300"><col width="100">

<h1>인증번호를 입력해주세요</h1>
<tr>
	<input type="hidden" id="_id" value=<%=id %>>
	<input	type="hidden" id="authKey" value=<%=authNum %>>
	<td><input type="text" id="inputNum" placeholder="인증번호를 입력해주세요(6자리)"></td>
	<td><button type="button" id="auth_btn" onclick="authchk()">인증</button></td>
</tr>
<tr>
	<td><div id="countdown"></div></td>	
	<td></td>
</table>
<div id="newPw">
<h1>새로운 비밀번호 입력</h1>
<table>
	<tr>
		<input	type="hidden" id="oldpw" value=<%=oldpw %>>
		<td><input type="password" id="pwd1" placeholder="새 비밀번호(영문+숫자+특수문자조합 8자이상)">
		</td>
	</tr>
	<tr>
		<td><input type="password" id="pwd2" placeholder="새 비밀번호 확인" >
		</td>
	</tr>
	<tr>
		<td><button type="button" onclick="pwChange()">변경</button></td>
	</tr>
</table>
</div>


<script type="text/javascript">
$(function(){
	alert("입력하신 이메일주소로 인증번호가 발송되었습니다");
});



$("#newPw").hide();
var count = 40;
var time = 0;

// myTimer함수 매 초마다 실시 하도록 설정 
$(document).ready(function(){
	time = setInterval("myTimer()", 1000);
	
});
// 남은 시간 view에 표시하기 
function myTimer(){
	count = count - 1;

    	document.getElementById("countdown").innerHTML = "남은시간: " + parseInt(count/60) + "분" + count%60 + "초";
	if(count == 0){
		clearInterval(time);
		document.getElementById("countdown").innerHTML = "인증시간 초과! 다시 인증해주세요";
		
	}
}

function authchk() {
	var inputNum = $("#inputNum").val();
	var authNum = $("#authKey").val();
	if(inputNum == authNum && count != 0){ // 인증번호 같은 경우 
		alert("인증되었습니다");
		$("#newPw").show();
		clearInterval(time);
		document.getElementById("countdown").innerHTML = "인증완료";
	}else if (count == 0){ // 인증시간 만료된경우 
		alert("인증시간이 초과되었습니다. 다시 인증해주세요");
	
	}else{	// 인증번호 틀린경우 
		alert("인증번호를 다시 확인해주세요");
	}	
	
}

function pwChange(){
	var oldpw = $("#oldpw").val();
	//alert("이전비밀번호" + oldpw);
	var pwd1 = $("#pwd1").val();
	var pwd2 = $("#pwd2").val();
	if(oldpw == pwd1){
		alert("이전과 같은 번호로 변경하실 수 없습니다");
	}else if(pwd1 != pwd2){
	 	alert("입력하신 비밀번호가 일치하지 않습니다 ");	
	
	}else{
		var pwChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

		if (pwChk.test(pwd1)) { //유효성검사 
			$.ajax({ url : "find",
				 type : "POST",
				 data : {"pwd" : pwd1,
					 	 "id" : $("#_id").val(),
					 	"command" : "pwUpdate"},
				 success: function(data){
				   if(data.result){
					   alert("비밀번호가 변경되었습니다. 로그인페이지로 이동합니다");
					   location.href="login?command=toLoginPg"
				   }else{
					   alert("변경에 실패하였습니다. 다시 시도해주세요");
				   }	 
				 },
				 error:function(){ 
					 alert("회원정보를 수정하는 중 문제가 발생했습니다. 다시 시도해주세요");	 
				 }
		});
		} else if (!pwChk.test(pwd1)) {
			$("#pw-notice").show();

		}
	
	}	
	
}

</script>

</body>
</html>