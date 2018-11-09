package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// �̱��� ( SingleTon )
public class DBConn {
	
		private static Connection connection = null;
		
		private DBConn() {}
		
		public static Connection getConnection() {
			if( connection == null ) {
				
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
		        String userid = "testss";
				String password = "testss";
		        try 
				{
				
					Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc ����̹� �ε�	
					 connection = DriverManager.getConnection(url, userid, password); // Ŀ�ؼ� ��ü ��ȯ
					 // System.out.println( connection );
					 //connection.close(); // DB ���� ����
					
				} catch ( ClassNotFoundException e ){
					
				     	   e.printStackTrace();
				     	   
				} catch ( SQLException e ) {
					
				    	   e.printStackTrace();
				}
		        
		  	} // if�� �ݱ�			
			
			return connection;
			
	     } // �Լ� �ݱ�
		
		public static Connection getConnection(String url, String userid, String password) {		
	        try {			
				Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc ����̹� �ε�	
				 connection = DriverManager.getConnection(url, userid, password); // Ŀ�ؼ� ��ü ��ȯ
				//System.out.println( connection );
				// connection.close(); // DB ���� ����				
			}
	        catch ( ClassNotFoundException e ){
	        	
			     	   e.printStackTrace();
			     	   
			} catch ( SQLException e ) {
				
			    	   e.printStackTrace();
			    	   
			}	        
	
		return connection;
		
		}
		
		public static void close() {
				if( connection != null ) {
					try {
						if( ! connection.isClosed() ) {
								connection.close();
						}
					} catch (SQLException e) {
						
						e.printStackTrace();
						
					}
					
					connection = null ; // null�� �ٽ� �ʱ�ȭ
				} // if
				
		} // close close
		
} // DBConn close