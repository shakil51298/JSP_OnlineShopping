<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>


<%
String admin_email = session.getAttribute("email").toString() ;
String user_email = request.getParameter("u_mail");
System.out.println(user_email);
String Subject = request.getParameter("Subject") ;
String M_body = request.getParameter("body") ;


try{
	Connection conn = SqlConnectionProvide.getcon();
	String sql = "insert into user_inbox(email, subject, body, date_time, from_email) values(?, ?, ?, NOW(), ?)";
	PreparedStatement ps1 = conn.prepareStatement(sql);
	ps1.setString(1, user_email);
	ps1.setString(2, Subject);
	ps1.setString(3, M_body);
	ps1.setString(4, admin_email);
	ps1.executeUpdate();
	response.sendRedirect("customersMessageReply.jsp?msg=success");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("customersMessageReply.jsp?msg=wrong");
}


%>
