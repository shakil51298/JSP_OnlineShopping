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
	String sql = " insert into products values(? , ? , ? , ? , ? )";
	Connection con = SqlConnectionProvide.getcon();
	PreparedStatement ps = con.prepareStatement(sql); // data send korar time e PreparedStatement use ;

	ps.setString(1, id);
	ps.setString(2, pd_name);
	ps.setString(3, pd_category);
	ps.setString(4, pd_Price);
	ps.setString(5, active);

	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
} catch (Exception e) {
	System.out.print(e);
}
%>