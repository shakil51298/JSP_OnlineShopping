<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>


<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question -urshop22</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	System.out.println(msg);
	if ("success".equals(msg)) {
	%>
	<h3 class="alert">Your security Question successfully changed !</h3>
	<%
	}
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Your Password is wrong!</h3>
	<%
	}
	try {
	String email = session.getAttribute("email").toString();
	Connection con = SqlConnectionProvide.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user_info where email='" + email + "'");
	while (rs.next()) {
	%>

	<form action="changeSecurityQuestionAction.jsp" method="post">
		<h3>Select Your New Securtiy Question</h3>
		<select name="security_questions" class="input-style" required>
			<option value="what was your first car?">what was your first
				car?</option>
			<option value="what is the name of your first pet?">what is
				the name of your first pet?</option>
			<option value="which school did you go?">which school did
				you go?</option>
			<option value="what is the name of  the town you born in?">what
				is the name of the town you born in?</option>
		</select>
		<hr>
		<h3>Enter Your New Answer</h3>
		<input class="input-style" value="<%=rs.getString(5)%>" type="text"
			name="new_answer" placeholder="Enter new answer" required />
		<hr>
		<h3>Enter Password (For Security)</h3>
		<input class="input-style" value=<%=rs.getString(6) %> type="text" name="pass"
			placeholder="Enter password" required />
		<hr>
		<button class="button" type="submit">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

</body>
<br>
<br>
<br>
</html>