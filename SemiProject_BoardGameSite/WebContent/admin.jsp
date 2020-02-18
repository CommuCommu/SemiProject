<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	int memNum = (int)request.getAttribute("memNum");
	int revNum = (int)request.getAttribute("revNUm");
	int noAnswerNum =(int)request.getAttribute("noAnswerNum");
	int tableNum = (int)request.getAttribute("tableNum");
%>    
          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<link rel="stylesheet" href="admin.css">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:100,300,900);  

.all-card{
display: table;
margin: auto;
margin-right : 300px;

}

.card{
	margin : auto;
	padding : 10px 50px 10px 50px;
	float : left;

}

.card-title{
 	text-align: center;

}

.card-text1{
	border-bottom: 2px solid #e06c6cd9;
	text-align: center;
}

.card-text{
	text-align: center;
}
#sidebox { background-color:rgba(0,0,75,.4); 
		   position:absolute; 
		   width:12%; 
		   top:280px; 
		   left:85%; 
		   padding: 3px 10px;
}
#sidebox2 { background-color:rgba(0,0,75,.4); 
			position:absolute; 
			width:12%; 
			top:280px; 
			left:1200px; 
			padding: 3px 10px;
			display:none;
}


.sidemenu a:hover{
	text-decoration:none !important;
	 color: white;
  -webkit-transform: scale(1.10);
     -moz-transform: scale(1.10);
      -ms-transform: scale(1.10);
       -o-transform: scale(1.10);
          transform: scale(1.10);  
}

.sidemenu a {
	  padding: 10px;
	  text-transform: uppercase;
	  color: white;
	  text-decoration: none;
	  position: relative;
	  display: block;
  	  -webkit-transition: all 0.1s linear;
          transition: all 0.1s linear;
}

@keyframes color {
    from{
        background-position: 0px 0px;
    }
    to{
        background-position: -1000px 0px;
    }
}



#mainPg{
	 font-size: "12px";	

}

#container {
    height: 300px; 
}

.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 1000px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #EBEBEB;
    margin: 10px auto;
    text-align: center;
   
    width: 100%;
    max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}



.chart{
	margin-top: 80px;
	margin-left: 250px;
	width: 1000px;



}

/**/
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


<%-- asideBox --%>
<div id="sidebox" align="center"> 
	<div id="mainPg" class="sidemenu" style="font-size:1.3em;" ><a href="./auth?command=adminMain">관리자 메인</a></div>
	<div class="sidemenu" ><a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">회원관리</a></div>
	<div class="sidemenu"><a href="authRev?command=curRev">예약관리</a></div>
	<div class="sidemenu"><a href="authRev?command=pastRev">지난예약</a></div>
	<div class="sidemenu"><a href="auth?command=noAnswer">미응답 Q&A</a></div>
	<div class="sidemenu"><a href="#">게임관리</a></div>
	<div class="sidemenu"><a href="#">테이블관리</a></div>
	<hr>
	<div class="sidemenu"><a href="#">맨 위로</a></div>
	<hr>
	<img src="./GNB/profile.png" width="40px" height="40px">
</div>


<%--페이지 시작. --%>
<div class="all-card" style="padding-top:20px;">
	<div class="card" style="width: 18rem;">
	  <img src="./image/membership.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">회원관리</h5>
	    <p class="card-text1" >총 회원수</p>
	    <p class="card-text"><%=memNum %>명</p>
	    <a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc" class="btn btn-primary"><span>회원관리 바로가기</span></a>
	  </div>
	</div>
	
	
	<div class="card" style="width: 18rem;">
	  <img src="./image/appointment.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">예약관리</h5>
	    <p class="card-text1" >금일 예약현황</p>
	    <p class="card-text"><%=revNum %>건</p>
	    <a href="authRev?command=curRev" class="btn btn-primary">예약관리 바로가기</a>
	  </div>
	</div>
	
	<div class="card" style="width: 18rem;">
	  <img src="./image/question.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">Q & A </h5>
	    <p class="card-text1" >미응답 질문</p>
	    <p class="card-text"><%=noAnswerNum %>건</p>
	    <a href="auth?command=noAnswer" class="btn btn-primary">답변관리 바로가기</a>
	  </div>
	</div>
	
	
	
	<div class="card" style="width: 18rem;">
	  <img src="./image/chess.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">게임보유현황</h5>
	    <p class="card-text1" >보유게임 수</p>
	    <p class="card-text"> 개</p>
	    <a href="#" class="btn btn-primary">게임관리 바로가기</a>
	  </div>
	</div>
	
	<div class="card" style="width: 18rem;" align="center">
	  <img src="./image/round-table.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">테이블관리</h5>
	    <p class="card-text1" >예약테이블</p>
	    <p class="card-text"> <%=tableNum %>개</p>
	    <a href="#" class="btn btn-primary">테이블관리 바로가기</a>
	  </div>
	</div>
</div>

<div class="chart">
<figure class="highcharts-figure">
    <div id="container"></div>

    <button id="plain">Plain</button>
    <button id="inverted">Inverted</button>
    <button id="polar">Polar</button>
</figure>
</div>

<script type="text/javascript">
var currentPosition = parseInt($("#sidebox").css("top"));
$(window).scroll(function() { 
	var position = $(window).scrollTop();
	$("#sidebox").stop().animate({"top":position+currentPosition+"px"},400); 
});

$(window).resize(function (){
	 var width_size = window.outerWidth;
	 
	 if (width_size <= 800) {
		 $("#sidebox").attr("id","sidebox2");
	 }else {
		 $("#sidebox2").attr("id","sidebox");
	 }
});

<<<<<<< HEAD
<a href="auth?command=getMemlist&pageNum=0&item=name&sort=asc">회원리스트보기</a>
<br>
<a href="adminServlet?command=tableCheck">매장 테이블 현황과 예약 테이블 설정</a>

=======

var chart = Highcharts.chart('container', {

    title: {
        text: '월별 예약 현황'
    },
/*
    subtitle: {
        text: 'Plain'
    },
*/
    xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },

    series: [{
        type: 'column',
        colorByPoint: true,
        data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
        showInLegend: false
    }]

});


$('#plain').click(function () {
    chart.update({
        chart: {
            inverted: false,
            polar: false
        },
        subtitle: {
            text: 'Plain'
        }
    });
});

$('#inverted').click(function () {
    chart.update({
        chart: {
            inverted: true,
            polar: false
        },
        subtitle: {
            text: 'Inverted'
        }
    });
});

$('#polar').click(function () {
    chart.update({
        chart: {
            inverted: false,
            polar: true
        },
        subtitle: {
            text: 'Polar'
        }
    });
});


</script>
>>>>>>> Sim_Css

</body>
</html>