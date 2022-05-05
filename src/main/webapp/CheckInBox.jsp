<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>

<div style="color: white; text-align: center; font-size: 30px;">
	 InBox</div>
<hr>
<%
String msg = request.getParameter("msg");
if ("success".equals(msg)) {
%>
<h3 style="text-align: center; color: yellow;">Message successfully
	Deleted</h3>
<%
}
if ("wrong".equals(msg)) {
%>

<h3 style="text-align: center;">Some thing Went Wrong! Try Again!</h3>
<%
}
%>

<table>
	<thead>
		<tr>
			<th scope="col">S.No</th>
			<th scope="col">EMAIL</th>
			<th scope="col">Date/time</th>
			<th scope="col">Subejct</th>
			<th scope="col">Message</th>
			<th scope="col">Status</th>
		</tr>
	</thead>
	<tbody>
		<%
		int sno = 0;
		String mid = "";
		try {
			Connection con = SqlConnectionProvide.getcon();
			Statement st = con.createStatement();
			String sql = "select * from user_inbox where email='" + email + "'";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				sno = sno + 1;
				mid = rs.getString(1);
		%>
		<tr>
			<td>
				<%out.println(sno);%>
			</td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><a href="inboxMsgDeleteaction.jsp?id=<%out.println(mid);%>">Delete</a>
			<td>
			 <a href="messageUs.jsp" >Reply</a>
			</td>
			</td>
		</tr>

	</tbody>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>