<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html></html>
<head>
<link rel="stylesheet" href="css/home-style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<!--Header-->
<br>
<div class="topnav sticky">
	<%
	String email = session.getAttribute("email").toString();
	%>


	<center>
		<h1>
			YOUR SHOP <i class="fa fa-shopping-bag" style="font-size: 30px"
				aria-hidden="true"></i>
		</h1>
	</center>
	<h2>
		<a href=""> <%
 out.println(email);
 %><i class='fas fa-user-alt'></i></a>
	</h2>
	<a href="home.jsp">Home<i class="fa fa-institution"></i></a> <a
		href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a> <a
		href="myOrders.jsp">My Orders <i class='fab fa-elementor'></i></a> <a
		href="changeDetails.jsp">Change Details <i class="fa fa-edit"></i></a>
	<a href="messageUs.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
	<a href="">About <i class="fa fa-address-book"></i></a> <a
		href="logout.jsp">Logout <i class='fas fa-share-square'></i></a> <a
		href="">Date/Time: <%=(new java.util.Date()).toLocaleString()%></a>
	<div class="search-container">
	
		<form action="searchHome.jsp" method="post">
			<input type="text" placeholder="Search" name="keyWord">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>

	</div>
</div>
<br>
<!--table-->
