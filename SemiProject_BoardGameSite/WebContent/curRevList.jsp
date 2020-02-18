<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationDto> list = (List<ReservationDto>)request.getAttribute("curList");
%>    
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
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
		<th colspan="7" align="center">현재예약현황</th>
	<tr>
		<th>번호</th><th>예약일</th><th>예약시간</th><th>테이블넘버</th><th>인원수</th><th>메모</th><th>아이디</th><th>예약관리</th>
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
			<td><input type="button" value="예약취소" class="checkBtn"></td>
			<td><input type="hidden"  value=<%=list.get(i).getSeq() %>></td>
				 
		</tr>
		
 	<% 		} 
		}
	} 
	%>

</table>
<a href="authRev?command=pastRev">지난예약 보기</a>

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



$(".checkBtn").click(function(){ 
	alert
	var del = confirm("정말 삭제하시겠습니까? 한번 삭제시 되돌릴 수 없습니다");
	if(del){
	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	var checkBtn = $(this);
	var tr = checkBtn.parent().parent();
	var td = tr.children();
	var input = td.children();
	var id = td.eq(6).text();
	var seq = input.eq(1).val();
    	alert("seq:" + seq);
    	alert("id" + id);

	$.ajax({
			url : "myReserv",
			type : "POST",
			data : {"seq" : seq ,
				   "command" : "revDel"},
			success : function(data){
				if(data.result){
					alert("삭제");
					location.href="authRev?command=curRev";
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