package Controler;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/ControlerPd")
public class ControlerPd extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Pd_details> pd;
		try {
			pd = Model.getPdDetail();
			request.setAttribute("product", pd);
			System.out.println(pd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		
//		RequestDispatcher rd = request.getRequestDispatcher("myView");
//		rd.forward(request, response);    
		
	}

}
