<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, java.util.*,myBean.*"%>
<!DOCTYPE html>
    <%
    request.setCharacterEncoding("utf-8");
    
    String sTitle = request.getParameter("title");
    String sPart = request.getParameter("part");
    String sSubtitle = request.getParameter("sub_title");
    String sDate = request.getParameter("date");
   
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
   String DB_USER ="admin";
   String DB_PASSWORD = "1234";
   String jdbc_driver = "org.mariadb.jdbc.Driver";
  
   ServletContext context = getServletContext();
   String realFolder = context.getRealPath("upload");
   
   Collection<Part> parts = request.getParts();
   MyMultiPart multipart = new MyMultiPart(parts, realFolder);
   String originalFileName1="";
   String savedFileName1="";
   String originalFileName2="";
   String savedFileName2="";
  
   if (multipart.getMyPart("fileName1")!=null)
   {
   	originalFileName1= multipart.getOriginalFileName("fileName1");
   	savedFileName1= multipart.getSavedFileName("fileName1");
   	originalFileName2= multipart.getOriginalFileName("fileName2");
   	savedFileName2= multipart.getSavedFileName("fileName2");
   }
   
   Connection con= null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try
   {
	   Class.forName(jdbc_driver);
	   con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	   String sql = "INSERT INTO sub_webtoon (title, subtitle, date,part,originalFileName1, savedFileName1, originalFileName2, savedFileName2) VALUES (?,?,?,?,?,?,?,?)";
	   pstmt = con.prepareStatement(sql);
	  pstmt.setString(1,request.getParameter("title"));
	  pstmt.setString(2,request.getParameter("sub_title"));
	  pstmt.setString(3,request.getParameter("date"));
	  pstmt.setString(4,request.getParameter("part"));
	  pstmt.setString(5,originalFileName1);
	  pstmt.setString(6,savedFileName1);
	  pstmt.setString(7,originalFileName2);
	  pstmt.setString(8,savedFileName2);
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
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 회차 데이터 등록 </title>
</head>
<body>
</body>
</html>