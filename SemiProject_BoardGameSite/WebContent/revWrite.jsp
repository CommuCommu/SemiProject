<%@page import="dto.MemberDto"%>
<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String year = (String)request.getAttribute("year");
	String month = (String)request.getAttribute("month");
	String day = (String)request.getAttribute("day");
	
	System.out.println("year : " + year);
	System.out.println("month : " + month);
	System.out.println("day : " + day);
	
	Object olist = request.getAttribute("ReservationTableList");
	List<TableDto> list = null;
	if(olist != null) {
		list = (List<TableDto>)olist;
	}
	
	for(int i = 0; i < list.size(); i++) {
		TableDto dto = list.get(i);
		
		System.out.println(dto.getTablenumber() + "," + dto.getNumberpeople() + "," + dto.getIsreserbaitiontable()); 
	}
	
	//범위를 설정하는 날짜. 기준
	Calendar cal = Calendar.getInstance();

	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH) + 1; // 0 ~ 11 +1
	int tday = cal.get(Calendar.DATE);
	int thour = cal.get(Calendar.HOUR_OF_DAY);
	int tmin = cal.get(Calendar.MINUTE);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>revWrite.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<%	//로그인 검증부분.
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if (oLogin == null) {
%>
	<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
		alert("잘못된 접근입니다. 메인 페이지로 이동합니다.");
		location.href = "main.jsp"	
	</script> 

<%	
	}else {
		mem = (MemberDto) oLogin;
	}
%>





<%-- GNB  --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>





<%--
	1. 이용할 테이블 선택
	2. 테이블에 대한 예약 시간표를 출력 및 몇시부터 몇시까지 이용할건지 선택
	3. 선택 후에 확인을 누르면 예약이 완료되고 예약 리스트에 올라가야함.
	4. 한 아이디로 중복 예약은 불가능함.
	5. 예약에 길이는 최대 4시간으로 할까? 고민좀 해보자.

 --%>

<form action="RevWriteServlet" id="revForm">
	<div>
		<b>매장 운영 시간은 09~22시 입니다.</b>
		<br><br><br>
		<b>1. 테이블을 선택해주세요.</b> 
		<select id="tableSelect" name="tableSelect">
			<option value="none">선택</option>
			<% for(int i = 0; i < list.size(); i++) { %>
			<% TableDto dto = list.get(i); %>
			<option value="<%= dto.getTablenumber()%>" data-np="<%=dto.getNumberpeople()%>"><%=dto.getTablenumber()%>번 테이블 (<%=dto.getNumberpeople()%>인용)</option>
			<% } %>
		</select>
	</div>
	
	
	<div id="second">
		<div id="sf">
		
		
		</div>
	</div>
</form>



