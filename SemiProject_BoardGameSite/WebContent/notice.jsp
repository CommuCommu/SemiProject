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
    /* 
    // 메인에서 auth 넘겨줘야 한다..
    // 아아니야...잠깐만.....ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ 이건 잊어
    
   	MemberDto memberDto = (MemberDto)session.getAttribute("login");
  
    String sAuth = request.getParameter("auth");
    int auth = Integer.parseInt(sAuth.trim());
    System.out.println("관리자값 확인하기 = " + auth); */
    
    
    
    
    String searchWord = request.getParameter("searchWord");
    String choice = request.getParameter("choice");
    
    // sel 을 지정하는 이유는,
    // 검색옵션을 제목이나 작성자가 아닌 select 를 선택했을 경우에
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
</head>
<body>
 --%>

<%-- Session 객체 가져오기 --%>

<%
    Object oLogin = session.getAttribute("login");
    MemberDto mem = null;
    
    if(oLogin == null) {
    %>
    
    	
    	
    <%
    
    } else {
    
    	mem = (MemberDto) oLogin;
    	
   	%>
   	
    <%
    	}
    %>



<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>
<br><br>

<%--페이지 시작. --%>
<h1 align = "center"><font style="font-size:29pt">공지사항</font></h1>


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



<div align = "center" style = "padding-left:100px; padding-right:100px">
<br><br><br><br>
<table border = "1" style = "border-collapse:collapse" class="table table-hover">
	<col width = "40"> <col width = "600" style="text-align:center"> <col width = "90"> <col width = "90"> <col width = "50">
	
	
	<tr>
		<th scope="col" style = "text-align:center"></th>		<!-- 번호인데 일부러 비워놔따 -->
		<th scope="col" style = "text-align:center"> 제목 </th>
		<th scope="col" style = "text-align:center"> 작성자 </th>
		<th scope="col" style = "text-align:center"> 작성일 </th>
		<th scope="col" style = "text-align:center"> 조회수 </th>
	</tr>
	
	
	
	
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
		<td align ="center"> <%=dto.getWdate() %> </td>
		<td align = "center"> <%=dto.getReadcount() %> </td>
	</tr>
	
	
	
	<% 
			}
			}
	%>
	
</table>

	<%
		for(int i=0; i<noticePage; i++) {
			if(pageNumber == i) {
	%>
	
	<span style = "font-size: 15pt; color : #0000ff; font-weight:bold;">
		<%=i+1 %>
	</span>&nbsp;
	<%
			} else {
	%>
	
	<!-- a 버튼 클릭 시 goPage() 호출 -->
	<a href = "#none" title="<%=i+1 %> 페이지" onclick = "goPage(<%=i%>)"
					  style="font-size:15pt; color:#6E6E6E; /* font-weight:bold; */text-decoration:none">
					  <%=i+1 %>
	</a>&nbsp;
	<%
			}
		}
	%>
	<br>
	<br><br><br>
	
	<!-- 관리자만 글쓰기 버튼이 보이게 하기 -->
	
	
	<%-- <%
	if(mem.getAuth() == 1) {
	%>
		<a href = "noticeWrite?command=write"> <button type = "button"> 글쓰기 </button> </a>
	
	<%
	}
	%> --%>
	
	<br><br><br>
	
	
	<!-- 검색기능 -->
	<div align = "center">
	
	<select id = "choice">
		<option value = "sel"> 선택 </option>
		<option value = "title"> 제목 </option>
		<option value = "content"> 내용 </option>
	</select> <input type = "text" id = "search" value = "">
	
	<!-- 검색버튼을 누르면 검색 메소드 searchNotice 호출 (써야함) -->
	<button type = "button" onclick = "searchNotice()">검색 </button>
	</div>
	
	
</div>


<script type = "text/javascript">
function searchNotice() {
	
	// select 의 option 값을 변수에 넣는다.
	var choice = document.getElementById("choice").val();
	
	// 검색한 내용값을 변수에 넣는다.
	var word = $("#search").val();
	
	// 검색어가 아무것도 없으면, 아무것도 선택하지 않은 select 를 가리키게 한다.
	if(word == "") {
		document.getElementById("choice").value = 'sel';
	}
	
	// NoticeListServlet 에 command = search / 검색어 searchWord = word, 검색항목인 choice 를 넣는다.
	location.href = "noticeList?command=search&searchWord=" + word + "&choice=" + choice;
}


function goPage( pageNum ) {
	var choice = $("#choice").val();
	var word = $("#search").val();

	if(word == "") {
		document.getElementById("choice").value = 'sel';
	}
	
	var linkStr = "notice.jsp?pageNumber=" + pageNum;
	
	if(choice != 'sel' && word != "") {
		linkStr = linkStr + "&searchWord = " + word + "&choice=" + choice;
	}
	
	
	location.href = linkStr;
}





</script>

</body>
</html>