<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*" %>

<%
	String email = request.getParameter("email") ; 
	String mobileNumber = request.getParameter("mobileNumber");
	String security_questions = request.getParameter("security_questions");
	String answer = request.getParameter("answer");
	String password = request.getParameter("password");
	
	int  check = 0 ; 
	try{
		String sql = "select * from user_info where email='"+email+"' and mobile_number = '"+mobileNumber+"' and security_questions='"+security_questions+"' and  answer= '"+answer+"'" ;
		Connection con = SqlConnectionProvide.getcon() ; 
		Statement st = con.createStatement() ; 
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()){
			check = 1 ; 
			String sql2 = "update user_info set password = '"+password+"' where email = '"+email+"'" ;
			
			st.executeUpdate(sql2) ; 
			response.sendRedirect("forgotPassword.jsp?msg=done");
			
			
		}
		if(check==0 ){
			response.sendRedirect("forgotPassword.jsp?msg=wrong");
		}
	}
	catch(Exception e){
		System.out.println(e) ; 
	}
	
%>
