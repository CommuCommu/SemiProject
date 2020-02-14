<%@page import="java.util.ArrayList"%>
<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="MainAndNotice.NoticeDAO"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <%
    // 한글 깨짐 방지
    request.setCharacterEncoding("utf-8");
    %>
    
    
    <%
    // 세션 정보 가져오기
    MemberDto sessionDto = (MemberDto)session.getAttribute("login");
    %>
    
    <%
    // DetailServlet 에서 packing 해온 Attribute
    NoticeDto dto = (NoticeDto)request.getAttribute("dto");
    %>
    
    
    <%
    // notice 에서 넘어온 sequence
   	String sseq = request.getParameter("seq");
    int seq = Integer.parseInt(sseq);
    System.out.println("Detail seq = " + seq);
    
    /* String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    System.out.println("Detail title = " + title);
    System.out.println("Detail content = " + content); */
    %>
    
    <%
    
    // singleton
    NoticeDAO dao = NoticeDAO.getInstance();
    
    // dto 에 메소드를 통해 글 상세정보 담기
    NoticeDto methodDto = dao.noticeDetail(seq);
    
    // 아이디가 일치할경우에만 수정 삭제가 가능하도록 세션에서 정보를 가져온다.
    MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
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
<br><br>

<%-- 페이지 시작 --%>
<h1 align = "center">공지사항</h1>

<div align = "center">

<!-- 이전글, 다음글로 이동하기 -->
<%
List<NoticeDto> list = new ArrayList<NoticeDto>();
list.add(dto);
%>

<%
for(int i = 1; i < list.size(); i++) {
		if(dto.getDel() == 1) {
		
	} else if(dto.getDel() == 0) {
		%>
		<a href = "noticeDetail?seq=<%=dto.getSeq() %>"> <button> 이전글 </button> </a>
		<a href = "noticeDetail?seq=<%=dto.getSeq() %>"> <button> 다음글 </button> </a>
	<%
	}
	%>

<%
}
%>

		<!-- 가장 처음과 마지막 글에는 현재가 처음 or 마지막임을 알려줘야한다. -->
		
		

<%-- <%
for(int i=0; i<list.size(); i++) {
%>
<!-- 이전글, 다음글으로 이동하기 -->
<a href = "noticeDetail.jsp?seq=<%=i-1 %>"><button> 이전글 </button></a>
<a href = "noticeDetail.jsp?seq=<%=i+1 %>"><button> 다음글 </button></a>
<%
}
%> --%>
<table border = "1" style="border-collapse:collapse; width:1200px; height:1300px">
	
	<tr>
		<th style="text-align:center">
			제목 <%=dto.getTitle() %> 
		</th>
	</tr>
	
	
	<tr>
		<td>
			내용 <%=dto.getContent() %> 
		</td>
	</tr>
	
</table>

<form action = "noticeUpdate">
<input type = "hidden" name = "title" value = "<%=dto.getTitle() %>">
<input type = "hidden" name = "content" value = "<%=dto.getContent() %>">
</form>


<!-- 수정, 삭제 기능 -->

<%
	/* if(mem.getAuth() == 1) { */
%>
	<button onclick = "updateNotice(<%=dto.getSeq() %>)"> 수정 </button>
	<button onclick = "deleteNotice(<%=dto.getSeq() %>)"> 삭제 </button>
	
<%
	/* } */
%>	

<!-- 공지사항 리스트로 돌아가기 -->
	<button type= "button" onclick = "location.href='notice.jsp'"> 목록 </button>
	
</div>


<script type = "text/javascript">

function updateNotice(seq, title, content) {
	location.href = "noticeUpdate?seq=" + seq + "&command=noticeUpdate&title=" + title + "&content=" + content;
																					
}

function deleteNotice(seq) {
	location.href = "noticeDelete?seq=" + seq;
}


</script>


</body>
</html>