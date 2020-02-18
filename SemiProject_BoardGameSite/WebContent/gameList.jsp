<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 게임 현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩 링크 - GNB에 링크 추가하여 주석처리함 -->
<!-- GNC에 링크를 달면 스타일 오버라이딩 불가 발견 / GNB 링크 제거하고 각 페이지마다 추가 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<%-- GNB --%>
<div id="gnb"></div>
<script type="text/javascript">
$(function () {
	$("#gnb").load("./GNB/gnb.jsp");
})
</script>

<<<<<<< HEAD
<h3>게임목록</h3>
<br><br>
<div>
<table align="left">
	<col width="240px"><col width="240px"><col width="240px"><col width="240px"><col width="240px"><col width="240px">
	
<tr align="right">
<th>< 주간 인기 순위 탑 5 ></th>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td height="auto">
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
</tr>

<tr align="right">
<th>< 베스트 인기 보드게임 ></th>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Halli Galli(할리갈리)</th>
				<th align="left">Seasons</th>
				<th align="left">UNO</th>
				<th align="left">Century</th>
				<th align="left">JenGa(젠가)</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Halli Galli.png" 
	onclick="window.open('./gbPic/Halli Galli-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Seasons.jpg" 
	onclick="window.open('./gbPic/Seasons-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/uno.jpg" 
	onclick="window.open('./gbPic/uno-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Century.png" 
	onclick="window.open('./gbPic/Century2-EX.png', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
<td>
<img src="./gbPic/Jenga.jpg" 
	onclick="window.open('./gbPic/Jenga-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="auto">
</td>
</tr>

<tr align="right" style="">
<th>< 신작 보드 게임 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right">
<th>< 장르별 : 모험 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right">
<th>< 장르별 : SF ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right">
<th>< 장르별 : 경제/경영 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right"><th>< 장르별 : 추리 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right"><th>< 장르별 : 퍼즐 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right"><th>< 장르별 : 전략 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

<tr align="right"><th>< 장르별 : 카드 ></th>
</tr>
</tr>
<tr>
				<th align="left"></th>
				<th align="left">Indigo(인디고)</th>
				<th align="left">Root(루트)</th>
				<th align="left">Mansions of Madness</th>
				<th align="left">Andor</th>
				<th align="left">사건의 재구성</th>
</tr>
<tr align="left">
<th></th>
<td>
<img src="./gbPic/Indigo.jpg" 
	onclick="window.open('./gbPic/Indigo-EX.jpg','window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Root.png" 
	onclick="window.open('./gbPic/Root-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Mansions of Madness.jpg" 
	onclick="window.open('./gbPic/Mansions of Madness-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Legends of Andor.jpg" 
	onclick="window.open('./gbPic/Legends of Andor-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
<td>
<img src="./gbPic/Chronicles of Crime.png" 
	onclick="window.open('./gbPic/Chronicles of Crime-EX.jpg', 'window_name',
			'width=800,height=500,location=no,status=no,toolbar=no,menubar=no,resizable=no,scrollbars=auto')" 
	alt=""  
	width="80%"; 
	height="180px">
</td>
</tr>

</table>
</div>

<br><br><br><br>
<a href='gameListDetail.jsp?Link="./gbPic/Chronicles of Crime-EX.jpg"' target='_blank'>
<img src="./gbPic/Chronicles of Crime.png" width="400px" height="600px">
</a>
 


=======
<%--페이지 시작. --%>
<div class="container">
	<br><p class="subject">Game List</p>
	<h1>수정중</h1>
</div>
>>>>>>> Jung_Css

</body>
</html>