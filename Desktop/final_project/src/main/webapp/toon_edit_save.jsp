<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8");
 	String stitle = request.getParameter("title");
 	String sgenre = request.getParameter("genre");
 	String swriter = request.getParameter("writer");
 	
 	String sidx = request.getParameter("idx");
 	int sIdx = Integer.parseInt(sidx);
 	
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
    String sql = "UPDATE webtoon_list SET title ='"+stitle + "', genre='"+sgenre + "', writer = '"+swriter + "' WHERE idx='" + sIdx + "'";
    pstmt = con.prepareStatement(sql);
    pstmt.executeUpdate();
	} 
    catch(SQLException e) 
    {
		out.println("Error : " + e.getMessage());
		return;
	} 
    catch(Exception e) {
	out.println(" Error : " + e.getMessage());
    }
    response.sendRedirect("toon_edit.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>