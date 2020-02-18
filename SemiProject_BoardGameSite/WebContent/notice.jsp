<%@page import="dto.MemberDto"%>
<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="MainAndNotice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    request.setCharacterEncoding("utf-8");
    %>
    	
    	
    <%
    // 검색
    String searchWord = request.getParameter("searchWord");
    String choice = request.getParameter("choice");
    
    // sel 을 지정하는 이유는, 검색옵션을 제목이나 작성자가 아닌 select 를 선택했을 경우에
    // 아무것도 수행하지 않게 하기 위해서이다.
    if(choice == null || choice.equals("")) {
    	choice = "sel";
    }
    
    // 검색타입을 지정하지 않고 choice 가 넘어왔을 때
    if(choice.equals("sel")) {
    	searchWord = "";
    }
    if(searchWord == null) {
    	searchWord = "";
    	choice = "sel";
    }
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
a {color: #000000;}
a:hover {text-decoration: none; color: #000000;}

th, td{text-align:center;vertical-align: middle !important;}

</style>

<%--
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 --%>
 
 
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

<!-- 타이틀 수정 -->
<div class="container">
<br><p class="subject">Notice</p>
</div>

<script type = "text/javascript">
$(document).ready(function () {
	var _choice = '<%=choice %>';
	var _searchWord = '<%=searchWord %>';
	if(_choice != '' && _choice != 'sel') {
		if(_searchWord != "") {
			$("#choice").val(_choice);
			$("#search").val(_searchWord);
		}
	}
});

</script>



<%
// paging

String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")) {
	pageNumber = Integer.parseInt(sPageNumber);
}

NoticeDAO dao = NoticeDAO.getInstance();

List<NoticeDto> list = dao.getNoticePagingList(choice, searchWord, pageNumber);

int length = dao.getAllNotice(choice, searchWord);
System.out.println("총 글의 개수는 = " + length);

int noticePage = length / 10;
if(length % 10 > 0) {
	noticePage = noticePage + 1;
}
%>



<!-- 테이블 div 시작 -->
<div align="center" class="container"> 

<table class="table table-hover">
	<!-- col width="40"><col width="600" style="text-align:center"><col width = "90"><col width = "90"><col width = "50"> -->
	<col width="40"><col width="300"><col width = "90"><col width = "140"><col width = "50">
	<thead align="center">
		<tr>
			<!-- 		
			<th scope="col" style = "text-align:center">　	</th>		번호인데 일부러 비워놔따
			<th scope="col" style = "text-align:center"> 제목 </th>
			<th scope="col" style = "text-align:center"> 작성자 </th>
			<th scope="col" style = "text-align:center"> 작성일 </th>
			<th scope="col" style = "text-align:center"> 조회수 </th> 
			-->
			<th>No</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
		</tr>
	</thead>
	
	
	<tbody>
	<%
		if(list == null || list.size() == 0) {
	%>
	
	<tr>
		<td colspan = "5" style = "text-align : center"> 작성된 공지사항이 없습니다. </td>
	</tr>
	
	
	
	<%
		} else {
			
			for(int i =0; i<list.size(); i++) {
				NoticeDto dto = list.get(i);
	%>
	
	<tr>
		<th style="text-align:center"> <%=i+1 %> </th>
		<td style = "text-align:center">
			<%
				if(dto.getDel() == 0) {
			%>
			<a href = "noticeDetail?seq=<%=dto.getSeq() %>"> <%=dto.getTitle() %></a>
			<%
				} else {
			%> <font color = "#ff0000"> 이 글은 삭제된 글입니다. </font> <%
				}
			%>
		</td>
		<td align = "center"> <%=dto.getId() %> </td>
		<%-- <td align ="center"> <%=dto.getWdate() %> </td> --%>
		<td align="center"><%=dto.getWdate().substring(0,16) %></td>
		<td align = "center"> <%=dto.getReadcount() %> </td>
	</tr>
	
	
	
	<% 
			}
		}
	%>
</tbody>
</table>
	
	
	<!-- 관리자만 글쓰기 버튼이 보이게 하기 -->	
 <%
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if (oLogin == null) {
	
%>
	<%
	} else {
		mem = (MemberDto) oLogin;
		System.out.println("null 방지용 id 확인 =" + mem.getId());
		if(mem.getId().equals("aa") || mem.getId().equals("Admin")) {
	%>
	
	<div align="right">
		<input type="button" class="btn btn-outline-danger" onclick="location.href='noticeWrite?command=write'" value="글쓰기">
	</div>

	
	<!-- <a href = "noticeWrite?command=write"> <button type = "button"> 글쓰기 </button></a> -->
	
	<%
		}
	%>
	
	<%
	}
	%>
 
 
 
<%-- 	<%
	if(mem.getAuth() == 1) {
	%>
		<a href = "noticeWrite?command=write"> <button type = "button"> 글쓰기 </button> </a>
		
		< ========== 글쓰기 쓰실때 아래 참고하셔서 사용하시면 부트스트랩 적용됩니다 :) -우철- ========== >
		<div align="right">
			<input type="button" class="btn btn-outline-danger" onclick="location.href='noticeWrite?command=write'" value="글쓰기">
		</div>
		
	<%
	}
	%>
 --%>





	<%-- 페이징에 대한 뷰 처리 --%>
	<ul class="pagination justify-content-center" style="margin:20px 0">
	<%
		for(int i=0; i<noticePage; i++) {
			if(pageNumber == i) {
	%>
	<%-- 
	<span style = "font-size: 15pt; color : #0000ff; font-weight:bold;">
		<%=i+1 %>
	</span>&nbsp;
	 --%>
	
	<li class="page-item">
		<a class="page-link" href="#">
			<%=i + 1 %>
		</a>
	</li>
		
	<%
			} else {
	%>
	
	<!-- a 버튼 클릭 시 goPage() 호출 -->
	<%-- 
	<a href = "#none" title="<%=i+1 %> 페이지" onclick = "goPage(<%=i%>)"
					  style="font-size:15pt; color:#6E6E6E; /* font-weight:bold; */text-decoration:none">
					  <%=i+1 %>
	</a>&nbsp; 
	--%>
	
	<li class="page-item">
		<a class="page-link" href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
			<%=i + 1 %>
		</a>
	</li>

<%
		}
	}
