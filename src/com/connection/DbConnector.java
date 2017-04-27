package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import net.sf.json.JSONObject;



public class DbConnector {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3309";
	
	/*public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("before Connection ");
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/Employee","root", "root");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/Employee","root", "pass@123");
			System.out.println("Connection Successul");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}*/

	public static void main(String[] args) {
		try {
			Statement stmt = null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root", "root");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/dovasoft_usgfa","root", "pass@123");
			//conn = DriverManager.getConnection("jdbc:mysql://162.253.124.32:3306/dovasoft_usgfa","dovasoft_test", "test@123456789");
			
			System.out.println("to confirm....................");
			Statement st = conn.createStatement();
			String sql = "select * from skillsets";
			ResultSet rs = st.executeQuery(sql);
			System.out.println("hyhyhy..........."+rs.toString());
			JSONObject jobj1 = new JSONObject();
			JSONObject jobj2 = new JSONObject();
			/*JSONArray jarray1 = new JSONArray();
			JSONArray jarray2 = new JSONArray();*/
			while(rs.next()){
				System.out.println("values-->"+rs.getString("app_data"));
				jobj1.put("desc", rs.getString("app_va"));
				jobj1.put("tesc", rs.getString("app_ra"));
			}
			conn.close();
			System.out.println("jobj-->"+jobj1.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
