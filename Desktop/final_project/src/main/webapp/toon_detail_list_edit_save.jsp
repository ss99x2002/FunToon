<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*, java.util.*,myBean.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8");
 	String sSubtitle = request.getParameter("subtitle");
 	String sDate = request.getParameter("date");
 	String sPart = request.getParameter("part");
 	String sIdx = request.getParameter("idx");
 	int sIdxs = Integer.parseInt(sIdx);
 	
    Class.forName("org.mariadb.jdbc.Driver");
    String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false?";
    String DB_USER ="admin";
    String DB_PASSWORD = "1234";
    
    ServletContext context = getServletContext();
    String realFolder = context.getRealPath("upload");
    
    Collection<Part> parts = request.getParts();
    MyMultiPart multipart = new MyMultiPart(parts, realFolder);
    String originalFileName1="";
    String savedFileName1="";
   
    if (multipart.getMyPart("fileName1")!=null)
    {
    	originalFileName1= multipart.getOriginalFileName("fileName1");
    	savedFileName1= multipart.getSavedFileName("fileName1");
    }
    
    Connection con= null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try
    {  	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    String sql = "UPDATE sub_webtoon SET subtitle ='"+sSubtitle + "',date='"+ sDate + "', part = '"+sPart + "',savedFileName1='"+savedFileName1+"',originalFileName1= '"+originalFileName1 +"' WHERE idx='" + sIdxs + "'";
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