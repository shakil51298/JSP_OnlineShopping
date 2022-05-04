<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>

<%
String mid = request.getParameter("id");
try{
	String email = session.getAttribute("email").toString() ;
	Connection con = SqlConnectionProvide.getcon();
	Statement st = con.createStatement();
	String sql = "DELETE FROM `user_messages` where id='" + mid + "'";
	st.executeUpdate(sql);
	response.sendRedirect("CheckSentBox.jsp?msg=success");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("CheckSentBox.jsp?msg=wrong");
}


%>