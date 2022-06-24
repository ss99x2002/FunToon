<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 회차 등록하기</title>
<script>
function cancel()
{
	var check = confirm("등록을 취소하시겠습니까?");
	if (check)
		{
		window.location.href="main.jsp";
		}
	else
		{
		window.location.href="toon_detail_list_enroll.jsp";
		}
	}
</script>
</head>
<style>
table
{	
	font-size: 17px;
	margin : auto;
	text-align:left;
	color:black;
	border-top:none;
	border-left : none;
	border-right:none;
	border-bottom: 1px solid black;
	border-collapse : collapse;
	width : 900px;
	border-spacing : 100px;
	table-layout:fixed;
}
caption
{
	border-bottom : 3px solid black;
	font-size : 19px;
	text-align:left;
	font-weight:600;
	margin : 20px;
}
td
{
	border-bottom:1px solid black;
	padding : 10px;
}

#submit
{
	margin-top:10px;
	background-color : #3270ff;
	color : balck;
	text-align:center;
	border:solid 1px black;
	border-radius:7px;
	position: fixed;
	right:260px;
}
#reset
{
margin-top:10px;
position: fixed;
right:210px;
background-color:b3b3b3;
color:black;
text-align:center;
border:solid 1px black;
	border-radius:7px;
}
#logoimage
{
	margin : 10px;
}

</style>
<header>
<img src="작은로고.png" id="logoimage" style="width:220px; height:55px;" onclick = "location.href='main.jsp'">
</header>
<body>
<form action="toon_detail_list_enroll_save.jsp" enctype ="multipart/form-data" method="post" accept-charset="UTF-8">
<table frame= void>
	<caption> 웹툰 회차 등록하기</caption>
	<tr>
		<td>웹툰 제목</td>
		<td>
		<input type="text"  name ="title" id="title" >
		</td>
	</tr>
		<tr>
		<td>회차 (숫자만 입력하세요)</td>
		<td>
		<input type="text"  name ="part" id="part" >
		</td>
	</tr>
	<tr>
		<td>회차 제목</td>
		<td><input type="text"  name= "sub_title" id="sub_title" ></td>
	</tr>
		<tr>
		<td>날짜</td>
		<td><input type="date"  name= "date" id="date" ></td>
	</tr>
	<tr>
		<td>대표이미지</td>
		<td>
		<input type="file" accept="image/jpg" id="fileName1" name="fileName1">
		</td>
	</tr>
		<tr>
		<td>내용 이미지</td>
		<td>
		<input type="file" accept="image/jpg" id="fileName2" name="fileName2">
		</td>
	</tr>
</table>
<div>
<button type ="submit" id="submit">
등록하기
</button>
<button type ="reset" id="reset" onclick= "cancel()">
취소
</button>
</div>
</form>
</body>
</html>