<script type="text/javascript">
var revCheck = new Array();			//테이블 예약정보 전역변수.
var numberPeoples = null;


	
$("#tableSelect").on("change", function () {	//테이블 선택 변경
	alert("값 변환 감지");
	var tableNumber = $("#tableSelect option:selected").val(); //테이블 넘버를 가져옴.
	
	
	if(tableNumber == "none") {
      	$("#sf").remove();
    	$("#second").append('<div id="sf">');
    	$("#second").append('</div>');
	}else {
	    jQuery.ajax({
	        type:"GET",
	        url:"RevWriteServlet",
	        //traditional : true, 	//배열전송할때 쓰는거. 지금은 아니니 필요 없을듯.
	        dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			data:{"command":"tableSet","year":<%=year%> , "month":<%=month%> , "day":<%=day%> , "tableNumber":tableNumber},
	        success : function(data) {
	             // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	             //Result(data , "delete" , id , null, null);
	             alert("success"); 
	             //alert(data); 
	             //alert(data.length); //0~12 -> 13
	    
	             revCheck = new Array();
	             for(i = 0; i < data.length; i++) {
	            	revCheck[i] = data[i];
	             }
	             numberPeoples = $("#tableSelect option:selected").data("np");
	             
	          	$("#sf").remove();
	        	$("#second").append('<div id="sf">');
	        	$("#second").append('</div>');
	        	

	        	var isP = false;
	        	
	        	for(i = 0; i < revCheck.length; i++) {
	        		if(revCheck[i] == 0) {
	        			isP = true;
	        			break;
	        		}
	        	}

	        	
	
	        	$("#sf").append('<br>');
	        	
	        	$("#sf").append('<table border="1" id="revTable">');
	        	
	            $("#revTable").append('<tr>');
	            for(var i = 0; i < (revCheck.length + 1); i++) {
	           		$("#revTable").append('<td><b>' + (9 + i) + '</b></td>');
	            }
	            $("#revTable").append('</tr>');
	         
	            
	            
	            $("#revTable").append('<tr>');
	            for(var i = 0; i < revCheck.length; i++) {
	            	if(revCheck[i] == 0) {
	            		$("#revTable").append('<td>' + "예약가능" + '</th>');
	            	}else {
	            		$("#revTable").append('<td>' + "예약불가" + '</th>');
	            	}
	            }
	            $("#revTable").append('<td>' + '</th>');
	            $("#revTable").append('</tr>');

	            
	        	$("#sf").append('</table>');
	        	
	        	
		        if(isP) {
	
		        	$("#sf").append('<br><br>');
		        	$("#sf").append('<b>2.이용할 시간과 이용 인원을 선택해주세요.</b><br><br>');
		        	$("#sf").append('<b>이용 시간 : </b>');
		             
		        	
		        	$("#sf").append('<select id="startTime" name="startTime">');
		        	$("#startTime").append('<option value="none">선택</option>');
		        	for(i = 0; i < revCheck.length; i++) {
		        		if(revCheck[i] == 0) {
			        		$("#startTime").append('<option value=' + i + '>' + (i + 9) + '시</option>');
		        		}
		        	}
		        	$("#sf").append('</select>');
		        	$("#sf").append(' <b>~</b>');
		        	
		        	
		        	$("#sf").append(' <span id ="endSpan">');
	
		        	$("#sf").append('</span>');
		        	
		        	
		        	
		        	
		        	$("#sf").append('<br>');
		        	$("#sf").append('<b>인원수 : </b>');
		        	$("#sf").append('<select id="peopleNumber" name="peopleNumber">');
		        	for(i = 1; i <= numberPeoples; i++) {
		        		$("#peopleNumber").append('<option value=' + i + '>' + i + '명</option>');
		        	}
		        	$("#sf").append('</select>');
	        	
	        	}else {
		        	$("#sf").append('<br><br>');
		        	$("#sf").append('<b>현재 이 테이블은 예약이 전부 차있습니다. 다른 테이블을 이용하시거나, 다른 날짜를 이용해주세요.</b><br><br>');
	        	}
	             
	
	        },
	        error : function(xhr, status, error) {
	              alert("에러발생");
	        }
	 	 });
		
	}
	

	
	
	
})


$(document).on("change", "#startTime", function () {
	alert("시작시간 변환 감지");

	var st = $("#startTime option:selected").val();	//i가 넘어옴. 0~12겠지.
	$("#endTime").remove();
  	$("#third").remove();
	
	if(st == "none") {

	}else {
		st *= 1;
		alert(st);
		
	   	$("#endSpan").append('<select id="endTime" name="endTime">');
	   	$("#endTime").append('<option value="none">선택</option>');
	   	for(i = st; i < revCheck.length; i++) {
	   		if(revCheck[i] == 0) {
	       		$("#endTime").append('<option value=' + (i + 1) + '>' + (i + 10) + '시</option>');
	   		}else{
	   			break;
	   		}
	   	}
	   	$("#endSpan").append('</select>');
	}
})


$(document).on("change", "#endTime", function () {
	alert("시간설정 완료 감지");
	$("#third").remove();
	
	var st = $("#startTime option:selected").val();	//i가 넘어옴. 0~12겠지.
	var et = $("#endTime option:selected").val();	//i가 넘어옴. 0~12겠지.
	
	if(et == "none") {

	}else {
		st *= 1;
		et *= 1;

	
		$("#sf").append('<div id="third">');
			$("#third").append('<br><br>');
	
			$("#third").append('<b>3.예약과 함께 남길 메모를 작성해주세요.</b><br><br>');
			
			$("#third").append('예약자 이름 : <%=mem.getName() %>');
			$("#third").append('<br>');
			$("#third").append('예약일 : <%=year %>년 <%=month %>월 <%=day %>일 ');
			$("#third").append('<br>');
			$("#third").append('예약시간 : ' + (st+9) + '시 ~ ' + (et+9) + '시');
			$("#third").append('<br>');
			$("#third").append('메모 : <input type="text" value="여기에 메모를 남겨주세요" id="memo" name="memo" style="weight:400px">');
			$("#third").append('<br><br>');
			
			$("#third").append('<button id="revGo">예약하기</button>');
			
			$("#third").append('<input type="hidden" name="year" value="<%=year%>">');
			$("#third").append('<input type="hidden" name="month" value="<%=month%>">');
			$("#third").append('<input type="hidden" name="day" value="<%=day%>">');
			$("#third").append('<input type="hidden" name="command" value="revGo">');
			$("#third").append('<input type="hidden" name="id" value="<%=mem.getId()%>">');
	
		$("#sf").append('</div>');
	
	}
	
});

$(document).on("click", "#revGo", function () {
	alert("버튼 테슽");

	$('#revForm').submit();
	
	
});

</script>





</body>
</html>