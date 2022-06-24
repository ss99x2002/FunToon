<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
 <% request.setCharacterEncoding("utf-8");
 	String idx = request.getParameter("idx");
 	int sIdx = Integer.parseInt(idx);
 	
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
    String sql = "DELETE FROM webtoon_list WHERE idx='" + sIdx + "'";
    pstmt = con.prepareStatement(sql);
    pstmt.executeUpdate();
    String sql2 ="ALTER TABLE webtoon_list AUTO_INCREMENT=1";
    pstmt2 = con.prepareStatement(sql2);
    pstmt2.executeUpdate();
	} 
    catch(SQLException e) 
    {
		out.println("Error : " + e.getMessage());
		return;
	} 
    catch(Exception e) {
	out.println(" Error : " + e.getMessage());
    }
    response.sendRedirect("toon_delete.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 데이터 페이지</title>
</head>
<body>

</body>
</html>