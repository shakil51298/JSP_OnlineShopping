<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back {
	color: white;
	margin-left: 2.5%
}
</style>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h1>Incorrect Username or Password</h1>
	<%
	}
	%>

	<%
	if ("wrong".equals(msg)) {
	%>
	<h1>Some thing Went Wrong! Try Again !</h1>
	<%
	}
	%>
	<h2>
		<a class="back" href="allProductEditProduct.jsp"><i
			class='fas fa-arrow-circle-left'> Back</i></a>
	</h2>

	<%
	String  id_p = request.getParameter("id");
	try {
		String sql = "select * from products where id = '"+id_p+"'";
		Connection con = SqlConnectionProvide.getcon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);

		while (rs.next()) {
			int id = rs.getInt(1);
			String product_name = rs.getString(2);
			String product_category = rs.getString(3);
			int product_price = rs.getInt(4);
			String product_active = rs.getString(5);
	%>
	<form action="editProductsAction.jsp" method="post">
		<input class="input-style" type="hidden" name="id"value="<%out.print(id);%>"> 
		
		<div class="left-div">
			<h3>Enter Name</h3>
			<input class="input-style" type="text" name="pd_name"
				value="<%out.print(product_name);%>"
				placeholder="Edit the name of the product">
			<hr>
		</div>

		<div class="right-div">
			<h3>Enter Category</h3>
			<input class="input-style" type="text" name="pd_category"
				value="<%out.print(product_category);%>"
				placeholder="Edit the Category of the product">
			<hr>
		</div>

		<div class="left-div">
			<h3>Enter Price</h3>
			<input class="input-style" type="text" name="pd_Price"
				value="<%out.print(product_price);%>"
				placeholder="Edit the Price of the product">
			<hr>
		</div>

		<div class="right-div">
			<h3>Active</h3>
			<select class="input-style" name="active">
				<option value="yes" selected>Yes</option>
				<option value="no">No</option>
			</select>
			<hr>
		</div>

		<button class="button">
			Edit <i class='far fa-arrow-alt-circle-right'></i>
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
</body>
</html>