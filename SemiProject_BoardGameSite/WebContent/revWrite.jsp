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

<%-- GNB --%>
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

	        	$("#sf").append('<br><br>');
	        	$("#sf").append('<b>2.이용할 시간과 이용 인원을 선택해주세요.</b><br><br>');
	        	$("#sf").append('<b>이용 시간 : </b>');
	             
	        	
	        	
	        	
	        	$("#sf").append('<br>');
	        	$("#sf").append('<b>인원수 : </b>');
	        	$("#sf").append('<select id="peopleNumber">');
	        	for(i = 1; i <= numberPeoples; i++) {
	        		$("#peopleNumber").append('<option value=' + i + '>' + i + '명</option>');
	        	}
	        	$("#sf").append('</select>');
	             

	        	//var custListString = JSON.stringify(data);	//Json Object를 String 형태로 변환.	
				//$("#mainDiv").load("./JspFile/CustUserList.jsp",  { "custList": custListString });		
	        },
	        error : function(xhr, status, error) {
	              alert("에러발생");
	        }
	 	 });
		
	}
	

	
	
	
})


	
	<%--
	<select id="tableSelect" name="tableSelect">
	<option value="none">선택</option>
	<% for(int i = 0; i < list.size(); i++) { %>
	<% TableDto dto = list.get(i); %>
	<option value="<%= dto.getTablenumber()%>"><%=dto.getTablenumber()%>번 테이블 (<%=dto.getTablenumber()%>인용)</option>
	<% } %>
	</select>
	--%>
	
	



</script>









<h1>revWrite.jsp</h1>
<div align="center">

<form action="     " method="post">
<table border="1">
<col width="200"><col width="500">
<tr>
	<td>아이디</td>
	<td>
		<%-- <%=mem.getId() %> --%>
		<%-- <input type="hidden" name="id" value="<%=mem.getId() %>"> --%>
		<input type="hidden" name="id" value="ID">아이디
	</td>
</tr>
<tr>
	<td>예약일</td>
	<td>
		<%=year %>년 <%=month %>월 <%=day %>일

		<%-- 
	
		<select name="year">
		<%
			for(int i = tyear-5 ; i < tyear+6 ; i++){
				%>
				<option <%=year.equals(i+"")?"selected='selected'" : "" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}

		%>
		</select>년
		
		<select name="month">
		<%
			for(int i = 1 ; i <= 12 ; i++){
				%>
				<option <%=month.equals(i+"")?"selected='selected'" : "" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
		%>
		</select>월
		 
		 
		<select name="day">
		<%
			for(int i = 1 ; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH) ; i++){
				%>
				<option <%=day.equals(i+"")?"selected='selected'" : "" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
		%>
		</select>일
		 --%>
		
		<select name="startTime">
		<%
			for(int i = 0 ; i < 24 ; i++){
				%>
				<option <%=(thour + "").equals(i+"")?"selected='selected'" : "" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
		%>
		</select>시 ~
		
		<select name="endTime">
		<%
			for(int i = 0 ; i < 24 ; i++){
				%>
				<option <%=(thour + "").equals(i+"")?"selected='selected'" : "" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
		%>
		</select>시
		
		
		<%-- 
		<select name="min">
		<%
			for(int i = 0 ; i < 60 ; i++){
				%>
				<option <%=(tmin + "").equals(i+"")?"selected='selected'" : "" %> value="<%=i %>">
					<%=i %>
				</option>
				<%
			}
		%>
		</select>분
		--%>		  
	</td>
</tr>
<tr>
	<td>메모</td>
	<td>
		<textarea rows="10" cols="60" name="memo"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="예약하기">
		<input type="button" onClick="location.href='reservation.jsp'" value="예약취소">
	</td> 
</tr>
</table>
</form>
</div>

<script type="text/javascript">
/* 
$(function () {
	//document를 읽기전에 실행	
}) 
*/
setday();
$(document).ready(function () {
	$("select[name='month']").change( setday );
});

function setday() {
	
	// 해당년도의 월을 통해 마지막 일수를 확인
	var year = $("select[name='year']").val();
	var month = $("select[name='month']").val();
	var day = $("select[name='day']").val();

	//alert("day : " + day);
	
	var lastday = (new Date(year, month, 0)).getDate();
	//alert("lastday : " + lastday);
	// 마지막 일수 적용
	var str = "";
	for(i = 1; i <= lastday; i++) {
		str += "<option " + ((day==i)?"selected='selected'":"") + "value='"+i+"'>" + i + "</option>";
	}
	$("select[name='day']").html( str );
}

</script>

</body>
</html>