<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	MemberDto mem = (MemberDto)request.getAttribute("dto");
	

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

<%--페이지 시작. --%>

<h1>회원정보 상세보기</h1>
<table>
	<col width="100"><col width="200">
	<tr>
		<th>아이디</th>
		<td><%=mem.getId() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=mem.getName() %></td>
	</tr>
	<tr>
		<th>휴대폰 번호</th>
		<td><%=mem.getCall_number() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=mem.getEmail() %></td>
	</tr>
	<tr>
		<th>마일리지</th>
		<td><%=mem.getBonuscredit() %>	</td>
	</tr>	
	<tr>
		<th>가입일</th>
		<td><%=mem.getRegdate() %></td>		
	</tr>
	<tr>
		<th>예약</th>
		<td>예약 테이블에서 불러오</td>
	</tr>
</table>

<a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">리스트로 돌아가기</a>

</body>
</html>