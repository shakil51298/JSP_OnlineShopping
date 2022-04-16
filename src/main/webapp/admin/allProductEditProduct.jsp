<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		All Products & Edit Products <i class='fab fa-elementor'></i>
	</div>

	<%
	String msg = request.getParameter("msg");
	if ("done".equals(msg)) {
	%>
	<h3 class="alert">Product Successfully Updated!</h3>

	<%
	}
	%>

	<%
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try again!</h3>

	<%
	}
	%>



	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col"><i class="fa fa-cny"></i> Price</th>
				<th>Status</th>
				<th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
			</tr>
		</thead>
		<tbody>
			<%
			try {
				String sql = "select * from products";
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
			<tr>
				<td>
					<%
					out.println(id);
					%>
				</td>
				<td>
					<%
					out.println(product_name);
					%>
				</td>
				<td>
					<%
					out.println(product_category);
					%>
				</td>
				<td><i class="fa fa-cny"> <%
 out.println(product_price);
 %>
				</i></td>
				<td>
					<%
					out.println(product_active);
					%>
				</td>
				<td><a href="editProduct.jsp?id=<%out.println(id);%>">Edit
						<i class='fas fa-pen-fancy'></i>
				</a></td>
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