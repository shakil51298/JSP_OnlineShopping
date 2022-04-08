<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="SignUpAction.jsp" method="post">
				<input type="text" name="name" placeholder="Enter your name"
					required> 
				<input type="email" name="email"
					placeholder="Enter your email" required> 
				<input
					type="number" name="mobileNumber" placeholder="Enter your mobile number"
					required> 
					<select name="security_questions" required>
						<option value="what was your first car?">what was your
						first car?
						</option>
						<option value="what is the name of your first pet?">what
						is the name of your first pet?</option>
						<option value="which school did you go?">which school did
						you go?
						</option>
						<option value="what is the name of  the town you born in?">what
						is the name of the town you born in?
						</option>
					</select> 
				<input type="text" name="answer" placeholder="Enter your answer"
					required> 
				<input type="password" name="password"
					placeholder="Enter your password" required> 
				<input type="submit" value="signup">
			</form>
			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		<div class='whysign'>
		
		<%
			String msg= request.getParameter("msg") ;
			PrintWriter pri = response.getWriter() ; 
			if("valid".equals(msg)){
				pri.println("Registered Successfully!!");
			}
			
			if("invalid".equals(msg)){
				pri.println("Some thing Went Wrong! Try Again !");
			}
		
		%>
			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>

</body>
</html>