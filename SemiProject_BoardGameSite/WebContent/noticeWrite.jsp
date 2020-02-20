<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">


<script>
$(document).ready(function(){
	$("#save").click(function(){		
		//alert("save click");
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		//alert(document.getElementById("ir1").value);
		$("#frm").submit();		
	})
})
</script>

</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<br><br><br><br>
<div align = "center">
<form id="frm" action="noticeWrite" method="post">
<input type = "hidden" name = "command" value= "writeAf">
<%-- <form id="frm" action="insert.jsp" method="post" > --%>
	
		제목 <input type="text" id="title" name="title" style = "width : 750px; height : 20px" placeholder="게시글 제목을 입력하세요">
	
<table align = "center" width = "900px" height = "600px">
	<tr>
		<td></td>
		<td> 
			<textarea rows="10" cols="30" id="ir1" name="ir1" style="width:766px; height:412px; align:center"></textarea>
			<input type = "hidden" name = "wDate" <%-- value = "<%=Date date = new Date(); %>" --%>>
			<script type="text/javascript">			
				var oEditors = [];										
				$(function(){
				nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors,
					elPlaceHolder: "ir1",
					//SmartEditor2Skin.html 파일이 존재하는 경로
					sSkinURI:"editor/SmartEditor2Skin.html",
					
					htParams:{
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar:true,				
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer:true,		
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger:true,			
						fOnBeforeUnload:function(){							
						}
					}, 
					fOnAppLoad:function(){						
						//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
						oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
					},
					fCreator:"createSEditor2"
				});
				});	
			</script>											
		</td>
	</tr>
	<tr>
		<td colspan="2" align = "center">
			<input type="button" id="save" value="저장" onclick="fOnAppLoad(this)">
			<input type="button" onclick = "location.href='notice.jsp'" value="취소">
		</td>
	</tr>
</table>
</form>
</div>


</body>

</html>