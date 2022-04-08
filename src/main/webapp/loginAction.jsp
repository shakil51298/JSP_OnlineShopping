<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.connection.SqlConnectionProvide"%>
<%@ page import="java.sql.*" %>



<%
	String email = request.getParameter("email") ; 
	String password = request.getParameter("password") ;
	
	PrintWriter outs = response.getWriter();
	
	
	if("admin@gmail.com".equals(email) && "admin".equals(password)){
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp") ;
	}
	else{
		int z = 0 ;  // creating error msg
		try{
			String sql = "select * from user_info where email ='"+email+"' and password='"+password+"'" ; 
			Connection con = SqlConnectionProvide.getcon() ;
			Statement st = con.createStatement() ; 
			ResultSet rs = st.executeQuery(sql) ;
			
			while(rs.next()){
				z=1;
				session.setAttribute("email",email);
				response.sendRedirect("home.jsp");
			}
			if(z==0){
				response.sendRedirect("login.jsp?msg=notexist") ;
			}
		}
		catch(Exception e){			
			response.sendRedirect("login.jsp?msg=something_wrong") ;
			System.out.println(e);
		}
	}
	
%>

