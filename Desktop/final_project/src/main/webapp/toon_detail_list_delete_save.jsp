<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<!DOCTYPE html>
 <% request.setCharacterEncoding("utf-8");
 	String part = request.getParameter("part");
 	
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
    String DB_USER ="admin";
    String DB_PASSWORD = "1234";
   
    Connection con= null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    try
    {  	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    String sql = "DELETE FROM sub_webtoon WHERE part='" + part + "'";
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
    response.sendRedirect("main.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>