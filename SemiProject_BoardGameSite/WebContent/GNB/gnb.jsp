<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
<%
	Object oLogin = session.getAttribute("login");
	MemberDto mem = null;
	if(oLogin == null) {
		
	}else {
		mem = (MemberDto)oLogin;
	}
%>	





<header>
	<div align="center">
		<a class="navbar-brand" href="./main.jsp"><img src="./GNB/icon.png" width="120px" height="120px"></a>
	</div>


<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
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
        <a class="nav-link" href="./qna.jsp">Q & A</a>
      </li>
      
      <% if(oLogin != null) { %>
      	<%if(mem.getAuth() == 1) {%>
	      <li class="nav-item">
	        <a class="nav-link" href="./admin.jsp">관리자</a>
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


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</body>
</html>