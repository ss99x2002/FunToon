<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
    <%
    request.setCharacterEncoding("utf-8");
    String title = (String)request.getParameter("title");
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
    String DB_USER ="admin";
    String DB_PASSWORD = "1234";
   
    Connection con= null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    ResultSet rs2= null;
    try
    {  	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    String sql = "SELECT * FROM webtoon_list WHERE title='" + title + "'";
    String sql2= "SELECT * FROM sub_webtoon WHERE title='" + title + "'";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
    pstmt2= con.prepareStatement(sql2);
    rs2=pstmt2.executeQuery();
    
   // String sql2= "SELECT * FROM "
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
<title>웹툰 디테일</title>
<script>
</script>
</head>
<style>
span.search
{
	position: absolute;
	top:20px;
	left:30%;
	padding:10px;
	
}
span.buttons
{
	position: absolute;
	right:20%;
	top: 30px;
}
#toon_enroll
{
background-color:#3270ff;
border-radius:8px;
	border: 2px solid #004DFF;
}
#main_edit
{
background-color:b3b3b3;
border-radius:8px;
	border:2px solid #E8E8E8;
}
#search.icon
{
	position:absolute;
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
table
{	
top:30px;
margin-left:auto;
margin-right:auto;
	text-align:left;
	color:black;
	width : 1000px;
	table-layout:fixed;
}

.mains
{
width:800px;
height:260px;
}
#sub
{
font-size:17px;
text-align:left;
padding:5px;
}
.subs td
{
text-align:left;
padding-left:10px;
height:20px;
border-bottom:2px solid black;
}
.list td
{
padding-top:20px;
height:50px;
}
.list #img
{
padding-left:30px;
}
.buttons_ed
{
text-align:right;
}
#toon_edit
{
background-color:#3270ff;
border-radius:8px;
	border:1px solid black;
}
#toons_delete
{
background-color:b3b3b3;
border-radius:8px;
	border:1px solid black;
}
</style>
<div class="header">
<span class="logo">
<img src="작은로고.png" id="logoimage" style="width:220px; height:55px; margin : 10px; position:relative; left:13%;"onclick = "location.href='main.jsp'">
</span>
<span class="search">
<img src="search.icon.png" id="search.icon" style = "width:20px; height:20px;">
<span id="searchbox"><input type="text" id="box" value="웹툰명/작가명을 검색하세요. "> </span>
</span>
</div>
<body>
<%
while (rs.next())
{%>
<span class="buttons">
<span> <input type="button" value ="회차 등록" id="toon_enroll" onclick ="location.href='toon_detail_list_enroll.jsp'">  </span>
<span> <input type="button" value ="대표 수정" id="main_edit" onclick = "location.href='toon_detail_main_edit.jsp?title=<%=rs.getString("title")%>'"></span>
</span>
<table frame= void >
	<tr class="mains">  
		<td>
		<img src="./upload/<%=rs.getString("savedFileName")%>" style="width:200px; height:200px; text-align:center; border-radius:7px;">
		</td>
		<td colspan='2'>
		<div id="titles" style="font-size:30px; font-weight:600; padding:5px; font-align:left;"><%=title%> </div>
		<div id="sub"> 작가 <%=rs.getString("writer")%> </div>
		<div id="sub"> 장르 <%=rs.getString("genre") %></div>
		<div id="sub"> 내용 <%=rs.getString("content") %></div>
		</td>
	</tr>
	<tr class ="subs">
		<td>이미지</td>
		<td>제목</td>
		<td>등록일</td>
	</tr>
	<tr class="buttons_ed">
	<td colspan='3'>
	<input type="button"  id="toon_edit" value="수정" onclick="location.href='toon_detail_list_edit.jsp?title=<%=rs.getString("title")%>'">
	<input type="button"  id="toons_delete" value="삭제" onclick="location.href='toon_detail_list_delete.jsp?title=<%=rs.getString("title")%>'">
	<%while(rs2.next()) { %>
	</td>
	</tr>
		<tr class = "list">
		<td id="img">
		<img src="./upload/<%=rs2.getString("savedFileName1")%>" style="width:90px; height:90px; border-radius:5px; text-align:center">
		</td>
		<td><%=rs2.getString("part")%>화 <%=rs2.getString("subtitle")%></td>
		<td><%=rs2.getString("date")%></td>
	</tr>
	<%
	}
}%>
</table>
<%
rs.close();
pstmt.close();
rs2.close();
pstmt2.close();
con.close();
%>
</body>
</html>