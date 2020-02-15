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
<h1>관리자페이지</h1>

<a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">회원리스트보기</a>
<br>
<a href="adminServlet?command=tableCheck">매장 테이블 현황과 예약 테이블 설정</a>


</body>
</html>