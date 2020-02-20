<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<%--페이지 시작. --%>
<h1>정보보호를 위해 비밀번호를 입력해주세요</h1>
<div><input type="password" id="pwd"></div>
<div><button type="button" onclick="pwdcheck()">비밀번호 확인</button></div>

<script type="text/javascript">

$("#fail").hide;

function pwdcheck() {
	var pwd = $("#pwd").val();
	
	$.ajax({url: 'memUpdate',
			type:'POST',
			data: {"command" : "pwdcheck",
				   "pwd" : pwd},
			success : function(data){
				if(data.result){
					location.href="memUpdate?command=update"
				} else{
					alert("비밀번호를 다시 확인해주세요");
					$("#pwd").val("");
					$("#pwd").focus;
					
				}	
			},
			error: function(){
				alert("비밀번호를 확인하는 중 문제가 생겼습니다. 다시 시도해주세요.");
			}		
		});
}


</script>
</body>
</html>