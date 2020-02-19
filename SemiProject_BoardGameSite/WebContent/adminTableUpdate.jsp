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
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>

<header>
	<%-- GNB --%>
	<div id="gnb"></div>
	<div id="aside"></div>
	<script type="text/javascript">
	$(function () {
		$("#gnb").load("./GNB/gnb.jsp");
		$("#aside").load("./GNB/asideBox.jsp");
	})
	</script>
</header>


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

<% List<TableDto> list = (List<TableDto>)request.getAttribute("tableList"); //테이블 호출 %>
<% int[] originalPK = null;  %>

<%--페이지 시작. --%>
<h1>테이블 수정</h1>




<form action="AdminTableUpdateServlet" id="frm">
	<div id="tableDiv">
	
	<table border="1" id="listTable">
	<col width="250"><col width="250"><col width="250">
	
	<tr>
		<th>테이블 번호</th>
		<th>수용 가능 인원</th>
		<th>현재 예약용 테이블 여부</th>
	</tr>
	
	
	<% if(list == null) { //테이블에 아무것도 없는 경우 %>	
		<h3>표기할 내용이 없습니다.</h3>
	
	<% }else if(list.size() < 1) {%>
		<h3>표기할 내용이 없습니다.</h3>
	
	<% }else {  %>
		<% originalPK = new int[list.size()]; %>
		
		<% for(int i = 0; i < list.size(); i++){ %>
			<tr>
		
			<% TableDto dto = list.get(i); %>
			
			<% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
			<td>
				<input type="text" class="tn" name="tnValues" value=<%=dto.getTablenumber()%> onkeypress="inNumber();"/>
			</td>
			<td>
				<input type="text" class="pn" name="pnValues" value=<%=dto.getNumberpeople()%> onkeypress="inNumber();"/>
			</td>
			<td>
				<%if(dto.getIsreserbaitiontable() == 0) {%>
					<input type="checkbox" class="ck">
				<%}else { %>
					<input type="checkbox" class="ck" checked="checked">
				<%} %>
			</td>
			
			</tr>
		<% } %>
	<% } %>
	</table>
	
	<input type="button" id="createTd" value="테이블 추가 생성">
	<input type="button" id="update" value="변경사항 적용"> <%--onclick="location.href='AdminTable?command=update'" --%>
	<input type="button" onclick="location.href='AdminTable?command=back'" value="리스트로 돌아가기">
	
	</div>
</form>



<br><br><br><br><br><br><br>





<footer>
	<div id="footer"></div>
	<script type="text/javascript">
	$(function () {
		$("#footer").load("./GNB/footer.jsp");
	})
	</script>
</footer>










<script type="text/javascript">
$(document).on("click", "#createTd", function () {
	//어우 되게 긴데 쪼개기 귀찮으니 한줄로 간다
	$("#listTable").append('<tr><td><input type="text" class="tn" name="tnValues" value="0" onkeypress="inNumber();"/></td><td><input type="text" class="pn" name="pnValues" value="0" onkeypress="inNumber();"/></td><td><input type="checkbox" class="ck"></td></tr>');
});

function inNumber(){
  if(event.keyCode<48 || event.keyCode>57){
     event.returnValue=false;
  }
}

function zeroDelete() {
	var zeroDele = $('#listTable').find(".tn");
	
	for(var i = 0; i < zeroDele.length; i++) {
		zeroDele[i].value = zeroDele[i].value.replace(/(^0+)/, "");
	}
}

function tableNumberOverlapCheck() {
	var tntn = $('#listTable').find(".tn");
	
	for(var i = 0; i < (tntn.length - 1); i++) {
		for(var j = (i + 1); j < tntn.length; j++) {
			if(tntn[i].value == tntn[j].value) {
				return false;	//중복 발견
			}
		}	
	}
	return true;
}

function peopleNumberCheck() {				//인원 점검
	var pnpn = $('#listTable').find(".pn");
	
	for(var i = 0; i < pnpn.length; i++) {
		if(pnpn[i].value <= 0) {
			return false;	//0이하의 숫자 발견
		}	
	}
	return true;
}



$(document).on("click", "#update", function () {

	var isOverlap = false;
	var isPnCheck = false;
	
	zeroDelete();
	isOverlap = tableNumberOverlapCheck();
	isPnCheck = peopleNumberCheck();
	
	if(isOverlap) {
		alert("테이블넘버 중복 발견 안됨");
		if(isPnCheck) {
			alert("인원수 정상");
			
			var checkArray = $('#listTable').find(".ck");
			//alert(checkArray.length);
			
			for(var i = 0; i < checkArray.length; i++) {
				if($(checkArray[i]).is(":checked")) {
					$("#tableDiv").append('<input type="hidden" value="1" name="isRev">');
					//alert(i + "번째 박스 체크 됨");
				}else {
					$("#tableDiv").append('<input type="hidden" value="0" name="isRev">');
					//alert(i + "번째 박스 체크 안됨");
				}
			}
			
			<% for(int i : originalPK) {%>
				$("#tableDiv").append('<input type="hidden" value="<%=i%>" name="originalPk">');
			<%} %>
			
			
			$("#frm").submit();
		}else {
			alert("인원수 0이하 발견");
		}
	}else {
		alert("테이블넘버 중복 발견");
	}
	

	
	
	
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