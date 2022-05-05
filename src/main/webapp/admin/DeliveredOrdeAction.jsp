<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>


<%
String email = session.getAttribute("email").toString() ; 
String id = request.getParameter("id");
String status = "delivered";

try{
	Connection conn = SqlConnectionProvide.getcon();
	Statement st = conn.createStatement();
	st.executeUpdate("update cart set status = '"+status+"' where p_id = '"+id+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=delivered ");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}



%>