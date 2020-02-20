<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	List<MemberDto> list =  (List<MemberDto>)request.getAttribute("memList");

	int len = (int)request.getAttribute("len");
	int memPage = len / 10; // 예: 22개의 글 → 3페이지
	if (len % 10 > 0) {
		memPage = memPage + 1;
	}
	int pageNum = (int)request.getAttribute("page");
		

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

<h1>회원 정보</h1>

<table>
	<col width="150"><col width="150"><col width="200"><col width="100">
	<tr>
		<th>User ID</th><th>Name</th><th>Email</th><th>Group</th><th>Join Date</th><th>Detail</th>
	</tr>
	<hr>
	
	
	<% 
	if(list.size() == 0){
	 %>
	 <tr>
	 	<th colspan="6">찾으시는 정보가 없습니다</th>
	 </tr>
	 <%
		
	}else {
		for (int i = 0; i < list.size(); i++) {
			MemberDto mem = list.get(i);
	
			if (mem.getDel() != 1) {
		%>
		<tr>
			<td><%= mem.getId()%></td>
			<td><%=mem.getName() %></td>
			<td><%=mem.getEmail() %></td>
			<td><%if (mem.getAuth() == 1 ){ %> 관리자 
				<%}else{ %> 회원 <%} %></td>
			<td><%=mem.getRegdate().substring(0, 10) %></td>	
			<td><a href="auth?command=getMemDetail&id=<%=mem.getId() %>">상세보기</a>	
		</tr>
	<%
			}
		}
	}
%>
</table>

	<div align="center">
		<%
			for (int i = 0; i < memPage; i++) { // [1][2[3]]
				if (pageNum == i) { // 현재 페이지
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight:bold;">
			<%=i + 1%>
		</span> &nbsp;
		<%
			} else { // 그 외의 페이지
		%>
		<a href="#none" title="<%=i + 1%> 페이지" onclick="goPage(<%=i%>)"
			style="font-size: 15pt; color: #000; font-weight: bold;"> [<%=i + 1%>]
		</a>&nbsp;
		<%
			}
		}
		%>
	</div>
	<a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">전체리스트로 돌아가기</a>

<script type="text/javascript">
function goPage( pageNum) {
	//alert("pageNum:" + pageNum);
	var pItem = $("#pItem").val();
	var pSort = $("#pSort").val();
	location.href = "auth?command=getMemlist&pageNum=" + pageNum + "&item=" + pItem + "&sort=" + pSort;
}

</script>
</body>
</html>