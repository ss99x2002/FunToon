<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, java.util.*,myBean.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8");
 	String stitle = request.getParameter("title");
 	String sgenre = request.getParameter("genre");
 	String swriter = request.getParameter("writer");
 	String sidx = request.getParameter("idx");
 	String sContent = request.getParameter("content");
 	int sIdx = Integer.parseInt(sidx);
 	
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
    String DB_USER ="admin";
    String DB_PASSWORD = "1234";
   
    ServletContext context = getServletContext();
    String realFolder = context.getRealPath("upload");
    
    Collection<Part> parts = request.getParts();
    MyMultiPart multipart = new MyMultiPart(parts, realFolder);
    String originalFileName="";
    String savedFileName="";
   
    if (multipart.getMyPart("fileName")!=null)
    {
    	originalFileName= multipart.getOriginalFileName("fileName");
    	savedFileName= multipart.getSavedFileName("fileName");
    }
    
    Connection con= null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try
    {  	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    String sql = "UPDATE webtoon_list SET content = '"+ sContent +"', title ='" + stitle + "', originalFileName= '"+originalFileName +"',genre='" + sgenre + "',savedFileName ='"+ savedFileName + "', writer = '" + swriter + "' WHERE idx='" + sIdx + "'";
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