<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// session을 얻어오는 두가지 방법
	// 1. 내장객체 session을 통해 getAttribute로 접근  
	Object oLogin = session.getAttribute("login");
	// 2. request소속의 getSession()으로 
	// request.getSession();
	MemberDto mem = null;
	if (oLogin == null) {
%>
	<!-- 	<script type="text/javascript">
			alert("로그인해주십시오");
			location.href = "login.jsp"	
			</script> 
	-->
	<h4 align="right" style="background-color: #f0f0f0">
		환영합니다, 게스트님
	</h4>
<%
	}else {
	mem = (MemberDto) oLogin;
%>
	<h4 align="right" style="background-color: #f0f0f0">
		환영합니다,
		<%=mem.getId()%>님
	</h4>
<%
	}
%>



<div align="center">
	<table border="1">
		<tr>
			<th><a href="./main.jsp">로고</a></th>
			<th><a href="./notice.jsp">공지</a></th>
			<th><a href="./gameList.jsp">게임목록</a></th>
			<th><a href="./resetvation.jsp">예약</a></th>
			<th><a href="./epilogue.jsp">후기</a></th>
			<th><a href="./map.jsp">위치</a></th>
			<th><a href="qnaServlet?action=list">Q&A</a></th>
			<th><a href="./admin.jsp">관리자</a></th>
			<%
			if (oLogin == null) {
			%>
			 	<th><a href="./login.jsp">로그인</a></th>
			<% 
			}
			%>
		</tr>
	</table>
	<hr>
</div>


</body>
</html>