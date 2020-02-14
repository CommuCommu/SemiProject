<%@page import="qna.QnaCommentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.MemberDto"%>
<%@page import="dto.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* 페이징 시작 */
// 총 게시글의 갯수
int pageNumber = (int)request.getAttribute("pageNumber");
System.out.println("뷰에서의 pageNumber : " + pageNumber);
// 총 게시글의 갯수에 따른 페이지의 갯수
int qnaPage = (int)request.getAttribute("qnaPage");
System.out.println("뷰에서의 qnaPage : " + qnaPage);
// 리스트 호출
List<QnaDto> list = (List<QnaDto>)request.getAttribute("qnaList");
System.out.println("뷰에서 리스트 호출");

// 게스트의 로그인 세션 처리
String curSessionId = "";
String curSessionAuth = "";
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
if(mem != null) {
	curSessionId = mem.getId();
	curSessionAuth = Integer.toString(mem.getAuth());
	// 세션 처리를 Title에서
}

String choice = (String)request.getAttribute("choice");
System.out.println("뷰에서의 choice : " + choice);
String searchWord = (String)request.getAttribute("searchWord");
System.out.println("뷰에서의 searchWord : " + searchWord);

QnaCommentDao qcDao = QnaCommentDao.getInstance();
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



<%-- 검색 처리 --%>

<script type="text/javascript">
$(document).ready(function () {
	var _choice = '<%=choice %>';
	var _searchWord = '<%=searchWord %>';
	if(_choice != '' && _choice != 'sel'){		
		if(_searchWord != ""){			
			$("#choice").val(_choice);
			$("#search").val(_searchWord);
		}
	}
});
</script>


<%--페이지 시작. --%>
<h1>QNA 페이지</h1>

<div align="center">
<table border="1">
<col width="50"><col width="600"><col width="60"><col width="100"><col width="150"><col width="100">
<tr>
   <th>번호</th><th>제목</th><th>글쓴이</th><th>진행</th><th>작성일</th><th>글 구분</th>
</tr>

<% if(list == null || list.size() == 0){ %>
	<tr>
		<td colspan="6">작성된 글이 없습니다</td>
	</tr>
<% } else {
	for(int i = 0;i < list.size(); i++){
		QnaDto dto = list.get(i);
%>
	<tr>
		<th><%=i+1 %></th>
	<% if(dto.getDel() == 0) { %>	
			<td>
			
				<%-- <a href="qnadetail?seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a> --%>
				<%-- <a href="qnaServlet?action=detail&seq=<%=dto.getSeq() %>"><%=dto.getTitle() %></a> --%>
				<%-- <a href='javascript:void(0);' onclick="userChek(<%=dto.getIs_secret() %>, '<%=dto.getId() %>')"><%=dto.getTitle() %></a> --%>
				<a href='#' onclick="userChek(<%=dto.getIs_secret() %>, '<%=dto.getId() %>', <%=dto.getSeq() %>)" style="text-decoration:none">
				<%=dto.getTitle() %>
				
				<!-- 댓글 카운트 -->
				<% if(qcDao.getQnaCount(dto.getSeq()) > 0) {%>
					+<%=qcDao.getQnaCount(dto.getSeq()) %>
				<% } %>
				</a>
			
				<%-- 세션 ID 저장--%>
				<input type="hidden" value="<%=curSessionId %>" id="sId">
				<%-- 세션 Auth 저장 --%>
				<input type="hidden" value="<%=curSessionAuth %>" id="sAuth">
			</td>		 
	<% } else { %>
		 	<td>
		 		<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font>
		 	</td> 
	<% } %>	
		 
		<%-- 작성자 ID --%> 	 
		<td align="center"><%=dto.getId() %></td>
		
		<%-- 답변상태 --%>
		<% if(dto.getIs_answer() == 0) { %>
			<td align="center">답변대기☆</td>
		<% } else { %>
			<td align="center">답변완료★</td>
		<% } %>
		
		<%-- 작성일 --%>
		<%-- <td align="center"><%=dto.getWdate().substring(0,10) %></td> --%>
		
		
		
		
		
		
		
		<td align="center"><%=dto.getWdate().substring(0,16) %></td>
		
		<%-- 글 구분 --%>
		<% if(dto.getIs_secret() == 0) { %>
			<td align="center">공개</td>
		<% } else { %>
			<td align="center">비공개</td>
		<% } %>

	</tr>
	<%
	} // list의 for문 끝
}
%>
</table>
<!-- <input type="button" onclick="location.href='qnaWrite?action=write'" value="등록하기"> -->


