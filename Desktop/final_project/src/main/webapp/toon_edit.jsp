<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*,java.util.*,myBean.*"%>
<!DOCTYPE html>
    <%
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
    String DB_USER ="admin";
    String DB_PASSWORD = "1234";
   
    Connection con= null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try
    {  	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    String sql = "SELECT * FROM webtoon_list";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
	} 
    catch(SQLException e) 
    {
		out.println("Error : " + e.getMessage());
		return;
	} 
    catch(Exception e) {
	out.println(" Error : " + e.getMessage());
	return;
	}
    %>
<html>
<head>
<meta charset="UTF-8">
<title>toon_delete</title>
</head>
<script>
function cancel()
{
	var check = confirm("수정을 취소하시겠습니까?");
	if (check)
		{
		location.href="main.jsp";
		}
	else
		{
		location.href="toon_edit.jsp";
		}
	}
</script>
<style>
#idx
{
display:none;
width:0px;
height:0px;
}
div.header
{
	top:10px;
	margin:20px;
	text-align:center;
}

#logoimage
{
	position:relative;
	right:140px;
	top:5px;
}

span.search
{
	position: relative;
	bottom:20px;
	right:100px;
	padding:10px;
	
}
#search.icon
{
	position:relative;
	top:3px;
}
#box
{
	position :relative;
	left:10px;
	background-color:#d9d9d9;
	border:none;
	border-radius:8px;
	width:500px;
	height:30px;
	font-size:15px;
}
span.buttons
{
	position: relative;
	right:80px;
	bottom: 20px;
}
#toon_edit
{
background-color:#3270ff;
border-radius:8px;
	border:1px solid black;
}
#toons_cancel
{
background-color:b3b3b3;
border-radius:8px;
	border:1px solid black;
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
	font-size:20px;
	font-weight:bold;
}
#topmenu .menuLink:hover
{
	color:#3270ff;
}
#Thumbnail1
{
	margin:20px;
	width:130px;
	height:130px;
	border-radius: 7px;
	text-align:center;
}
.list
{
	top:10px;
	margin:auto;
	text-align:left;
	position:relative;
	right:20px;
}
.list ul
{
list-style:none;
padding-left:0px;
}
.list td
{
width:50px;
height:170px;
}
li.title
{
	text-decoration-line:none;
	font-size:23px;
	font-weight:600;
}
</style>
<div class="header">
<span class="logo">
<img src="작은로고.png" id="logoimage" style="width:220px; height:55px;" onclick = "location.href='main.jsp'">
</span>
<span class="search">
<img src="search.icon.png" id="search.icon" style = "width:20px; height:20px;">
<span id="searchbox"><input type="text" id="box" value="웹툰명/작가명을 검색하세요. "> </span>
</span>
<span class="buttons">
<span> <input type="submit" value ="수정" id="toon_edit" onclick = "location.href='main.jsp'">  </span>
<span> <input type="button" value ="취소" id="toons_cancel" onclick = "cancel()"></span>
</span>
</div>
<body>
<nav id ="topmenu">
	<ul>
		<li> <a class = "menuLink" href ="#">홈</a></li>
		<li> <a class = "menuLink" href ="#">연재작</a></li>
		<li> <a class = "menuLink" href ="#">로맨스 </a></li>
		<li> <a class = "menuLink" href ="#">일상물 </a></li>
		<li> <a class = "menuLink" href ="#">호러 </a></li>
		<li> <a class = "menuLink" href ="#">완결작 </a></li>
	</ul>
</nav>
<form action="webtoon_delete.jsp" method="post">
<table class="list">
<%
int num =0;
while(rs.next())
{
	int idx= rs.getInt("idx");
	if (num%2==0 && num!=0)
	{
%>
<tr>
<%if (idx%2!=0)
{ %>
	
	<td class="check">
	<form action="toon_edit_save.jsp" method="post" enctype ="multipart/form-data">
	<button type="submit">수정</button>		
	</td>
	<td>
	<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
	</td>
	<td>
	<ul>
	<% String title = (String)rs.getString("title"); %>
	<input type="text" name="idx" id="idx"value ="<%=rs.getInt("idx")%>">
	<li class="title"><input type="text" name="title" value="<%=rs.getString("title") %>" style="font-size:20px; width:180px;"></li>
	<li><input type="text" name="writer" value="<%=rs.getString("writer")%>" style="font-size:15px; width:80px;">
	<input type="text" name="genre" value="<%=rs.getString("genre")%>" style="font-size:15px; width:85px;"></li>
	<li><input type="file"></li>
	</form>
	</ul>
	</td>
	<% num++;} 
	else
	{ %><td class="check">
	<form action="toon_edit_save.jsp" method="post" enctype ="multipart/form-data">
	<button type="submit">수정</button>		
	</td>
	<td>
<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
	</td>
	<td>
	<ul>
		<% String title = (String)rs.getString("title"); %>
	<input type="text" name="idx" id="idx"value ="<%=rs.getInt("idx")%>">
	<li class="title"><input type="text" name="title" value="<%=rs.getString("title") %>" style="font-size:20px; width:180px;"></li>
	<li><input type="text" name="writer" value="<%=rs.getString("writer")%>" style="font-size:15px; width:80px;">
	<input type="text" name="genre" value="<%=rs.getString("genre")%>" style="font-size:15px; width:85px;"></li>
	<li><input type="file"></li>
	</form>
	</ul>
	</td>
	<% num++;}
	}
else { 
	if (idx%2!=0)
		{%><td class="check">
		<form action="toon_edit_save.jsp" method="post" enctype ="multipart/form-data">
	<button type="submit">수정</button>		
	</td>
			<td>
			<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
			</td>
			<td>
			<ul>
			<% String title = (String)rs.getString("title"); %>
	<input type="text" name="idx" id="idx"value ="<%=rs.getInt("idx")%>">
	<li class="title"><input type="text" name="title" value="<%=rs.getString("title") %>" style="font-size:20px; width:180px;"></li>
	<li><input type="text" name="writer" value="<%=rs.getString("writer")%>" style="font-size:15px; width:80px;">
	<input type="text" name="genre" value="<%=rs.getString("genre")%>" style="font-size:15px; width:85px;"></li>
	<li><input type="file"></li>
	</form>
			</ul>
			</td>
			<% num++;} 
			else
			{ %>
			<td class="check">
				<form action="toon_edit_save.jsp" method="post" enctype ="multipart/form-data">
	<button type="submit">수정</button>		
	</td>
			<td>
		<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
			</td>
			<td>
			<ul>
			<% String title = (String)rs.getString("title"); %>
	<input type="text" name="idx" id="idx"value ="<%=rs.getInt("idx")%>">
	<li class="title"><input type="text" name="title" value="<%=rs.getString("title") %>" style="font-size:20px; width:180px;"></li>
	<li><input type="text" name="writer" value="<%=rs.getString("writer")%>" style="font-size:15px; width:80px;">
	<input type="text" name="genre" value="<%=rs.getString("genre")%>" style="font-size:15px; width:85px;"></li>
	<li><input type="file"></li>
	</form>
			</ul>
			</td>
			<% num++;}
	} 
} %>
</tr>
</table>
</form>
<%
rs.close();
pstmt.close();
con.close();
%>


</body>
</html>