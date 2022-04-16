<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*"%>

<%
String email = session.getAttribute("email").toString();
int p_id = Integer.parseInt(request.getParameter("id"));
int quantity = 1;
int price = 0;
int total = 0;
int cart_total = 0;


int z = 0;
try {

	String sql = "select * from products where id = '" + p_id + "'";

	Connection con = SqlConnectionProvide.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	 while (rs.next()) {
		price = rs.getInt(4);
		total = price;
		System.out.print(total);
		
	} 
	 String sql2 = "select * from cart where p_id = '" + p_id + "' and email='"+email+"' and address is NULL";
		ResultSet rs2 = st.executeQuery(sql2);
		while(rs2.next()){
			cart_total = rs2.getInt(5);
			cart_total = cart_total + total ; 
			quantity = rs2.getInt(3);
			quantity = quantity + 1 ; 
			z = 1 ;
			
			
		}
	
	if(z == 0){
		PreparedStatement prd = con.prepareStatement("insert into cart(email , p_id , quantity, price , total) values(? , ? , ? , ? , ?)");
		prd.setString(1, email);
		prd.setInt(2, p_id);
		prd.setInt(3, quantity);
		prd.setInt(4, price);
		prd.setInt(5, total);
		prd.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
		
		
	}
	
	if(z == 1){
		String sql3 = "update cart set total = '"+cart_total+"', quantity = '"+quantity+"' , where p_id = '"+p_id+"' and email = '"+email+"' and address in NULL'" ; 
		st.executeUpdate(sql3) ;
		response.sendRedirect("home.jsp?msg=exist") ;
	}
	
} catch (Exception e) {
	//response.sendRedirect("home.jsp?msg=invalid");
	System.out.println(e);
}


%>




