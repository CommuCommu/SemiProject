<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
 MemberDto mem = (MemberDto)session.getAttribute("login");
 System.out.println(mem.getId());
 
 String id = mem.getId();
 String name = mem.getName();
 String phoneNum = mem.getCall_number();
 String email = mem.getEmail();
 String pwd = mem.getPw();
 
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
<h1>내 정보 보기</h1>
<table>
<col width="150"><col width="300">
	<tr>
		<th>
		<input type="hidden" name="pwd" value='<%=pwd %>'>
		아이디:</th> 
		<td><input type="text" name="id" readonly="readonly" value='<%=id %>'> </td>
	</tr>
		<tr>
		<th>이름:</th> 
		<td><input type="text" name="name" readonly="readonly" value='<%=name %>'></td>
	</tr>
	<tr>
		<th>휴대전화번호:</th> 
		<td><input type="text" name="phoneNum" readonly="readonly" value='<%=phoneNum %>'> </td>
	</tr>
		<tr>
		<th>이메일:</th> 
		<td><input type="text" name="email" readonly="readonly" value='<%=email %>'> </td>
	<tr> 
		<td colspan="2"><a href="personalInfo?command=memcheck"><button type="button">수정</button></a></td>
	</tr>
</table>
<a href="personalInfo?command=myReserv"><button type="button">내 예약</button></a>
<a href="login?command=logout"><button type="button">로그아웃</button></a>

<script type="text/javascript">


</script>
</body>
</html>