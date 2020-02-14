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
String command = request.getParameter("command");

%>

<%
if(command.equals("noticeUpdateAf")) {
	String sisS = request.getParameter("isS");
	boolean isS = Boolean.parseBoolean(sisS);
	System.out.println("isS = " + isS);
	
	if(isS == true) {
	
%>

<script>
	alert("수정되었습니다.");
	location.href="notice.jsp";
</script>
<% 
	} else {
%>

<script>
	alert("수정에 실패했습니다.");
	location.href="notice.jsp";
</script>

<%
	}
	}
%>


</body>
</html>