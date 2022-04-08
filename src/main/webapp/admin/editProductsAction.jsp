<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>


<%
String id = request.getParameter("id");
String pd_name = request.getParameter("pd_name");
String pd_category = request.getParameter("pd_category");
String pd_Price = request.getParameter("pd_Price");
String active = request.getParameter("active");

try {
	String sql = " update products set p_name='" + pd_name + "',p_category='" + pd_category + "', price='" + pd_Price+ "',active='" + active + "'";
	Connection con = SqlConnectionProvide.getcon();
	Statement ps = con.createStatement(); // updating
	ps.executeUpdate(sql);
	response.sendRedirect("editProduct.jsp?msg=done");
} catch (Exception e) {
	System.out.print(e);
}
%>