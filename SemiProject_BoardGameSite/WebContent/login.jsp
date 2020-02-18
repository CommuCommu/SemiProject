<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String loginFail = request.getParameter("loginFail");

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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



<%--페이지 시작. --%>
<div align="center">
<h1>로그인 페이지</h1>
<form action="login?command=toMain" id="frm" method="POST">
	
	<div>아이디: <input type="text" id="_id" name="id" placeholder="아이디를 입력해주세요"></div>
	
	<div>비밀번호: <input type="password" id="_pw" name="pw" placeholder="비밀번호를 입력해주세요" onkeydown="if(event.keyCode==13) onEnterLogin();"></div>
	
	<div><input type="checkbox" id="saveId">아이디 저장 <button type="button" id="_submit">로그인</button></div>
	
	<div><a href="find?command=toFindPage"><button type="button">아이디 또는 비밀번호 찾기</button></a>
	
	<a href="addmember?command=add"><button type="button">회원가입</button></a></div>
</form>
</div>



<script type="text/javascript">

// 저장된 쿠키 가져오기 
$(function(){
    var userId = getCookie("Cookie_userid");
    $("#_id").val(userId);
    
    if($("#_id").val() != "")
        $("#saveId").attr("checked", true);
});


// 로그인 실패시 
$(document).ready(function () {
	loginFail();
});



function loginFail(){
	var loginFail = '${loginFail}';
	//alert(loginFail);
	if(loginFail == "0"){
		alert("아이디 또는 비밀번호를 다시 확인하세요");
	
	}
}

//버튼 클릭으로 로그인
$(function () {
		$("#_submit").click(function () {
			login();
		});	
});

//엔터키로 로그인
function onEnterLogin(){

	var keyCode = window.event.keyCode;

	if (keyCode == 13) { //엔테키 이면

		login();

	}

} 

// 로그인 함수/ 쿠키저장
function login(){
	 //alert("확인");
	var id = $("#_id").val();
	var pw = $("#_pw").val();
	if(id == "" || pw == ""){
		alert("아이디 또는 비밀번호를 입력해주세요");
	}else{
		  
	    if($("#saveId").is(":checked")){
	        var userId = $("#_id").val();
	        setCookie("Cookie_userid", userId, 30);
	    }else{
	        deleteCookie("Cookie_userid");
	    }
	    
		$("#frm").submit();
	}
}


 /*
function loginProcess(){
    var id = document.getElementById('_Id');
    var pw = document.getElementById('userPw');
    var loginForm = document.getElementById('loginForm');  
 
}
 /**/

//쿠키 셋팅 함수 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 // 쿠키 삭제 함수 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 // 쿠키 가져오는 함수  
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}	

</script>
</body>
</html>