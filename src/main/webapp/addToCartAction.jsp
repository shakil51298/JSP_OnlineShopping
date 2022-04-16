<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>

<%
	String emaiString = session.getAttribute("email").toString() ;
	String product_id = request.getParameter("id");
	int idInt = Integer.parseInt(product_id); 
	int quantity = 1 ;
	int product_price = 0;
	int product_total = 0 ;
	int cart_total = 0 ;
	
	int z = 0 ; 
	try{
		Connection con = SqlConnectionProvide.getcon() ;
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from products where id ='"+product_id+"'");
		while(rs.next()){
			product_price = rs.getInt(4);
			product_total = product_price ; 
			out.println(product_total);
		}
		ResultSet rs1 = st.executeQuery("select * from cart where p_id ='"+product_id+"' and email='"+emaiString+"' and address is NULL");
		while(rs1.next()){
			cart_total= rs1.getInt(5);
			cart_total = cart_total + product_total ; 
			quantity = rs1.getInt(3);
			quantity = quantity + 1 ;
			z = 1 ; 
		}
		if(z == 1){
			st.executeUpdate("update cart set total= '"+cart_total+"', quantity='"+quantity+"' where p_id = '"+product_id+"' and email = '"+emaiString+"' and address is NULL") ;
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z == 0 ){
			PreparedStatement ps = con.prepareStatement("insert into cart (email , p_id, quantity, price, total) values(?,?,?,?,?)");
			ps.setString(1 , emaiString);
			ps.setInt(2 , idInt);
			ps.setInt(3 , quantity);
			ps.setInt(4 , product_price);
			ps.setInt(5 , product_total); 
			ps.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");
		}
		
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("home.jsp?msg=added");
	}
	
	
	
	
	out.println("this is shakil" + emaiString + product_id);
%>

<!-- 
address, city, state, country, mobileNumber, orderDate, deliveryDate, paymentMethod	, t_Id, status
 -->

