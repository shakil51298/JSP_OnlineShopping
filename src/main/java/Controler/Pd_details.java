package Controler;

public class Pd_details {
	private String P_name ;
	private String P_category ;
	private String P_price ;
	private String P_image ;
	// constructor
	public Pd_details(String p_name, String p_category, String p_price, String p_image) {
		super();
		P_name = p_name;
		P_category = p_category;
		P_price = p_price;
		P_image = p_image;
	}
	// getters and setters
	public String getP_name() {
		return P_name;
	}
	public void setP_name(String p_name) {
		P_name = p_name;
	}
	public String getP_category() {
		return P_category;
	}
	public void setP_category(String p_category) {
		P_category = p_category;
	}
	public String getP_price() {
		return P_price;
	}
	public void setP_price(String p_price) {
		P_price = p_price;
	}
	public String getP_image() {
		return P_image;
	}
	public void setP_image(String p_image) {
		P_image = p_image;
	}
	
	
}