%>
	</ul>
	
	
	<!-- <br><br><br><br> -->
	
	
	<!-- <br><br><br> -->
	
	
	<!-- 검색기능 -->
	<div align = "center">
	
	<select id = "choice" class="serchSelect">
		<option value = "sel"> 선택 </option>
		<option value = "title"> 제목 </option>
		<option value = "writer"> 작성자 </option>
		<option value = "content"> 내용 </option>
	</select>
	<input type = "text" id = "search" value = "" class="serchText" placeholder="검색어를 입력해주세요 " size="40px">
	
	<!-- 검색버튼을 누르면 검색 메소드 searchNotice 호출 (써야함) -->
	<button type = "button" onclick = "searchNotice()" class="btn btn-outline-dark" style="vertical-align: bottom;">검색 </button>
	</div>
	
	
</div> <!-- 테이블 div 종료 -->













<script type = "text/javascript">

//searching function
function searchNotice() {
	
	// select 의 option 값을 변수에 넣는다.
	var choice = document.getElementById("choice").value;
	
	// 검색한 내용값을 변수에 넣는다.
	var word = $("#search").val();
	
	// 검색어가 아무것도 없으면, 아무것도 선택하지 않은 select 를 가리키게 한다.
	if(word == "") {
		document.getElementById("choice").value = 'sel';
	}
	
	// NoticeListServlet 에 command = search / 검색어 searchWord = word, 검색항목인 choice 를 넣는다.
	location.href = "noticeList?command=search&searchWord=" + word + "&choice=" + choice;
}

// paging function
function goPage( pageNum ) {
	var choice = $("#choice").val();
	var word = $("#search").val();

	if(word == "") {
		document.getElementById("choice").value= 'sel';
	}
	
	var linkStr = "noticeList?command=page&pageNumber=" + pageNum;
	if(choice != 'sel' && word != "") {
		linkStr = linkStr + "&searchWord = " + word + "&choice=" + choice;
	}
	location.href = linkStr;
}





</script>

</body>
</html>