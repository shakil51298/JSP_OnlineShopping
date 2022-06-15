package Controler;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.connection.SqlConnectionProvide;

public class Model {

	public static List<Pd_details> getPdDetail() throws SQLException {
		// Products list
		ArrayList<Pd_details> products = new ArrayList<>();

		// create connection

		String sql = "select * from products where active = 'yes'";
		Connection con = SqlConnectionProvide.getcon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			int id = rs.getInt(1);
			String pName = rs.getString(2);
			String pCategory = rs.getString(3);
			int pPrice = rs.getInt(4);
			String img = rs.getString(6);

			Pd_details p = new Pd_details(pName, pCategory, pCategory, img);
			products.add(p);

		}
		return products;

	}
}
