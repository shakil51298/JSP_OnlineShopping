
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>

<%
	String email = session.getAttribute("email").toString();
	String status = "processing";
	try{
		Connection con = SqlConnectionProvide.getcon();
		PreparedStatement ps = con.prepareStatement("update cart set status= ? where email = '"+email+"' and status = 'bill'");
		ps.setString(1, status);
		ps.executeUpdate();
		response.sendRedirect("home.jsp");
		
	}
	catch(Exception e){
		System.out.println(e);
	}

%>