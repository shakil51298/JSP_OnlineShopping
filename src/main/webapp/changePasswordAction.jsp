<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>

<%
String email = session.getAttribute("email").toString();
String oldPass = request.getParameter("old_pass");
String newPass = request.getParameter("new_pass");
String confirmPass = request.getParameter("confirm_pass");

if (!confirmPass.equals(newPass)) {
	response.sendRedirect("changePassword.jsp?msg=nomatch");
} else {
	int check = 0;
	try {
		Connection conn = SqlConnectionProvide.getcon();
		Statement st = conn.createStatement();
		String sql = "select * from user_info where email = '" + email + "' and password='" + oldPass + "'";
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		check = 1;
		st.executeUpdate("update user_info set password='" + confirmPass + "' where email = '" + email + "'");
		response.sendRedirect("changePassword.jsp?msg=success");
		}
		if (check == 0) {
		response.sendRedirect("changePassword.jsp?msg=oldPassWrong");
		}

	} catch (Exception e) {
		System.out.println(e);
	}
}
%>