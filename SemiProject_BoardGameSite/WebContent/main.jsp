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

<header>
	<%-- GNB --%>
	<div id="gnb"></div>
	<script type="text/javascript">
	$(function () {
		$("#gnb").load("./GNB/gnb.jsp");
	})
	</script>
</header>

<section>
	<%--페이지 시작. --%>
	<h1>메인페이지</h1>

</section>

<footer>


</footer>


</body>
</html>

