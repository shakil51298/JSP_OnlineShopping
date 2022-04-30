<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*" %>



<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String security_questions = request.getParameter("security_questions");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city = "";
String state = "" ; 
String country = "" ;
	

	try{
		Connection con = SqlConnectionProvide.getcon() ; 
		String sql = "INSERT INTO user_info(name, email,mobile_number,security_questions,answer,password,address,state,city,country) VALUES (? ,? , ? , ? ,?, ? ,? ,? ,? ,?)" ;
		PreparedStatement st = con.prepareStatement(sql); 
		
		st.setString(1 , name) ;
		st.setString(2 , email) ;
		st.setString(3 , mobileNumber) ;
		st.setString(4 , security_questions) ;
		st.setString(5 , answer) ;
		st.setString(6 , password) ;
		st.setString(7 , address) ;
		st.setString(8 , city) ;
		st.setString(9 , state) ;
		st.setString(10 , country) ;
		st.executeUpdate() ; 
		response.sendRedirect("signup.jsp?msg=valid");
		
	}
	catch(Exception e){
		System.out.print(e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}



%>