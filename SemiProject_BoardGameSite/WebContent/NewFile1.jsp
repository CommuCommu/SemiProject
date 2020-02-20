<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"> </script>
<style type = "text/css">
* { margin: 0; font-family: verdana; }
html { background:#37474F; }
header{
  margin:0 auto;
  width:2000px;
  height:150px;
  background-color: transparent;
  cursor: pointer;
  
}
.nav{
  width:200px;
  height:230px;
  float:left;
 	position:absolute;
 	top:500px;
}
#one{

  background-color: rgb(208,101,3);
}
#two{
  background-color: rgb(233,147,26);
}
#three{
  background-color: rgb(22,145,190);
}
#four{
  background-color: rgb(22,107,162);
}
#five{
  background-color: rgb(27,54,71);
}
#six{
  background-color: rgb(21,40,54);
}
.icon{
  display:block;
  margin:50px auto;
  background-color: rgba(255,255,255,.15);
  width:40px;
  padding:20px;
  -WebKit-border-radius:50%;
  -WebKit-box-shadow: 0px 0px 0px 30px rgba(255,255,255,0);
  -WebKit-transition:box-shadow .4s;
}
.text{
  text-align:center;
  color:white;
  font-size:1.2em;
  padding-top:10px;
  opacity:.6;
  -WebKit-transition:padding-top .4s
}
.nav:hover{
  height:250px;
  -WebKit-transition:height .4s
}
.nav:hover .text{
  padding-top:30px;
  opacity: 1;
}
#one:hover .icon{
  -WebKit-box-shadow:0px 0px 0px 0px rgb(252,150,57);
}
#two:hover .icon{
  -WebKit-box-shadow:0px 0px 0px 0px rgb(238,172,80);
}
#three:hover .icon{
  -WebKit-box-shadow:0px 0px 0px 0px rgb(93,198,236);
}
#four:hover .icon{
  -WebKit-box-shadow:0px 0px 0px 0px rgb(24,118,179);
}
#five:hover .icon{
  -WebKit-box-shadow:0px 0px 0px 0px rgb(24,49,63);
}
#six:hover .icon{
  -WebKit-box-shadow:0px 0px 0px 0px rgb(14,26,36);
}
</style>
</head>
<body>

<html>
<head>
  <meta charset="utf-8">
  <title>hover effect</title>
  <link rel="stylesheet" href="style/index_style.css"> </link>
</head>
<body>
<div align = "center">
   <header>
     <div class="nav" id="one">
       <image class="icon"src="http://rs1377.pbsrc.com/albums/ah58/ebenhafkamp/icon1_zps5f01cb6e.png~c100">
         <p class="text">Home</p>
     </div>
     
     <div class="nav" id="two">
       <image class="icon"src="http://rs1377.pbsrc.com/albums/ah58/ebenhafkamp/icon3_zps15e99945.png~c100">
         <p class="text">Google +</p>
     </div>    
     
     <div class="nav" id="three">
       <image class="icon"src="http://rs1377.pbsrc.com/albums/ah58/ebenhafkamp/icon4_zps399826a3.png~c100">
         <p class="text">Apple</p>
     </div>
     
     <div class="nav" id="four">
       <image class="icon"src="http://rs1377.pbsrc.com/albums/ah58/ebenhafkamp/icon5_zps6cba3f19.png~c100">
         <p class="text">HTML 5</p>
     </div>
     
     <div class="nav" id="five">
       <image class="icon"src="http://rs1377.pbsrc.com/albums/ah58/ebenhafkamp/icon2_zps07da45f2.png~c100">
         <p class="text">Pages</p>
     </div>
     
     <div class="nav" id="six">
       <image class="icon"src="http://rs1377.pbsrc.com/albums/ah58/ebenhafkamp/icon6_zps89b62c7e.png~c100">
         <p class="text">Mail</p>
     </div>
   </header>
 </div>  
   
   <script type="text/javascript">
   
   
   </script>
</body>  




</body>
</html>