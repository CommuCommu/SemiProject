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
	String pItem = (String)request.getAttribute("item");
	String pSort = (String)request.getAttribute("sort");
	System.out.println("pSort: " + pSort );
	
	

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
<input type="hidden" id="pItem" value='<%=pItem %>'>
<input type="hidden" id="pSort" value='<%=pSort %>'>


<table>
	<col width="150"><col width="150"><col width="200"><col width="100">
	<tr>
		<th>User ID</th><th>Name</th><th>Email</th><th>Group</th><th>Join Date</th><th>Detail</th>
	</tr>
	<hr>
	<% 

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
	
	<div>
		<select id="sort">
				<option value="choice">정렬</option>
				<option value="name">이름</option>
				<option value="rdate">가입일</option>	
		</select>
		<button onclick="sortAsc()">오름차순</button>
		<button onclick="sortDesc()">내림차순</button>
		<span>&nbsp;</span>
		<select id="item">
				<option value="choice">선택</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
		</select>
		<input type="text" id="searchWord" placeholder="검색어를 입력해주세요">
		<button type="button" onclick="search()">검색</button>
	</div>
 	
	

<script type="text/javascript">
function goPage( pageNum) {
	//alert("pageNum:" + pageNum);
	var pItem = $("#pItem").val();
	var pSort = $("#pSort").val();
	location.href = "auth?command=getMemlist&pageNum=" + pageNum + "&item=" + pItem + "&sort=" + pSort;
}

function sortAsc(){
	var sort = $("#sort").val();
	if(sort == "name"){
		location.href="auth?command=getMemlist&pageNum=0&item=name&sort=asc";
		
	}else if(sort == "rdate"){
		location.href="auth?command=getMemlist&pageNum=0&item=rdate&sort=asc";
	}
}

function sortDesc(){
	var sort = $("#sort").val();
	alert(sort);
	if(sort == "name"){
		location.href="auth?command=getMemlist&pageNum=0&item=name&sort=desc";
	}else if(sort == "rdate"){
		location.href="auth?command=getMemlist&pageNum=0&item=rdate&sort=desc";
	}
}
function search(){
	var item = $("#item").val();
	var searchWord = $("#searchWord").val();
	location.href="auth?command=searchList&page=0&item=" + item + "&searchWord=" + searchWord;
	
}


</script>
</body>
</html>