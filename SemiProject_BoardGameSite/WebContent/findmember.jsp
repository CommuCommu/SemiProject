<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
});
</script>

<%--페이지 시작. --%>

<h1>아이디 찾기</h1>
<table>
	<tr>
		<td><input type="text" id="_name"  placeholder="이름을 입력해주세요" ></td>
	</tr>
	<tr>	
		<td><input type="text" id="_email" placeholder="가입하신 이메일 주소를 입력해주세요."></td>
	</tr>
	<tr>
		<td align="center"><button type="button" onclick="findId()">아이디찾기</button></td>
	</tr>
	<tr>
		<td align="center"><div id="foundId"></div></td>
	</tr>
</table>

<div id="foundId"></div>


<h1>비밀번호 찾기</h1>
<table>
	<tr>
		<td><input type="text" id="_id" placeholder="아이디를 입력해주세요" ></td>
	</tr>
	<tr>	
		<td><input type="text" id="idEmail" placeholder="가입시 입력하신 이메일 주소를 입력해주세요."></td>
	</tr>
	<tr>
		<td align="center"><button type="button" onclick="findPw()">비밀번호찾기</button></td>
	</tr>
</table>


<div>가입하신 이메일이 기억나지 않을 고객센터(1111-0000)로 연락주세요.</div>
<script type="text/javascript">

function findId() {
	var inputName = $("#_name").val();
	var inputEmail = $("#_email").val();

	if(	inputName == "" || inputEmail == ""){
		alert("이름 또는 이메일을 입력해주세요")
	}else{
		var nameChk = /^[가-힣]{2,20}$/i; 
		if (!nameChk.test(inputName)) {	
			alert("이름을 확인해주세요");
			return;
		}
		
		var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/i; 
		if (!emailChk.test(inputEmail)) {
			alert("이메일을 확인해주세요");
			return;
		}
	
		$.ajax({ 
			url : "find",
			type : "POST",
			data : {"command" : "findId",
					"name" : inputName,
					"email" : inputEmail
					},
			success	: function (data) {
				if(data.result){
					var gotId = $("#_name").val() + "님의 아이디는 '" + data.id +"' 입니다";
					$("#foundId").text(gotId);
					
				}else{
				 	alert("찾으시는 아이디가 없습니다. 이름 또는 이메일을 다시 확인해주세요");
				}
			},
			error : function(){
				
				alert("아이디를 찾는 중 문제가 발생하였습니다. 다시 시도해주십시오")	
			}		
		});
	}

}

function findPw() {
	//alert("확인");
	var inputId = $("#_id").val();
	var inputIdEmail = $("#idEmail").val();

	if(	inputId == "" || inputIdEmail == ""){
		alert("이름 또는 이메일을 입력해주세요")
	}else{
		var idChk = /^[0-9a-zA-Z]{6,20}$/i; 
		if (!idChk.test(inputId)) {
			alert("아이디를 확인해주세요");
			return;
		}
		
		var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-z0-9-]+\.[a-z0-9]{2,4}(\.[a-z])?$/i; 
		if (!emailChk.test(inputIdEmail)) {
			alert("이메일을 확인해주세요");
			return;
		}
	
		$.ajax({ 
			url : "find",
			type : "POST",
			data : {"command" : "findPw",
					"id" : inputId,
					"email" : inputIdEmail
					},
			success	: function (data) {
				if(data.result){
					location.href="emailauth?command=emailAuth&id=" + inputId + "&email=" + inputIdEmail;
				}else if(data.result == false){
					alert("아이디 또는 이메일을 다시 확인해주세요.");
				}
			
			},
			error : function(){
				
				alert("아이디를 찾는 중 문제가 발생하였습니다. 다시 시도해주십시오");	
			}		
		});
	}

}
</script>

</body>
</html>