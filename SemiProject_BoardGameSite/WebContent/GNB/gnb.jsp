<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
<style type = "text/css">

body {
  font-family: "Century Gothic", "Lato", sans-serif;
  z-index: 3;
}

a {
  text-decoration: none;
}

.et-hero-tabs,
.et-slide {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 130px;
  position: relative;
  /* background: #eee; */
  text-align: center;
  padding: 0 2em;
  z-index: 3;
}
.et-hero-tabs h1,
.et-slide h1 {
  font-size: 2rem;
  margin: 0;
  letter-spacing: 1rem;
  z-index: 3;
}
.et-hero-tabs h3,
.et-slide h3 {
  font-size: 1rem;
  letter-spacing: 0.3rem;
  opacity: 0.6;
  z-index: 3;
}

.et-hero-tabs-container {
  display: flex;
  flex-direction: row;
  position: absolute;
  bottom: 0;
  width: 100%;
  height: 70px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  background: #fff;
  z-index: 10;
  position:absolute;
 	top:20px;
 	z-index: 3;
}
.et-hero-tabs-container--top {
  position: fixed;
  top: 0;
  z-index: 3;
}

.et-hero-tab {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  color: #000;
  letter-spacing: 0.1rem;
  transition: all 0.5s ease;
  font-size: 0.8rem;
  z-index: 3;
  
}
.et-hero-tab:hover {
  color: white;
  background: rgba(102, 177, 241, 0.8);
  transition: all 0.5s ease;
  z-index: 3;
}

.et-hero-tab-slider {
  position: absolute;
  bottom: 0;
  width: 0;
  height: 6px;
  background: #66B1F1;
  transition: left 0.3s ease;
  z-index: 3;
}

@media (min-width: 800px) {
  .et-hero-tabs h1,
.et-slide h1 {
    font-size: 3rem;
    z-index: 3;
  }
  .et-hero-tabs h3,
.et-slide h3 {
    font-size: 1rem;
    z-index: 3;
  }

  .et-hero-tab {
    font-size: 1rem;
    z-index: 3;
  }
}






.dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  z-index:99 !important;
  
}

.dropdown {
  align : right;
  position: relative;
  display: inline-block;
  z-index:99 !important;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #e8e8e8;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 99 !important;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  z-index:1 !important;
}

.dropdown-content a:hover {background-color: #ddd; z-index:1 !important;}

.dropdown:hover .dropdown-content {display: block; z-index:1 !important;}

.dropdown:hover .dropbtn {background-color: #3e8e41; z-index:1 !important;}


</style>
</head>
<body>

<%
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
		
	} else {
		mem = (MemberDto)oLogin;
	}
%>

<div align = "right" style = "padding-left: calc(90% - 120px); padding-top:15px" class="dropdown">
<img class = "dropImage" src = "./GNB/people.png" style = "width:40px; height: 33px;">
	<div class = "dropdown-content">
	<% if(oLogin == null) { %>
		<a href = "login.jsp"> 로그인 </a>
		<a href = "addmember?command=add"> 회원가입 </a>
	<% } else { %>
		<a href = "personalInfo.jsp"> 내정보 </a>
		<a href = "login?command=logout"> 로그아웃 </a>
		<% if (mem.getAuth() == 1) { %>
		<hr>
		<a href = "./auth?command=adminMain"> 관리자 페이지 </a>
		<% } %>
	<% } %>
		
	</div>
	<% if(oLogin == null) { %>
		안녕하세요, Guest님
	<% } else { %>
		
		안녕하세요, <%=mem.getName() %>님
	<% } %>
	
</div>


<%--
<section class="et-hero-tabs">
    <div class="et-hero-tabs-container">
      <a class="et-hero-tab" href="notice.jsp">NOTICE</a>
      <a class="et-hero-tab" href="gameList.jsp">GAME LIST</a>
      <a class="et-hero-tab" href="reservation.jsp">RESERVATION</a>
      <a class="et-hero-tab" href="epiloguelist.jsp">EPILOGUE</a>
      <a class="et-hero-tab" href="qnaServlet?action=list">Q&A</a>
      <a class="et-hero-tab" href="mapEx.jsp">DIRECTION</a>
      <span class="et-hero-tab-slider"></span>
    </div>
  </section>
--%>
<!-- <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark"> -->
<nav class="navbar navbar-expand-sm bg-success navbar-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="./notice.jsp">공지</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./gameList.jsp">게임목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./reservation.jsp">예약</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./epiloguelist.jsp">후기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./map.jsp">위치</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="qnaServlet?action=list">Q & A</a>
      </li>
      
      <% if(oLogin != null) { %>
      	<%if(mem.getAuth() == 1) {%>
	      <li class="nav-item">
	        <a class="nav-link" href="./auth?command=adminMain">관리자</a>
	      </li>
      	<% } %>
      <% } %>
      
    </ul>
    
    <form class="form-inline my-2 my-lg-0">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="./GNB/profile.png" width="40px" height="40px">
        </a> 
        <% if(oLogin == null) { %>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./login.jsp">로그인</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="addmember?command=add">회원가입</a>
        </div>
        <% }else { %>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="./personalInfo.jsp">내정보</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="login?command=logout">로그아웃</a>
        </div>	
        <% } %>
      </li>
    </ul>
    <span class="navbar-text">
    	<% if(oLogin == null) { %>
    		반갑습니다. 게스트님.
    	<% }else { %>
    		반갑습니다. <%=mem.getName() %>님.
    	<% } %>
	      
	    </span>
    </form>
  </div>
</nav>
</header>


<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- CDN 이용시 추가 -->
<!--
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> 
-->


</body>
</html>