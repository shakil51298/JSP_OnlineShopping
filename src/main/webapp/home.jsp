<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home -urshop22</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		Home <i class="fa fa-institution"></i>
	</div>

	<%
	String msg = request.getParameter("msg");
	if ("added".equals(msg)) {
	%>
	<h3 class="alert">Product added successfully!</h3>

	<%
	}
	%>

	<%
	if ("exist".equals(msg)) {
	%>
	<h3 class="alert">Product already exist in you cart! Quantity
		increased!</h3>

	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Something went wrong!</h3>
	<%
	}
	%>




	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				String sql = "select * from products where active = 'yes'";
				Connection con = SqlConnectionProvide.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()) {
					int id = rs.getInt(1);
					String pName = rs.getString(2);
					String pCategory = rs.getString(3);
					int pPrice = rs.getInt(4);
			%>
			<tr>
				<td><%out.print(id); %></td>
				<td><%out.print(pName); %></td>
				<td><%out.print(pCategory); %></td>
				<td><%out.print(pPrice); %> <i class="fa fa-cny"> </i> </i></td>
				<td><a href="addToCartAction.jsp?id=<%out.print(id); %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
			</tr>

			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>

		</tbody>
	</table>
	<br>
	<br>
	<br>
</body>
</html>