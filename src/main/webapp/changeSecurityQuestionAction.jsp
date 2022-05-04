<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>


<%
String email = session.getAttribute("email").toString();
String question = request.getParameter("security_questions");
String newAnswer = request.getParameter("new_answer");
String pass = request.getParameter("pass");

try {
	String password = "";
	Connection conn = SqlConnectionProvide.getcon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select password from user_info where email='" + email + "'");
	while (rs.next()) {
		password = rs.getString(1);
		if (!password.equals(pass)) {
			response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
		} 
		else {
		st.executeUpdate("update user_info set security_questions='"+question+"' , answer='"+newAnswer+"' where email='" + email + "'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=success");
			}
		}

} catch (Exception e) {
	System.out.println(e);
}
%>


