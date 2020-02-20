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
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">

<style type="text/css">


.member_btns {text-align:center;padding:1px 0 27px 0;}
.member_btns a {font-size:16px;font-weight:bold;color:#9a9a9a;}
.member_btns a:hover {color:#1a1a1a;text-decoration:none}
.member_btns span {font-size:21px;color:#cacaca;padding:0 30px;}


</style>
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
<div align="center" class="container">
	<br><p class="subject">Login</p>
</div>



<div align="center" style="line-height:3em">
<form action="login?command=toMain" id="frm" method="POST">
	<div><!-- 아이디:  --><input type="text" id="_id" name="id" placeholder="아이디를 입력해주세요" class="form-control" style="width: 380px; margin-bottom: 10px"></div>
	<div><!-- 비밀번호:  --><input type="password" id="_pw" name="pw" placeholder="비밀번호를 입력해주세요" class="form-control" style="width: 380px; margin-bottom: 15px"></div>
	<div>
		<input type="button" id="_submit" class="btn btn-danger" style="width: 380px;vertical-align: middle;" value="로그인">
	</div>
	<div class="member_btns">
		<a href="addmember?command=add" >회원가입</a>
		<span>|</span>
		<a href="find?command=toFindPage">아이디 · 비밀번호 찾기</a>
	</div>
</form>
</div>



<script type="text/javascript">

// 로그인 실패시 
$(document).ready(function () {
	loginFail();
})

function loginFail(){
	var loginFail = '${loginFail}';
	//alert(loginFail);
	if(loginFail == "0"){
		alert("아이디 또는 비밀번호를 다시 확인하세요");
	
	}
}
	
	$(function () {
		$("#_submit").click(function () {
			var id = $("#_id").val();
			var pw = $("#_pw").val();
			if(id == "" || pw == ""){
				alert("아이디 또는 비밀번호를 입력해주세요");
			}else{
				$("#frm").submit();
			}
			
		});

		
	});

</script>
</body>
</html>