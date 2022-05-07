<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number -urshop22</title>
</head>
<body>
	<%
	String email = session.getAttribute("email").toString();
	String msg = request.getParameter("msg");
	if ("success".equals(msg)) {
	%>

	<h3 class="alert">Your Mobile Number successfully changed!</h3>
	<%
	}

	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Your Password is wrong!</h3>
	<%
	}
	%>

	<form action="changeMobileNumberaction.jsp" method="post">
		<h3>Enter Your New Mobile Number</h3>
		<input class="input-style" type="text" placeholder="Enter new mobile"
			name="new_mobile" required />
		<hr>
		<h3>Enter Password (For Security)</h3>
		<input class="input-style" type="text" placeholder="Enter password"
			name="pass" required />
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