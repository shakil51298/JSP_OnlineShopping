<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>


<%
String email = session.getAttribute("email").toString() ;
String pid = request.getParameter("id");



try{
	Connection conn = SqlConnectionProvide.getcon();
	Statement st = conn.createStatement() ; 
	st.execute("delete from cart where email = '"+email+"' and p_id = '"+pid+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
	System.out.println(e);
}



%>
 
