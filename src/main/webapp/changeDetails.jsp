<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details -ushop22</title>
<style>
hr {
	width: 70%;
}
</style>
</head>
<%
try {
	String email = session.getAttribute("email").toString();
	Connection conn = SqlConnectionProvide.getcon();
	Statement st = conn.createStatement();
	String sql = "select * from user_info where email = '" + email + "'";
	ResultSet rs = st.executeQuery(sql);
	while (rs.next()) {
%>
<body>

	<h3>Name: <%=rs.getString(1) %></h3>
	<hr>
	<h3>Email: <%=rs.getString(2) %></h3>
	<hr>
	<h3>Mobile Number: <%=rs.getString(3) %></h3>
	<hr>
	<h3>Security Question: <%=rs.getString(4) %></h3>
	<hr>
	<h3>Answer: <%=rs.getString(5) %></h3>
	<hr>
	<h3>Current Password: <%=rs.getString(6) %></h3>
	<hr>
	<h3>Country: <%=rs.getString(10) %></h3>
	<hr>
	<br>
	<br>
	<br>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>>
</body>
</html>