<%-- 페이징에 대한 뷰 처리 --%>
<%
for(int i = 0;i < qnaPage; i++){		// [1] 2 [3]
	if(pageNumber == i){	// 현재 페이지		
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%
	}else{	// 그 외의 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 13pt; color: #000; font-weight: bold; text-decoration: none">
			[<%=i + 1 %>]
		</a>&nbsp;
		<%		
	}
}
%>



<br>
<input type="button" onclick="QnaWrite()" value="등록하기">
</div>


		





<%-- 검색창 시작 --%>
<div align="center">

<select id="choice">
	<option value="sel">선택</option>
	<option value="title">제목</option>
	<option value="writer">작성자</option>
	<option value="content">내용</option>
</select>

<input type="text" id="search" value="">

<button onclick="searchQna()">검색</button>

</div>









<script type="text/javascript">
// Qna 등록하기 선택시 세션id 확인 후 처리
function QnaWrite() {
	<% if(mem == null || mem.getId().equals("")){ %>
		alert("QnA는 로그인 후 작성 하실 수 있습니다.");
		location.href = "login?command=login";
	<% } else { %>
		location.href = "qnaServlet?action=write";
	<% } %>
}

// Qna 글 열람시 유저&비밀글 확인 처리
function userChek(is_secret, id, seq) {
	var curSessionId = $("#sId").val();
	var curSessionAuth = $("#sAuth").val();
	
	if(<%=mem == null %>) {
		if(is_secret == 0) {
			// 게스트가 일반글 열람 -> 상세 보기 연결
			location.href = "qnaServlet?action=detail&seq="+seq;
		}else if (is_secret == 1){
			// 게스트가 비밀글 열람 -> 로그인 페이지 연결
			alert("로그인이 필요합니다.");
			location.href = "login?command=login";
		}
	} else if(<%=mem != null %>){
		if(curSessionAuth==0) {
			if(is_secret == 0){
				// 로그인 이후 모든 유저 일반글 열람 -> 상세글 보기 연결
				location.href = "qnaServlet?action=detail&seq="+seq;
			}else if((is_secret == 1) && (id != curSessionId) ) {
				// 사용자와 작성자 다르고 비밀글 열람 -> 경고창
				alert("비공개 글은 작성자만 확인 할 수 있습니다.");
			} else {
				// 사용자와 작성자 같고 비밀글인 경우 -> 상세글 연결
				//alert("추가 예외 확인");
				location.href = "qnaServlet?action=detail&seq="+seq;
			}
		} else if (curSessionAuth==1) {
			location.href = "qnaServlet?action=detail&seq="+seq;
		}
	}
}

// 사용자가 보고 있는 페이지 이외의 이동
function goPage( pageNum ) {
	var choice = $("#choice").val();
	var word = $("#search").val();
	//alert("#search:" + word);	

	 
	if(word == "" ){
		document.getElementById("choice").value = 'sel';
	}
	
	var linkStr = "qnaServlet?action=list&pageNumber=" + pageNum;
	if(choice != 'sel' && word != ""){
		linkStr = linkStr + "&searchWord=" + word + "&choice=" + choice;
	}
	location.href = linkStr;
	//location.href = "qnaServlet?action=list&pageNumber=pageNum&searchWord=word&choice=choice;
}


function searchQna() {

	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
	//alert(choice);
	//alert(word);
 
	if(word == ""){
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "qnaServlet?action=list&searchWord=" + word + "&choice=" + choice;
	
}

</script>


</body>
</html>