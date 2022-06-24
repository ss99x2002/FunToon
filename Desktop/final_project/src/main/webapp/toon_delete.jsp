<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
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
    String id= (String)session.getAttribute("id");
    String name= (String)session.getAttribute("name");
    String flag = (String) session.getAttribute("flag");
    
    %>
<html>
<head>
<meta charset="UTF-8">
<title>toon_delete</title>
</head>
<script>
function cancel()
{
	var check = confirm("삭제를 취소하시겠습니까?");
	if (check)
		{
		window.location.href="main.jsp";
		}
	else
		{
		window.location.href="toon_delete.jsp";
		}
	}
</script>
<style>
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
#delete
{
background-color:#3270ff;
border-radius:8px;
	border:1px solid black;
}
#cancel
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
	width:1000px;
}
.list ul
{
list-style:none;
padding-left:0px;
}
.list td
{
width:160px;
height:170px;
}
li.title
{
	text-decoration-line:none;
	font-size:23px;
	font-weight:600;
}
.check input
{
padding:0px;
width:20px;
height:20px;
}
.check
{
text-align:right;
padding:0px;
margin:0px;
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
<span> <input type="button" value ="확인" id="delete" onclick = "location.href='main.jsp'">  </span>
<span> <input type="button" value ="취소" id="cancel" onclick = "cancel()"></span>
</span>
</div>
<body>
<nav id ="topmenu">
	<ul>
		<li> <a class = "menuLink" href ="main.jsp">홈</a></li>
		<li> <a class = "menuLink" href ="#">연재작</a></li>
		<li> <a class = "menuLink" href ="#">로맨스 </a></li>
		<li> <a class = "menuLink" href ="#">일상물 </a></li>
		<li> <a class = "menuLink" href ="#">호러 </a></li>
		<li> <a class = "menuLink" href ="#">완결작 </a></li>
	</ul>
</nav>
<form action="webtoon_delete.jsp" method="post">
<table class="list">
<tr>
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
				<a href="#"><p onclick ="location.href='webtoon_delete.jsp?idx=<%=rs.getInt("idx")%>'">✓</p></a>
	</td>
	<td>
	<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
	</td>
	<td>
	<ul>
	<% String title = (String)rs.getString("title"); %>
			<li class="title"> <a href = "#"> <p onclick="location.href='toon_detail.jsp?title=<%=rs.getString("title")%>'"><%=rs.getString("title")%></p></a></li>
			<li><%=rs.getString("writer")%>/<%=rs.getString("genre")%></li>
	</ul>
	</td>
	<% num++;} 
	else
	{ %>
			<td class="check">
		<a href="#"><p onclick ="location.href='webtoon_delete.jsp?idx=<%=rs.getInt("idx")%>'">✓</p></a>
		</td>
		<td>
		
	<td>
	<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
	</td>
	<td>
	<ul>
		<% String title = (String)rs.getString("title"); %>
			<li class="title"> <a href = "#"> <p onclick="location.href='toon_detail.jsp?title=<%=rs.getString("title")%>'"><%=rs.getString("title")%></p></a></li>
			<li><%=rs.getString("writer")%>/<%=rs.getString("genre")%></li>
	</ul>
	</td>
	<% num++;}
	}
else { 
	if (idx%2!=0)
		{%>
				<td class="check">
					<a href="#"><p onclick ="location.href='webtoon_delete.jsp?idx=<%=rs.getInt("idx")%>'">✓</p></a>
				</td>
			<td>
			<img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
			</td>
			<td>
			<ul>
			<% String title = (String)rs.getString("title"); %>
			<li class="title"> <a href = "#"> <p onclick="location.href='toon_detail.jsp?title=<%=rs.getString("title")%>'"><%=rs.getString("title")%></p></a></li>
			<li><%=rs.getString("writer")%>/<%=rs.getString("genre")%></li>
			</ul>
			</td>
			<% num++;} 
			else
			{ %>
			<td class="check">
			<a href="#"><p onclick ="location.href='webtoon_delete.jsp?idx=<%=rs.getInt("idx")%>'">✓</p></a>
				</td>
			<td>
			 <img src="./upload/<%=rs.getString("savedFileName")%>" id="Thumbnail1" >
			<td>
			<ul>
			<% String title = (String)rs.getString("title"); %>
			<li class="title"><a href = "#"> <p onclick="location.href='toon_detail.jsp?title=<%=rs.getString("title")%>'"><%=rs.getString("title")%></p></a></li>
			<li><%=rs.getString("writer")%>/<%=rs.getString("genre")%></li>
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