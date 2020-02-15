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

<style type="text/css">
	#sidebox { background-color:#F0F0F0; position:absolute; width:120px; top:433px; right:420px; padding: 3px 10px }
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
<h1>테이블 현황 검사</h1>

<div style="float:left;">

<table border="1">

<% if(list.size() < 1 || list == null) { //테이블에 아무것도 없는 경우 %>	
	<h3>표기할 내용이 없습니다.</h3>

<% }else {  %>
	<% originalPK = new int[list.size()]; %>
	
	<% for(int i = 0; i < list.size(); i++){ %>
		<tr>
	
		<% TableDto dto = list.get(i); %>
		
		<% originalPK[i] = dto.getTablenumber(); //기존 테이블 넘버 백업. %>
		<td><%=dto.getTablenumber()%></td>
		<td><%=dto.getNumberpeople()%></td>
		<td><%=dto.getIsreserbaitiontable()%></td>

		</tr>
	<% } %>
<% } %>
</table>

<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123

<br><br>
123
<br><br>
123
<br><br>
123
<br><br>
123

<br><br>
123
<br><br>
123

<input type="button" onclick="#" value="수정">
<input type="button" onclick="#" value="삭제">

</div>

<%-- 테스트용 코드 
<div id="kakaoAdWrap" style="position: relative;overflow: hidden;width:20%;height:600px; display:inline-block;">
        <a id="landingLink" href="//analytics.ad.daum.net/clk?wa=IYtjSl3He9sFj8TzgIywtg&amp;enc=uG3GFTsYGvp0puhbIFWnLB_Ok9tvJp_5NDxUYpAaOItjPwNJeETj--msUcwIbn-RFcHl64lFtHDtvTb-92kaWih-DQ1RhIhVO9oXJ3j6oo3rgXCTXpRbqHz1azQ4osNZmoQzUqammgHeXmkpkAT2yRJYzpEgfwI7q8KwSGgP7w8CduSkXFw4x-Yz8bOvuBgeOMOFjSPjivArBil4viIMmo584UGal_0usO5bcvYTF9MaIv4AgzSDsp3RdUQt5tJpr0fIjScU4wmAmvzQn062W8IQwThRkGxra0JpxKKacK-1aeWk6PIhj8t3V8cB0hHM_GKR_FFwMi54baPGiGxtWoHeUD57xUE7T5awdsOu_vU2pIxDShP5goqoYpYdqhldtHWkd4Udu5onWFOXNSAUSA" style="display:block;height:600px;background:" target="_blank">
        <span class="ad_img_background">
            <img src="//t1.daumcdn.net/b2/creative/159906/c231169bf8e4f0bdf887a554504fe8dd.jpg" border="0" alt="광고 작아서 놀라고 흡입력에 놀라요" width="120" height="600" style="display:block;margin:0 auto;">
        </span>
    </a>

    <a href="http://info.ad.daum.net/optout.do" target="_blank"><img class="ad_icon" src="//t1.daumcdn.net/b2/templates/image/opt_out_30.png" alt="kakao 광고안내"></a>
</div>
--%>



<div id="sidebox"> 
내용 입력<br>
잇 이스 어썸 박스<br>
<a href="#">테스트용 링크</a>

 </div>


<script type="text/javascript">
var currentPosition = parseInt($("#sidebox").css("top"));
$(window).scroll(function() { 
	var position = $(window).scrollTop();
	$("#sidebox").stop().animate({"top":position+currentPosition+"px"},400); 
});
</script>


</body>
</html>