<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QnaDto dto = (QnaDto)request.getAttribute("qnaDto"); 
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaUpdate.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>
<h1>QnA 수정</h1>

<%
	Object ologin = session.getAttribute("login");
				// request.getSession().getAttribute(name)
	MemberDto mem = null;
	if(ologin == null){				
		%>
		<script type="text/javascript">
			alert("로그인 해 주십시오");
		//	location.href = "login?command=login";
		</script>
		<%
	}
	mem = (MemberDto)ologin;
	//System.out.println("mem : "+mem);

%>

<div align="center">
<form action="qnaServlet?action=updateAf" method="post" >
	<table border="1">
	<col width="150"><col width="600">
	<tr>	
		<th>아이디</th>
		<td>
			<input type="text" name="_id" readonly="readonly" value="<%=dto.getId() %>">
		</td>
	</tr>
	<tr>	
		<th>제목</th>
		<td>
			<input type="text" name="title" value="<%=dto.getTitle() %>" required="required">
		</td>
	</tr>
	<tr>	
		<th>내용</th>
		<td>
			<textarea rows="15" cols="80" name="content" required="required"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<th>옵션</th>
		<td>
			<label>
				<input type="checkbox" id="secretChk" >비밀글
				<input type="hidden" id="secret" name="secret" value="0">
			</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" onclick="location.href='qnaList'" value="목록">
			<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
			<input type="submit" value="수정하기">
			
		</td>
	</tr>
	</table>
	<%-- <button type="button" value="<% session.invalidate(); %>">세션 삭제</button> --%> 
</form>



</div>


<script type="text/javascript">

// 비밀글 선택 처리 (기본:(0) / 비밀글:(1))
$(document).ready(function() {
	$("#secretChk").change(function(){
	    if($("#secretChk").is(":checked")){
	        $("#secret").val("1");	    	
	        //alert("체크박스 체크했음!");
	    }
	   	/* 
	    else{
	    //    alert("체크박스 체크 해제!");
	    	$("#secret").val("2");
	    } 
	    */
	});
});
</script>
</body>
</html>