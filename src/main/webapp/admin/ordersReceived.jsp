<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Order Received</title>
<style>
.th-style {
	width: 25%;
}
</style>
</head>
<body>
	<div style="color: white; text-align: center; font-size: 30px;">
		Orders Received <i class="fas fa-archive"></i>
	</div>
	<%
	String msg = request.getParameter("msg");
	if ("success".equals(msg)) {
	%>
	<h3 class="alert">Order Cancel Successfully!</h3>
	<%
	}

	if ("delivered".equals(msg)) {
	%>
	<h3 class="alert">Delivered!</h3>
	<%
	}
	if ("wrong".equals(msg)) {
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<%
	}
	%>
	<table id="customers">
		<tr>
			<th>Email</th>
			<th>Mobile Number</th>
			<th scope="col">Product Name</th>
			<th scope="col">Quantity</th>
			<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>Country</th>
			<th scope="col">Order Date</th>
			<th scope="col">Expected Delivery Date</th>
			<th scope="col">Payment Method</th>
			<th scope="col">T-ID</th>
			<th scope="col">Status</th>
			<th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
			<th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
		</tr>
		<%
		try {
			Connection con = SqlConnectionProvide.getcon();
			Statement st = con.createStatement();
			String sql = "select * from cart inner join products where cart.p_id = products.id and cart.orderDate is not NULL and cart.status = 'processing'";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
		%>
		<tr>
			<td style="word-wrap: break-word;"><%=rs.getString(1)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(10)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(17)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(3)%></td>
			<td style="word-wrap: break-word;"><i class="fa fa-inr"></i><%=rs.getString(5)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(6)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(7)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(8)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(9)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(11)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(12)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(13)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(14)%></td>
			<td style="word-wrap: break-word;"><%=rs.getString(15)%></td>
			<td style="word-wrap: break-word;"><a
				href="cancelOrderAction.jsp?id=<%=rs.getString(2)%>&<%=rs.getString(1)%>">Cancel
					<i class='fas fa-window-close'></i>
			</a></td>
			<td><a href="DeliveredOrdeAction.jsp?id=<%=rs.getString(2)%>&<%=rs.getString(1)%>"">Delivered <i
					class='fas fa-dolly'></i></i></a></td>
		</tr>
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