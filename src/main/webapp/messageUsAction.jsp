<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>

<%
String email = session.getAttribute("email").toString() ;
String Subject = request.getParameter("Subject") ;
String M_body = request.getParameter("body") ;


try{
	Connection conn = SqlConnectionProvide.getcon();
	String sql = "insert into user_messages(email, subject, body, date_time) values(?, ?, ?, NOW())";
	PreparedStatement ps1 = conn.prepareStatement(sql);
	ps1.setString(1, email);
	ps1.setString(2, Subject);
	ps1.setString(3, M_body);
	ps1.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=success");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=wrong");
}


%>

