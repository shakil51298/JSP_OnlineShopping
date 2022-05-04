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
	String email = session.getAttribute("email").toString();
	String msg = request.getParameter("msg");
	if ("nomatch".equals(msg)) {
	%>

	<h3 class="alert">New password and Confirm password does not
		match! try again</h3>
	<%
	}

	if ("oldPassWrong".equals(msg)) {
	%>
	<h3 class="alert">Your old Password is wrong!</h3>
	<%
	}
	if ("success".equals(msg)) {
	%>
	<h3 class="alert">Password change successfully!</h3>
	<%
	}
	if ("somethigWrong".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try again!</h3>
	<%
	}
	%>

	<form action="changePasswordAction.jsp" method="post">
		<%
		try {
			Connection conn = SqlConnectionProvide.getcon();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select password from user_info where email = '" + email + "'");
			while (rs.next()) {
				
		%>

		<h3>Enter Old Password</h3>
		<input class="input-style" type="text" value="<%=rs.getString(1) %>"
			placeholder="Enter old password" name="old_pass" required />
		<hr>
		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>
		<h3>Enter New Password</h3>
		<input class="input-style" type="text"
			placeholder="Enter new password" name="new_pass" required />
		<hr>
		<h3>Enter Confirm Password</h3>
		<input class="input-style" type="text" placeholder="Confirm password"
			name="confirm_pass" required />
		<hr>
		<button class="button" type="submit">
			Save<i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
</body>
<br>
<br>
<br>
</html>