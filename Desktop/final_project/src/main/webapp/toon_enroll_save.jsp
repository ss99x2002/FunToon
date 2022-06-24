<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, java.util.*,myBean.*"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
    String DB_USER ="admin";
    String DB_PASSWORD = "1234";
    String jdbc_driver = "org.mariadb.jdbc.Driver";
   
    String sTitle = request.getParameter("title");
    String sGenre = request.getParameter("genre");
    String sWriter = request.getParameter("writer");
    String sContent = request.getParameter("content");

    
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
	   Class.forName(jdbc_driver);
	   con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	   String sql = "INSERT INTO webtoon_list (title, genre, writer,content,originalFileName, savedFileName) VALUES(?,?,?,?,?,?)";
	   pstmt = con.prepareStatement(sql);
	  pstmt.setString(1,request.getParameter("title"));
	  pstmt.setString(2,request.getParameter("genre"));
	  pstmt.setString(3,request.getParameter("writer"));
	  pstmt.setString(4,request.getParameter("content"));
	  pstmt.setString(5,originalFileName);
	  pstmt.setString(6,savedFileName);
	   if (request.getParameter("title") !=null)
	   {
		   pstmt.executeQuery();
	   }
   }
	   catch(Exception e)
	   {
		   out.println(e);
		   return;
	   }
   pstmt.close();
   con.close();
   response.sendRedirect("main.jsp");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 저장 페이지</title>
</head>
<body>

</body>
</html>