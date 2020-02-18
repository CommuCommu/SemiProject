<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.QnaCommentDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	QnaDto dto = (QnaDto)request.getAttribute("qnaDto");
	List<QnaCommentDto> commList = (List<QnaCommentDto>)request.getAttribute("commList");
	int pageNum = (int)request.getAttribute("pageNum");
	
	
	// 댓글 추가 리턴
	String isS = null;
	isS = String.valueOf(request.getAttribute("isS"));
	
	// 댓글 삭제 결과 리턴
	String commDeleteisS = null;
	commDeleteisS = String.valueOf(request.getAttribute("commDeleteisS"));
			
	String qnaAnswerisS = null;
	qnaAnswerisS = String.valueOf(request.getAttribute("qnaAnswerisS"));
	
	
	
	// 게스트의 로그인 세션 처리
	String curSessionId = "";
	//String curSessionAuth = "";
	MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
	if(mem != null) {
		curSessionId = mem.getId();
		//curSessionAuth = Integer.toString(mem.getAuth());
		
	}
	
	
%>     


<%-- 시스템 현재 시간(curToday) 추출 --%>
<%--
Date now = new Date();
/* SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss"); */
SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
String today = sf.format(now);
System.out.println("시스템의 현재시간 : " + today);
int curTime = Integer.parseInt(today);
--%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaDetail.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


<%-- 세션 ID 저장--%>
<input type="hidden" value="<%=curSessionId %>" id="sId">




<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<h1>질문 상세내용</h1>


<%-- 댓글 추가 후처리 --%>
<%
if (isS == null){
	
}
else if(isS.equals("true")){
%>
	<script type="text/javascript">
		//alert("작성한 QnA가 추가 되었습니다.")
		location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
	</script>
<%	
} else if (isS.equals("false")){
%>
	<script type="text/javascript">
		alert("추가되지 않았습니다")
		location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
	</script>
<%
} 
%>







<%-- 댓글 삭제 후처리 --%>
<%
if (commDeleteisS == null){
	
}
else if(commDeleteisS.equals("true")){
%>
	<script type="text/javascript">
		//alert("댓글 삭제 완료")
		location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
	</script>
<%	
} else if (commDeleteisS.equals("false")){
%>
	<script type="text/javascript">
		alert("댓글 삭제 실패")
		location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
	</script>
<%
} 
%>


<%-- 질문 완료 후처리 --%>
<%
if (qnaAnswerisS == null){
	
}
else if(commDeleteisS.equals("true")){
%>
	<%-- 
	
	<script type="text/javascript">
		//alert("댓글 삭제 완료")
		location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
	</script>
	
	 --%>
<%	
} else if (commDeleteisS.equals("false")){
%>
	<script type="text/javascript">
		alert("완료 처리 실패")
		location.href = "qnaServlet?action=detail&seq="+<%=dto.getSeq()%>;
	</script>
<%
} 
%>



<div align="center">
<input type="button" onclick="changeTest(<%=pageNum%>)" value="목록 돌아가기">


</div>

<script type="text/javascript">
function changeTest(pageNum) {
	//뒤로갈 히스토리가 있으면,
	alert(pageNum);
	location.href="qnaServlet?action=list&pageNumber="+pageNum;
}

</script>




