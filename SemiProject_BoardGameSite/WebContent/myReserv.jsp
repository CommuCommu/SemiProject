<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<ReservationDto> list = (List<ReservationDto>)request.getAttribute("myList");
System.out.println(list.size());

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
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">


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
<<<<<<< HEAD
<h1>내 예약 보기</h1>
<table>	
	<col width="100"><col width="150"><col width="250"><col width="150"><col width="100"><col width="200"><col width="100">
	<tr>
		<th>번호</th><th>예약일</th><th>예약시간</th><th>테이블넘버</th><th>인원수</th><th>메모</th><th>예약관리</th>
	</tr>
	<% if(list.size() == 0){
	%>
	<tr>	
		<td colspan="6" align="center"> 예약이 없습니다</td>
		
	</tr>	
	<%	
	}else{
		for( int i = 0; i < list.size(); i++){ 
			String rdate = list.get(i).getRdate();
		%>
		<tr>
			<td><%=i + 1 %></td><td><%=rdate.substring(0, 10) %></td>
			<td><%=list.get(i).getStarttime()%>&nbsp;~&nbsp;<%=list.get(i).getEndtime() %></td>
			<td><%=list.get(i).getTablenumber() %></td><td><%=list.get(i).getNumberpeople() %>명</td>
			<td><%=list.get(i).getMemo() %></td>
			<td><input type="button" value="예약취소" class="checkBtn"></td>
			<td><input type="hidden"  value=<%=list.get(i).getSeq() %>></td>
			<td><input type="hidden" value=<%=list.get(i).getId() %>></td>
		</tr>
		
 	<% } 
	} %>

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
	
<script type="text/javascript">
function goPage( pageNum) {

	location.href = "myReserv?command=getMemlist&pageNum=" + pageNum  + "";
}

$(".checkBtn").click(function(){ 
	var del = confirm("정말 삭제하시겠습니까");
	if(del){
	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	var checkBtn = $(this);
	var tr = checkBtn.parent().parent();
	var td = tr.children();
	var input = td.children();
	var seq = input.eq(1).val();
	var id = input.eq(2).val();
    	alert("seq:" + seq);
    	alert("id" + id);
=======
<div class="container">
	<br><p class="subject">My Reservation</p>
	<h1>수정중</h1>
</div>
>>>>>>> Jung_Css

	
	$.ajax({
			url : "myReserv",
			type : "POST",
			data : {"seq" : seq ,
				   "command" : "revDel"},
			success : function(data){
				if(data.result){
					alert("삭제");
					location.href="myReserv?command=myReserv&id="+id+"&page=0";
				}else{
					alert("삭제 실패!");
				}
			},
			error : function(){
				alert("삭제과정에서 문제가 발생하였습니다. 동일 증상 지속시 고객센터로 연락주시기 바랍니다");
			}
		
	    });
	}
});

</script>	

</body>
</html>