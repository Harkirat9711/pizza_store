package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class Statements {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DBConnect c;

    public Statements() {
        try {
        	c = new DBConnect();
			this.conn = c.getCon();
        } catch (Exception ex) {
        	ex.getMessage();
        }
    }
    
    public boolean login(String email, String pwd) {

    	try {
    		pstmt = c.preparedStatement("SELECT email, password, active FROM user WHERE email =?;");
    		pstmt.setString(1, email);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			if(rs.getString("active").equals("1") && rs.getString("password").equals(pwd)) {
    				// BAM, LOG IND!
    				return true;
    			}
    		}
    	}
    	catch(Exception e1) {
    	}
    	return false;
    }
   
	public boolean addUserToDatabase(String e, String p, String n, String a, String z, String ph){
	
		try { System.out.println("trying to add new user");
				pstmt = c.preparedStatement("INSERT INTO user (email, password, name, address, zipcode, phonenumber,active) "
					+ "VALUES (?, ?, ?, ?, ?, ?,?);");
                                String active = "1";
				pstmt.setString(1, e);
				pstmt.setString(2, p);
				pstmt.setString(3, n);
				pstmt.setString(4, a);
				pstmt.setString(5, z);
				pstmt.setString(6, ph);	
                                pstmt.setString(7,  active);
                                System.out.println("executing statment");
				pstmt.executeUpdate();
                                System.out.println("statement executed ");
				//addUserRole(e, "user");
				return true;
		} catch (Exception e1) {
			System.err.print(e1.getMessage());
		}
		return false;
	}
	
	
	public List<Pizza> getPizzas(int offset, int pizzasPerPage, String sortBy) throws Exception{
		try {
			List<Pizza> pizzas = new ArrayList<Pizza>();
			rs = c.getData("SELECT id, name, price, description FROM pizza ORDER BY " + sortBy + " LIMIT " + offset + ", " + pizzasPerPage);
			
			while(rs.next()){
				Pizza p = new Pizza();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				pizzas.add(p);
			}
			
			return pizzas;
		} catch (Exception e) {
			throw e;
		}	
	}
	
	public List<Pizza> getPizzas(int offset, int pizzasPerPage, String sortBy, int minPrice, int maxPrice) throws Exception{
		try {
			List<Pizza> pizzas = new ArrayList<Pizza>();
			rs = c.getData("SELECT id, name, price, description FROM pizza WHERE price >= " + minPrice + " AND " + "price <=" + maxPrice + " ORDER BY " + sortBy + " LIMIT " + offset + ", " + pizzasPerPage);
			
			while(rs.next()){
				Pizza p = new Pizza();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				pizzas.add(p);
			}
			
			return pizzas;
		} catch (Exception e) {
			throw e;
		}	
	}
	
	public List<Pizza> getPizzas(int minPrice, int maxPrice) throws Exception{
		try {
			List<Pizza> pizzas = new ArrayList<>();
			rs = c.getData("SELECT id, name, price, description FROM pizza WHERE price >= " + minPrice + " AND " + "price <=" + maxPrice);
			
			while(rs.next()){
				Pizza p = new Pizza();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				pizzas.add(p);
			}
			
			return pizzas;
		} catch (Exception e) {
			throw e;
		}	
	}
	
	public List<Pizza> getPizzas() throws Exception{
		try {
			List<Pizza> pizzas = new ArrayList<>();
			rs = c.getData("SELECT id, name, price, description FROM pizza");
			
			while(rs.next()){
				Pizza p = new Pizza();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				pizzas.add(p);
			}
			
			return pizzas;
		} catch (Exception e) {
			throw e;
		}	
	}
	
	public int getNumPizzas(){
		try {
			PreparedStatement pinstmt = c.preparedStatement("SELECT COUNT(*) AS numpizz FROM pizza");
			rs = pinstmt.executeQuery();
			if(rs.next()) return (rs.getInt("numpizz"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	public int getNumPizzas(int minPrice, int maxPrice){
		try {
			PreparedStatement pinstmt = c.preparedStatement("SELECT COUNT(*) AS numpizz FROM pizza WHERE price >= ? AND price <= ?");
			pinstmt.setInt(1, minPrice);
			pinstmt.setInt(2, maxPrice);
			rs = pinstmt.executeQuery();
			if(rs.next()) return (rs.getInt("numpizz"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	public Item getPizza(int withId) throws Exception{
		try {
			PreparedStatement pinstmt = c.preparedStatement("SELECT id, name, price, description FROM pizza WHERE pizza.id = ?;");
			pinstmt.setInt(1, withId);
			rs = pinstmt.executeQuery();
			if(rs.next()) {
				Pizza p = new Pizza();	
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getInt("price"));
				p.setDescription(rs.getString("description"));
				return p;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	

	
	public boolean addPizza(String name, int price, String description) throws Exception{
		try{
			PreparedStatement pstmt = c.preparedStatement("INSERT INTO pizza (name, price, description) VALUES (?, ?, ?);");
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3,  description);
			pstmt.executeUpdate();
			
			return true;
		
		}catch (Exception e1) {
			throw e1;
		}
	}
	
	public boolean removePizza(int removeId){
		try {
			PreparedStatement pstmt = c.preparedStatement("DELETE FROM la_pizzeria.pizza WHERE pizza.id = ?");
			pstmt.setInt(1, removeId);
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	public User getUser(String email){
		try{
			PreparedStatement pstmt = c.preparedStatement("SELECT email,name,address,zipcode,phonenumber FROM user WHERE email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				User currentUser = new User();
				currentUser.setEmail(rs.getString("email"));
				currentUser.setName(rs.getString("name"));
				currentUser.setAddress(rs.getString("address"));
				currentUser.setZipcode(rs.getInt("zipcode"));
				currentUser.setPhoneNumber(rs.getInt("phonenumber"));
				return currentUser;
			}
		} catch (Exception e){
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public boolean checkEmail(String email){
		try{
			PreparedStatement pstmt = c.preparedStatement("SELECT email FROM user WHERE email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(!rs.next()){
				return true;
			}
		} catch (Exception e){
			System.out.println(e.getMessage());
		}
		return false;
	}
}