<div align="center">
<form action="">
	<table border="1">
	<col width="150"><col width="600">
	
	
	<%-- ===== 상단 메뉴 버튼 ===== --%>
	<%	if(mem != null && ( dto.getId().equals(mem.getId()) || mem.getAuth() == 1)) { %>
	<tr>
		<td colspan="2">
			<div align="right">
				<button type="button" onclick="qnaUpdate(<%=dto.getSeq() %>)">수정</button>
				<button type="button" onclick="qnaDelete(<%=dto.getSeq() %>)">삭제</button>
				<% if(dto.getIs_answer() == 0) { %>
					<button type="button" onclick="qnaAnswerEnd(<%=dto.getSeq() %>,<%=pageNum%>)">답변 완료 전환</button>
				<% } else if (dto.getIs_answer() == 1) { %>
					<button type="button" onclick="qnaAnswerWait(<%=dto.getSeq() %>,<%=pageNum%>)">답변 대기 전환</button>
				<% } %>
				
				<%-- <button type="button" onclick="qnaComment(<%=dto.getSeq() %>)">댓글</button> --%>
				<%-- <button type="button" onclick="test()">test</button> --%>
			</div>	
		</td>
	</tr>
	<% } // if 끝 %>
	
	<tr>	
		<th>아이디</th>
		<%-- <td><input type="text" readonly="readonly" value="<%=dto.getId() %>"></td> --%>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>	
		<th>작성일</th>
		<%-- <td><input type="text" readonly="readonly" value="<%=dto.getWdate() %>" ></td> --%>
		<td><%=dto.getWdate().substring(0, 13) %>시 <%=dto.getWdate().substring(14, 16) %>분</td>
	</tr>
	<tr>	
		<th>조회수</th>
		<%-- <td><input type="text" readonly="readonly"><%=dto.getReadcount() %></td> --%>
		<td><%=dto.getReadcount() %> 회</td>
	</tr>
	<tr>	
		<th>제목</th>
		<%-- <td><input type="text" readonly="readonly"><%=dto.getTitle() %></td> --%>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>	
		<th>내용</th>
		<%-- <td><input type="text" readonly="readonly"><%=dto.getContent() %></td> --%>
		<td>
		<textarea rows="15" cols="80" readonly="readonly"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	</table> 
</form>

</div>





<div id="testtest">


</div>





<%-- ============= 댓글 출력 시작 ============= --%>
<%-- <% if(dto.get) %> --%>
<hr>
<!-- <h3>댓글</h3> -->
<div align="center">

<table border="1">

<col width="150"><col width="500"><col width="150"><col width="100">
	<tr>
	  <th>작성자</th><th>내용</th><th>작성일</th><th>버튼부</th>
	</tr>
<% if(commList == null || commList.size() == 0){ %>
	<tr>
		<td colspan="3">작성된 추가 질문이 없습니다</td>
	</tr>
<% } else {
	for(int i = 0;i < commList.size(); i++){
		QnaCommentDto commDto = commList.get(i);
		
		//System.out.println(commDto.getContent());
%>
	<tr>
		<%-- <th><%=i+1 %></th> --%>
	<% if(commDto.getDel() == 0) { %>
		<% if( commDto.getId().equals("aa") ) { %>
		<%-- ============================ 수정필요 ============================ --%>
			<td align="right">관리자 :　</td>
		<%} else { %>
			<td  align="right"><%=commDto.getId() %> :　</td>
		<% } %>
		
		
		<td><%=commDto.getContent() %></td>
		
		
		
		<%-- 
		작성일(wDate)을 잘라서 년월일 추출 yyMMdd
		<%
		  String s1 = commDto.getWdate().substring(2,10);
		  String p1 = "[-]";
		  String[] sArray1 = s1.split(p1);
		  String wDateStr = "";
		  for( int j = 0; j < sArray1.length; j++ ){
			  wDateStr += sArray1[j].trim();
		  }
		  //System.out.print("스플릿으로 자른 날짜" +sArray1[j].trim());
		  System.out.println("스플릿으로 자른 날짜 : " + wDateStr);
		  int wDate = Integer.parseInt(wDateStr);
		%>
		
		<% if(wDate < curTime) { %>
			<td align="center"><%=commDto.getWdate().substring(2,11) %></td>
		<% } else { %>
			<td align="center"><%=commDto.getWdate().substring(11,13) %> : <%=commDto.getWdate().substring(14,16) %></td>
		<% } %>
		 --%>
		
		<td align="center"><%=commDto.getWdate().substring(5,16) %> </td> 
		
		
		<%	if(mem != null && ( commDto.getId().equals(mem.getId()) || mem.getAuth()==1 ) ) { %>
			<td><button type="button" onclick="commDelete(<%=commDto.getSeq() %>, <%=dto.getSeq()%>)">삭제</button></td>
		
		
		<%} %>
		
	<% } %>
	
	<%-- 
	
	else { %>
		<td>
		 	<font color="#ff0000">질문을 삭제하였습니다.</font>
		</td> 
		<% } %>
		
		
		 --%>
		
	</tr>
		
<% 
	}
}
%>

