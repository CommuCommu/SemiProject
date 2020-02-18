<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationDto> list = (List<ReservationDto>)request.getAttribute("pastList");
%>    
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지난 예약</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:100,300,900);  
#sidebox { background-color:rgba(0,0,75,.4); 
		   position:absolute; 
		   width:12%; 
		   top:280px; 
		   left:85%; 
		   padding: 3px 10px;
}
#sidebox2 { background-color:rgba(0,0,75,.4); 
			position:absolute; 
			width:12%; 
			top:280px; 
			left:1200px; 
			padding: 3px 10px;
			display:none;
}

.sidemenu a:hover{
	text-decoration:none !important;
	color : white;
  -webkit-transform: scale(1.10);
     -moz-transform: scale(1.10);
      -ms-transform: scale(1.10);
       -o-transform: scale(1.10);
          transform: scale(1.10);  
}

.sidemenu a {
	  padding: 10px;
	  text-transform: uppercase;
	  color: white;
	  text-decoration: none;
	  position: relative;
	  display: block;
  	  -webkit-transition: all 0.1s linear;
          transition: all 0.1s linear;
}

</style>
</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<%-- asideBox --%>
<div id="sidebox" align="center"> 
	<div id="mainPg" class="sidemenu" style="font-size:1.3em;" ><a href="./auth?command=adminMain">관리자 메인</a></div>
	<div class="sidemenu" ><a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">회원관리</a></div>
	<div class="sidemenu"><a href="authRev?command=curRev">예약관리</a></div>
	<div class="sidemenu"><a href="authRev?command=pastRev">지난예약</a></div>
	<div class="sidemenu"><a href="auth?command=noAnswer">미응답 Q&A</a></div>
	<div class="sidemenu"><a href="#">게임관리</a></div>
	<div class="sidemenu"><a href="#">테이블관리</a></div>
	<hr>
	<div class="sidemenu"><a href="#">맨 위로</a></div>
	<hr>
	<img src="./GNB/profile.png" width="40px" height="40px">
</div>

<%--페이지 시작. --%>

<table>
	<col width="100"><col width="150"><col width="250"><col width="150"><col width="100"><col width="200"><col width="100">
	<tr>
		<th colspan="7" align="center">지난예약</th>
	<tr>
		<th>번호</th><th>예약일</th><th>예약시간</th><th>테이블넘버</th><th>인원수</th><th>메모</th><th>아이디</th>
	</tr>
	<% if(list.size() == 0){
	%>
	<tr>	
		<td colspan="7" align="center">예약이 없습니다</td>
		
	</tr>	
	<%	
	}else{
		for( int i = 0; i < list.size(); i++){ 
			String rdate = list.get(i).getRdate();
			if(list.get(i).getDel() != 1){
		%>
		<tr>
			<td><%=i + 1 %></td><td><%=rdate.substring(0, 10) %></td>
			<td><%=list.get(i).getStarttime()%>&nbsp;~&nbsp;<%=list.get(i).getEndtime() %></td>
			<td><%=list.get(i).getTablenumber() %></td><td><%=list.get(i).getNumberpeople() %>명</td>
			<td><%=list.get(i).getMemo() %></td>
			<td><%=list.get(i).getId() %></td>
			<td><input type="hidden"  value=<%=list.get(i).getSeq() %>></td>	 
		</tr>
		
 	<% 		} 
		}
	} 
	%>
		<tr>
			<td colspan="6" align="right">누적예약건수: </td><td><%=list.size() %>건</td>
		</tr>
</table>
<a href="authRev?command=curRev">현재예약현황으로 돌아가기</a>
<script type="text/javascript">
var currentPosition = parseInt($("#sidebox").css("top"));
$(window).scroll(function() { 
	var position = $(window).scrollTop();
	$("#sidebox").stop().animate({"top":position+currentPosition+"px"},400); 
});

$(window).resize(function (){
	 var width_size = window.outerWidth;
	 
	 if (width_size <= 800) {
		 $("#sidebox").attr("id","sidebox2");
	 }else {
		 $("#sidebox2").attr("id","sidebox");
	 }
});
</script>


</body>
</html>