<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
    <%
    
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs =null;
    
    String jdbc_driver = "org.mariadb.jdbc.Driver";
    String jdbc_url = "jdbc:mariadb://localhost:3306/webtoon?useUnicode=true&characterEncoding=utf8&useSSL=false";
    	
    String sql = "select * from member where id =? and pwd =?";
    
    try
    {
    	  Class.forName(jdbc_driver);
    	    con=DriverManager.getConnection(jdbc_url,"admin","1234");
    	    pstmt = con.prepareStatement(sql);
    	    pstmt.setString(1,id);
    	    pstmt.setString(2,pwd);
    	    
    	    rs= pstmt.executeQuery();
    	    
    	    if (rs.next())
    	    {
    	    	int flag=1;
    	    	id = rs.getString("id");
    	    	String name = rs.getString("name");
    	    	
    	    	session.setAttribute("id", id);
    	    	session.setAttribute("name", name);
    	    	session.setAttribute("flag",flag);
    	    	response.sendRedirect("main.jsp");
    	    }
    	    else
    	    {
    	    	response.sendRedirect("fail.jsp");
    	    }
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    	response.sendRedirect("login.jsp");
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>