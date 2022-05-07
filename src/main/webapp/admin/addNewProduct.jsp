<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product -urshop22</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Added Successfully!</h3>
	<%
	}
	%>
	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>

	<%
	}
	%>

	<%
	int id = 1;
	try {
		String sql = "select max(id) from products";
		Connection con = SqlConnectionProvide.getcon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			id = rs.getInt(1);
			id = id + 1;
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
	<form action="addNewProductAction.jsp" method="post">

		<h3 style="color: yellow;">
			Product ID:
			<%
		out.print(id);
		%>
		</h3>

		<input type="hidden" name="id " value="<%out.print(id);%>">

		<div class="left-div">
			<h3>Enter Name</h3>
			<input class="input-style" type="text" name="pd_name"
				placeholder="Enter the name of the product">
			<hr>
		</div>

		<div class="right-div">
			<h3>Enter Category</h3>
			<input class="input-style" type="text" name="pd_category"
				placeholder="Enter the Category of the product">
			<hr>
		</div>

		<div class="left-div">
			<h3>Enter Price</h3>
			<input class="input-style" type="text" name="pd_Price"
				placeholder="Enter the Price of the product">
			<hr>
		</div>

		<div class="right-div" >
			<h3>Active</h3>
			<select class="input-style" name="active">
				<option value="yes">Yes</option>
				<option value="no">No</option>
			</select>
			<hr>
		</div>
		<button class="button">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
</body>
<br>
<br>
<br>
</body>
</html>