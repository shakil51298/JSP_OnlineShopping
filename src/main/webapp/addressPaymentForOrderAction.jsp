<%@page import="java.sql.*"%>
<%@page import="com.connection.SqlConnectionProvide"%>

<% 
String email = session.getAttribute("email").toString() ;
String address = request.getParameter("address") ;
String city = request.getParameter("city") ;
String state = request.getParameter("state") ;
String country = request.getParameter("country");
String paymentMethod = request.getParameter("paymentMethod");
String mobileNumber = request.getParameter("mobileNumber");

String transectionId = "";
transectionId = request.getParameter("transectionId");
String status = "bill";


try{
	Connection conn = SqlConnectionProvide.getcon();
	PreparedStatement pd = conn.prepareStatement("update user_info set address = ?,state=?,city=?,country=?,mobile_number=? where email='"+email+"'");
	pd.setString(1, address);
	pd.setString(2, city);
	pd.setString(3, state);
	pd.setString(4, country);
	pd.setString(5, mobileNumber);
	pd.executeUpdate();
	
	String sql = "update cart set address=?, city=?, state=?, country=?, mobileNumber=?,orderDate=now(), deliveryDate=DATE_ADD(orderDate, INTERVAL 3 DAY),paymentMethod=?, t_id=?, status=? where email='"+email+"' and address is NULL";		
	PreparedStatement ps1 = conn.prepareStatement(sql);
	ps1.setString(1, address);
	ps1.setString(2, city);
	ps1.setString(3, state);
	ps1.setString(4, country);
	ps1.setString(5, mobileNumber);
	ps1.setString(6, paymentMethod);
	ps1.setString(7, transectionId);
	ps1.setString(8, status);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
	
}
catch(Exception e){
	System.out.println(e);

}


%>