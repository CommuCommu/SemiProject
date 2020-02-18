<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<div id="aside"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
	$("#aside").load("./GNB/asideBox.jsp");
})
</script>

<%	//계정 검증
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
%>
		<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
			alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
			location.href = "main.jsp"	
		</script> 
<%	
	}else {
		mem = (MemberDto)oLogin;
		if(mem.getAuth() == 1) {
			//관리자 맞음.
		}else {
%>	
			<script type="text/javascript">	// TODO 나중에 서블릿으로 교체할 것.
				alert("잘못된 접근입니다. 메인페이지로 이동합니다.");
				location.href = "main.jsp"	
			</script> 
<%				
		}	
	}
%>	

<% List<TableDto> list = (List<TableDto>)request.getAttribute("TableList"); //테이블 호출 %>
<% int[] originalPK = null;  %>




<%--페이지 시작. --%>
<h1>테이블 수정</h1>

<div>

<table border="1" id="listTable">
<col width="250"><col width="250"><col width="250">

<tr>
	<th>테이블 번호</th>
	<th>수용 가능 인원</th>
	<th>현재 예약용 테이블 여부</th>
</tr>


<% if(list.size() < 1 || list == null) { //테이블에 아무것도 없는 경우 %>	
	<h3>표기할 내용이 없습니다.</h3>

<% }else {  %>
	<% originalPK = new int[list.size()]; %>
	
	<% for(int i = 0; i < list.size(); i++){ %>
		<tr>
	
		<% TableDto dto = list.get(i); %>
		
		<% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
		<td>
			<input type="text" class="tn" value=<%=dto.getTablenumber()%> onkeypress="inNumber();"/>
		</td>
		<td>
			<input type="text" value=<%=dto.getNumberpeople()%> onkeypress="inNumber();"/>
		</td>
		<td>
			<%if(dto.getIsreserbaitiontable() == 0) {%>
				<input type="checkbox">
			<%}else { %>
				<input type="checkbox" checked="checked">
			<%} %>
		</td>
		
		</tr>
	<% } %>
<% } %>
</table>

<br><br>
123
<br><br>
123
<br><br>

<input type="button" id="createTd" value="생성">
<input type="button" id="update" value="수정"> <%--onclick="location.href='AdminTable?command=update'" --%>
<input type="button" onclick="location.href='AdminTable?command=back'" value="리스트로 돌아가기">

</div>


<script type="text/javascript">
$(document).on("click", "#createTd", function () {
	//어우 되게 긴데 쪼개기 귀찮으니 한줄로 간다
	$("#listTable").append('<tr><td><input type="text" class="tn" value="000" onkeypress="inNumber();"/></td><td><input type="text" value="2" onkeypress="inNumber();"/></td><td><input type="checkbox"></td></tr>');
});

function inNumber(){
  if(event.keyCode<48 || event.keyCode>57){
     event.returnValue=false;
  }
}

function tableNumberOverlapCheck() {
	var tntn = $('#listTable').find(".tn");
	
	alert(tntn.length);	//테이블 갯수 가져오기
	
	for(var i = 0; i < tntn.length; i++) {
		//alert(tntn[i].value);
	}
}

$(document).on("click", "#update", function () {

	var isOverlap = false;
	
	
	
	
	//alert("test");
	
	/*
	$('#listTable').children('.tn').each(function () {
		alert($(this).val());
	});	
	*/
	
	//var contents = {},
    //duplicates = false;
	
/*
	
$("#listTable #tn").each(function() {
	alert($(this).val());
	
    var tdContent = $(this).text();
    if (contents[tdContent]) {
        duplicates = true;
        return false;
    }
    contents[tdContent] = true;
});    
if (duplicates)
   alert("There were duplicates.");
*/

});

</script>




</body>
</html>