</table>

</div>

<br><br>




<%-- ============= 댓글 작성 부분 시작 ============= --%>
<div align="center">
<table border="1">
<%-- 작성자 댓글 부분 --%>
<%	if(mem != null && ( dto.getId().equals(mem.getId()) ) && mem.getAuth() == 0 ) { %>
	<tr>
		<td colspan="3">
			<input type="text" id="comment" name="comment" size="100px" required="required">
			
		</td>
		<td>
			<div align="center">
				<button type="button" onclick="commWrite(<%=dto.getSeq() %>)">질문추가</button>
				<!-- <button type="button" onclick="test()">test</button> -->	
			</div>			
		</td>
	</tr>
<% } // if 끝 %>	








<%-- 관리자 답변 부분 --%>
<%	if(mem != null && ( mem.getAuth() == 1 ) ) { %>
	<tr>
		<td colspan="3">
			<input type="text" id="comment" name="comment" size="100px" required="required">
			
		</td>
		<td>
			<div align="center">
				<button type="button" onclick="commWrite(<%=dto.getSeq() %>)">답변 추가</button>
				<!-- <button type="button" onclick="test()">test</button> -->	
			</div>			
		</td>
	</tr>
<% } // if 끝 %>	
</table>

</div>
 
<br><br><br>

<%--추가 보류!--%>

<%--관리자 미응답 리스트 넘어가기 
<%	if(mem != null && ( mem.getAuth() == 1 ) ) { %>
	<a href="auth?command=noAnswer">미응답 Q & A 리스트로 돌아가기</a> 


<% } // if 끝 %>	

--%>

<script type="text/javascript">
var testbutton = 0;
// 질문 수정 함수
function qnaUpdate(seq) {
	var result = confirm("질문을 수정 합니다.")
	if(result) {
		location.href = "qnaServlet?action=update&seq="+seq;
	} else {
		
	}
	
}

// 질문 삭제 함수
function qnaDelete(seq) {
	var result = confirm("질문을 삭제 합니다.")
	if(result) {
		location.href = "qnaServlet?action=delete&seq="+seq;
	} else {
		
	}
	
}

// 질문 답변 완료 함수
function qnaAnswerEnd(seq, pageNum) {
	var result = confirm("답변을 완료로 전환 합니다.")
	if(result) {
		location.href = "qnaServlet?action=answerEnd&seq="+seq+"&pageNum="+pageNum;
	} else {
		
	}
	
	
}

//질문 답변 대기 함수
function qnaAnswerWait(seq,pageNum) {
	var result = confirm("답변 대기 상태로 되돌립니다.")
	if(result) {
		location.href = "qnaServlet?action=answerWait&seq="+seq+"&pageNum="+pageNum;
	} else {
		
	}
	
	
}




// 댓글 작성 함수
function commWrite(seq) {
	var comment = $("#comment").val();
	var commId = $("#sId").val();
	//alert(seq);
	//alert(comment);
	//alert(commId);
	var result = confirm("댓글을 추가 합니다.")
	if(result) {
		location.href = "qnaServlet?action=commentAf&seq="+seq+"&comment="+comment+"&commId="+commId;
	} else {
		
	}
}

// 댓글 삭제 함수
function commDelete(commSeq, qnaSeq) {
	var result = confirm("댓글을 삭제 합니다.")
	if(result) {
		location.href = "qnaCommServlet?action=commDelete&commSeq="+commSeq+"&qnaSeq="+qnaSeq;
	} else {
		
	}
}

/* 
function test() {
	alert("test");
	if(testbutton == 0) {
		testbutton++;
		$("#testtest").append("<input type='text' id='inputtext'>");
	}else {
		alert($("#inputtext").val())
	}
}
 */
</script>


</body>
</html>