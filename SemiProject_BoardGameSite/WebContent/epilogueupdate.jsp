<%@page import="dto.MemberDto"%>
<%@page import="dto.EpilogueDto"%>
<%@page import="epilogue.EpilogueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>epilogueupdate</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.js"></script> 
<script type="text/javascript" src="editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<script>
$(document).ready(function(){
	$("#save").click(function(){		
		alert("save click");
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		alert(document.getElementById("ir1").value);
		$("#frm").submit();		
	})
})
</script>

<!-- 
<style type="text/css">
table.type02 {
    border-collapse: separate;
    border-spacing: 0;
    text-align: left;
    line-height: 1.0;
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  	margin : 20px 10px;
}
table.type02 th {
    /* width: 150px; */
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #fff;
    border-left: 1px solid #fff;
    background: #eee;
    text-align: center;
}
table.type02 td {
    /* width: 350px; */
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
 -->

</head>
<body>

<a href="logout.jsp">로그아웃</a>

<h1>글 수정</h1>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

EpilogueDao dao = EpilogueDao.getInstance();
EpilogueDto epilogue = dao.getEpilogue(seq);
%>

<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
%>

<div class="center">

<form id="frm" action="epilogueupdateAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=seq %>">
			
<table class="type02" width = "100%">
<!-- 
<col width="20"><col width="100%"> 
 -->
<tr>
	<td align="right">아이디</td>
	<td>
		<input type="text" name="id" readonly="readonly" size="50" value=${ login.id }> 		
	</td>	
</tr>
<tr>
	<td align="right">제목</td>
	<td>
		<input type="text" name="title" size="110" value="<%=epilogue.getTitle() %>">		
	</td>
</tr>
<tr>
	<td align="right">수정할 내용</td>
	<td> 
			<textarea rows="10" cols="30" id="ir1" name="ir1" style="width:766px; height:412px;" ></textarea>
			
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
<%-- 	
	<td align="center">
	<textarea rows="10" cols="90" readonly="readonly"><%=epilogue.getContent() %></textarea>
	   <div contentEditable="true" image="visible" name="content" rows="10" cols="90" readonly="readonly"><%=epilogue.getContent() %></div>
	</td>
--%>
										
</tr>

<tr>
	<td colspan="2">
		<input type="submit" id="save" value="수정" onclick="fOnAppLoad(this)">
		<input type="button" value="취소" onclick="location.href='epiloguelist_css.jsp'"/>
	</td>
</tr>

</table>

</form>

</div>

<a href="epiloguelist_css.jsp">방문후기 목록으로</a>

</body>
</html>