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
	PreparedStatement pd = conn.prepareStatement("update user_info set address = ?,state=?,city=?,country=?,mobile_number=?");
	pd.setString(1, address);
	pd.setString(2, city);
	pd.setString(3, state);
	pd.setString(4, country);
	pd.setString(5, mobileNumber);
	pd.executeUpdate();
	
	// here is problem...............
	PreparedStatement ps = conn.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 3 DAY),paymentMethod=?,t_id=?,status=?, where email=?,and address is NULL");
	ps.setString(1 , address);
	ps.setString(2 , city);
	ps.setString(3 , state);
	ps.setString(4 , country);
	ps.setString(5 , mobileNumber);
	ps.setString(6 , paymentMethod);
	ps.setString(7 , transectionId);
	ps.setString(8 , status);
	ps.setString(9, email);
	ps.executeUpdate();
	response.sendRedirect("bill.jsp");
	
	
	
	
}
catch(Exception e){
	System.out.println(e);

}


%>