<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.login_form
{
border: 0;
border-radius:5px;
background-color:#EEEFF1;
padding:20px;
position:absolute;
top:100px;
left:40%;
width:300px;
}
.text_filed
{
font-size:14px;
margin-bottom:10px;
border:none;
border-radius :5px;
padding:10px;
width:95%;
}
.submit_btn
{
color:white;
background-color:#3270ff;
font-size: 14px;
margin-bottom:30px;
padding:10px;
border:none;
border-radius:5px;
width:100%;
}
#topmenu
{
	margin:auto;
	padding:auto;
	height: 30px;
	width: 1000px;
}
#topmenu ul li
{
	list-style: none;
	color:black;
	float:left;
	vertical-align:middle;
	text-align:center;
}
#topmenu .menuLink
{
	text-decoration:none;
	color:black;
	display: block;
	width: 150px;
	font-size:15px;
	font-weight:bold;
}
#topmenu .menuLink:hover
{
	color:#3270ff;
}
</style>
<meta charset="UTF-8">
<title>login 페이지</title>
</head>
<body>
<nav id ="topmenu">
	<ul>
		<li> <a class = "menuLink" href ="main.jsp">홈</a></li>
		<li> <a class = "menuLink" href ="toon_romance.jsp">판타지</a></li>
		<li> <a class = "menuLink" href ="toon_romance.jsp">로맨스 </a></li>
		<li> <a class = "menuLink" href ="#">일상물 </a></li>
		<li> <a class = "menuLink" href ="#">호러 </a></li>
	</ul>
</nav>
<div class="login_form" >
	<h4>FunToon 로그인</h4>
	<form action ="login_check.jsp" method="post">
		<input type="text" name ="id" class= "text_filed" value="아이디">
		<input type="password" name="pwd" class= "text_filed" value="비밀번호를입력하세요">
		<button type="submit" class="submit_btn">로그인하기</button>
	</form>
</div>
</body>
</html>