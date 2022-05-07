<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="adminHeader.jsp"%>
<%@include file="../footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages Received -urshop22</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<div
		style="color: white; text-align: center; font-size: 30px; text-transform: uppercase;">
		Messages Received <i class='fas fa-comment-alt'></i>
	</div>
	<hr>
	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Email</th>
				<th scope="col">Subject</th>
				<th scope="col">Body</th>
				<th scope="col">DATE</th>
				<th scope="col">Status</th>
			</tr>
		</thead>
		<tbody>
			<%
			int sno = 0;
			try {
				Connection con = SqlConnectionProvide.getcon();
				Statement st = con.createStatement();
				String sql = "select * from user_messages";
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()) {
					sno = sno + 1;
					/* mid = rs.getString(1); */
			%>
			<tr>
				<td>
					<%out.println(sno);%>
				</td>
				<td style="word-wrap: break-word;"><%=rs.getString(2)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(3)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(4)%></td>
				<td style="word-wrap: break-word;"><%=rs.getString(5)%></td>
				<td style="word-wrap: break-word;"><a
					href="customersMessageReply.jsp?u_email=<%=rs.getString(2)%>">
						Reply to Customers <i class='fas fa-comment-alt'></i>
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