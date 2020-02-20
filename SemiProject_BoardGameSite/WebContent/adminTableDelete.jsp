<%@page import="dto.TableDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	List<TableDto> yesList = (List<TableDto>)request.getAttribute("yesList");
	List<TableDto> noList = (List<TableDto>)request.getAttribute("noList");

	int originalPK[] = null;
	

%> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
.yestd{
	text-align: center;

}


</style>

</head>
<body>


<h1>테이블 삭제 페이지</h1>


<div align="center">
<form action="AdminTable">
<table border="1" id="yestable">
<col width="50"><col width="200"><col width="200"><col width="200">
		<tr>
			<th><input type="checkbox" id="allchk" onclick="allChk()"></th>
			<th>테이블 번호</th>
			<th>수용 가능 인원</th>
			<th>현재 예약용 테이블 여부</th>
		</tr>

		<% if(yesList.size() < 1 || yesList == null) { //테이블에 아무것도 없는 경우 %>	
		<h3>현재 삭제 가능한 테이블이 없습니다</h3>

		<% }else {  %>
		<% originalPK = new int[yesList.size()]; %>
	
		<% for(int i = 0; i < yesList.size(); i++){ %>
		<tr>
		
		<% TableDto dto = yesList.get(i); %>
		
		<% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
			<th>
				<input type="checkbox" class="delchk" name="del<%=i %>"value="<%=originalPK[i] %>">
				
			</th>
			<td class="yestd"><%=dto.getTablenumber()%></td>
			<td class="yestd"><%=dto.getNumberpeople()%></td>
			<td class="yestd"><% if(dto.getIsreserbaitiontable() == 1){
							  %>
						 		예약 
					   		  <%
								}else{
							  %>
									일반 
							  <%
								}
						      %>	
							
				 <%--  <input type="hidden" id="tableNum" value="<%=originalPK[i] %>"	> --%>
			
			</td>
		</tr>
	<% } %>
<% } %>
		<!-- <tr><input type="hidden" name="command" value="tableDel"></tr> -->
</table>

<!-- <input type="submit" value="삭제하기">  -->

<button type="button" onclick="del()">삭제</button>
</form>


<% if(noList.size() < 1 || noList == null) { //테이블에 아무것도 없는 경우 %>	
<% }else {  %>
		<h3 style="color:red" >아래 테이블은 현재 예약중인 상태로 삭제 불가능합니다</h3>
<table border="1" id="notable">
<col width="200"><col width="200"><col width="200">
		<tr>
			<th>테이블 번호</th>
			<th>수용 가능 인원</th>
			<th>현재 예약용 테이블 여부</th>
		</tr>

		
		<% originalPK = new int[noList.size()]; %>
	
		<% for(int i = 0; i < noList.size(); i++){ %>
		<tr>
		
		<% TableDto dto = noList.get(i); %>
		
		<%-- <% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %> --%>
			<td class="yestd"><%=dto.getTablenumber()%></td>
			<td class="yestd"><%=dto.getNumberpeople()%></td>
			<td class="yestd">
						<% if(dto.getIsreserbaitiontable() == 1){
						%>
							예약 
						<%
						   }else{
						%>
							일반 
						<%
						   }
						%>	
				 <%--  <input type="hidden" id="tableNum" value="<%=originalPK[i] %>"	>--%>			
			</td>
		</tr>
	<% } %>
<% } %>
		<!-- <tr><input type="hidden" name="command" value="tableDel"></tr> -->
</table>

</div>

 <a href="auth?command=tableCheck"><button type="button">리스트로 돌아가기</button></a>

<script type="text/javascript">

function allChk(){
	alert("확인")
	if($("input[id=allchk]").is(":checked")){
		$("input[class=delchk]").prop("checked", true);
	
	}else{
		
		$("input[class=delchk]").prop("checked", false);
	}
}



function del(){
	var checkedNum = $("input:checkbox[class=delchk]:checked").length
	//alert("체크수: " + checkedNum);
	var delArray = new Array();
	//var i = 0;
	// alert("확인:" + checkedNum);
	/*
	$("input[class=delchk]:checked").each(function() {
	  	alert("테이블넘버: " + $(".delchk").val());
	  	//array[i] = $(".delchk").val();
		//alert("테이블넘버 확인2: " + array[i]);
		i++;
	});
	*/
	$("input:checkbox[class=delchk]:checked").each(function() {
		 delArray.push($(this).val());
		
		//alert(i + "번째 테이블: " + delArray[i]);
		//i++;
		
	});
	
	alert("배열길이:" + delArray.length);

	jQuery.ajaxSettings.traditional = true;

	$.ajax({
			url: 'AdminTable',
			data:{ 'command' : 'tableDel',
					'tableNum' : delArray},
			type : "POST",
			success: function(data){
				if(data.result){
					alert("테이블 삭제가 완료되었습니다");
					location.href='AdminTable?command=delete'
				}else if(data.result){
					
					alert("삭제에 문제가 생겨 테이블이 삭제가 안되었을 수 있습니다. 다시 시도해주세요 ");
					location.href='AdminTable?command=delete'
				}
				
			},
			error : function(request,status,error){
				//alert("실패!");
				alert("code:"+ request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}		
	
	});
		
	
	
}



</script>



</body>
</html>