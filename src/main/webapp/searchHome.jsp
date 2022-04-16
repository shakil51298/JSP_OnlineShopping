<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		Home <i class="fa fa-institution"></i>
	</div>
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
			int z = 0;
			try {

				String keyWord = request.getParameter("keyWord");
				// filtering by keyword
				String sql = "select * from products where p_name like '%" + keyWord + "%' or p_category like '%" + keyWord+ "%' and active = 'yes' ";

				Connection con = SqlConnectionProvide.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					z =  1 ; 
					int id = rs.getInt(1);
					String pName = rs.getString(2);
					String pCategory = rs.getString(3);
					int pPrice = rs.getInt(4);
			%>

			<tr>
				<td><%out.print(id); %></td>
				<td><%out.print(pName); %></td>
				<td><%out.print(pCategory); %></td>
				<td><%out.print(pPrice); %><i class="fa fa-inr"></i></td>
				<td><a href="">Add to cart <i class='fas fa-cart-plus'></i></a></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>
		</tbody>
	</table>
	
	<% if(z == 0 ){
		
	%>
	<h1 style="color: white; text-align: center;">Nothing to show</h1>
 <%}  %> 
	<br>
	<br>
	<br>	
</body>
</html>