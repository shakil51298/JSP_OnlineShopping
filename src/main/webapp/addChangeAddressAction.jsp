<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>

<%
String email = session.getAttribute("email").toString();
String Address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");



try {
	int check = 0;
	Connection conn = SqlConnectionProvide.getcon();
	String sql = "update user_info set address=? , state= ? ,city= ? ,country=? where email='" + email + "'";
	PreparedStatement st = conn.prepareStatement(sql);
	st.setString(1, Address);
	st.setString(2, state);
	st.setString(3, city);
	st.setString(4, country);
	st.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=success");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=wrong");
}
%>