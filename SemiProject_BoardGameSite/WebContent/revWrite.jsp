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
<b>1. 테이블을 선택해주세요.</b> 
<select id="tableSelect" name="tableSelect">
	<option value="none">선택</option>
	<% for(int i = 0; i < list.size(); i++) { %>
	<% TableDto dto = list.get(i); %>
	<option value="<%= dto.getTablenumber()%>"><%=dto.getTablenumber()%>번 테이블 (<%=dto.getTablenumber()%>인용)</option>
	<% } %>
</select>
</div>










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
	alert("lastday : " + lastday);
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