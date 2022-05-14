<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" conte nt="text/html; charset=ISO-8859-1">
<title>My Orders -urshop22</title>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		My Orders <i class='fab fa-elementor'></i>
	</div>
	<table>
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Product Name</th>
				<th scope="col">category</th>
				<th scope="col"><i class="fa fa-inr"></i> Price</th>
				<th scope="col">Quantity</th>
				<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
				<th scope="col">Order Date</th>
				<th scope="col">Expected Delivery Date</th>
				<th scope="col">Payment Method</th>
				<th scope="col">Status</th>

			</tr>
		</thead>
		<tbody>

			<%
			int sno = 0;
			String emailid = session.getAttribute("email").toString();

			try {
				Connection con = SqlConnectionProvide.getcon();
				Statement st = con.createStatement();
				String sql = "select * from cart inner join products where cart.p_id = products.id and cart.email = '" + emailid
				+ "' and cart.orderDate is not NULL";
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()) {
					sno = sno + 1;
			%>

			<tr>
				<td>
					<%
					out.print(sno);
					%>
				</td>
				<td ><%=rs.getString(17)%></td>
				<td style="word-wrap: break-word;"><i class="fa fa-cny"> </i> <%=rs.getString(18)%></td>
				<td style="word-wrap: break-word;"><i class="fa fa-cny"> </i><%=rs.getString(19)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(3)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(5)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(11)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(12)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(13)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(15)%></td>
			</tr>

		</tbody>

		<%
		}
		} catch (Exception e) {
		System.out.println(e);
		}
		%>
	</table>
	<br>
	<br>
	<br>

</body>
</html>