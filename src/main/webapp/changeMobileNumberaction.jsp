<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>

<%
String email = session.getAttribute("email").toString();
String mobile = request.getParameter("new_mobile");
String pass = request.getParameter("pass");



try {
	String password = "";
	Connection conn = SqlConnectionProvide.getcon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select password from user_info where email='" + email + "'");
	while (rs.next()) {
		password = rs.getString(1);
		if (!password.equals(pass)) {
			response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		} 
		else {
		st.executeUpdate("update user_info set mobile_number='"+mobile+"' where email='" + email + "'");
		response.sendRedirect("changeMobileNumber.jsp?msg=success");
			}
		}

} catch (Exception e) {
	System.out.println(e);
}





%>