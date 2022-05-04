<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("success".equals(msg)) {
	%>
	<h3 class="alert">Address Successfully Updated !</h3>
	<%
	}
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
	<%
	}
	String email = session.getAttribute("email").toString();
	Connection conn = SqlConnectionProvide.getcon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from user_info where email='" + email + "'");
	while (rs.next()) {
	%>
	<form action="addChangeAddressAction.jsp" method="post">
		<h3>Enter Address</h3>
		<input class="input-style" value="<%=rs.getString(7)%>" type="text"
			name="address" placeholder="Enter address" required />
		<hr>
		<h3>Enter city</h3>
		<input class="input-style" value="<%=rs.getString(8)%>" type="text"
			name="city" placeholder="Enter city" required />
		<hr>
		<h3>Enter State</h3>
		<input class="input-style" value="<%=rs.getString(9)%>" type="text"
			name="state" placeholder="Enter address" required />
		<hr>
		<h3>Enter country</h3>
		<input class="input-style" value="<%=rs.getString(10)%>" type="text"
			name="country" placeholder="Enter country" required />
		<hr>
		<button class="button" type="submit">
			Save<i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	%>
</body>
<br>
<br>
<br>
</html>