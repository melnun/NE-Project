package com.ntt.ne.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.mysql.jdbc.Statement;
import com.ntt.ne.BackendError;


public class UserDAO {
	
	protected transient final Logger logger=Logger.getLogger(getClass());

	static final String URL = "jdbc:mysql://localhost/ne?user=root";
	static final String USER = "root";
	static final String PASSWORD = "";

	protected Connection getConnection() throws BackendError {
		Connection connessione ;

		try{
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/ne");
			connessione = ds.getConnection();
			
		} catch (SQLException ex) {
			System.out.println("SQLException: "+ ex.getMessage());
			throw new BackendError(ex);
		} catch (NamingException ex) {
			throw new BackendError(ex);
		}

		return connessione;
	}
	
	protected Connection getJDBCConnection() throws SQLException {
		Connection connessione = null;

		try{
			connessione = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception ex) {
			System.out.println("SQLException: "+ ex.getMessage());
		}

		return connessione;
	}

	public void getUsers(){
		Connection connessione = null;
		ResultSet rs ;
		String risf;
		try{
			connessione = this.getConnection();
			String query2 = "SELECT DATA,USERNAME FROM users;";
			Statement qry = (Statement) connessione.prepareStatement(query2);	
			rs=qry.executeQuery(query2);
			int numRecord=0;
			while( rs.next() ){
				numRecord++;
				String u=rs.getString("USERNAME");
				java.sql.Date dataCreazione=rs.getDate("DATA");
				System.out.println(u+"\t\tCreato il "+dataCreazione);
			}
			System.out.println("Record letti:"+numRecord);
			rs.close();

		} catch (Exception ex) {
			System.out.println("SQLException: "+ ex.getMessage());
		}
	}

	@SuppressWarnings("boxing")
	public Integer checkUserPassword(String username,String password)
	{
		try{
			Connection connessione = getConnection();
			ResultSet rs ;
			

			String query = "SELECT USERNAME,PASS FROM users where username=? and pass=?";
			PreparedStatement qry =  connessione.prepareStatement(query);
			qry.setString(1, username);
			qry.setString(2, password);
			rs=qry.executeQuery();
			int numRecord=0;
			boolean trovato=false;
			boolean fineciclo=false;
			Integer loginRes=1;
			while( rs.next()){
				numRecord++;
				String u=rs.getString("USERNAME");
				String p=rs.getString("PASS");
				System.out.println(username+" , "+password);
				System.out.println(u+" , "+p);
				if(password.equals(p))
				{
					System.out.println(username+" , "+password);
					loginRes = null;
					break;
				}
				else
				{				
					// GG NON ENTRERA MAI
					// SELECT USERNAME,PASS FROM users where username=? and pass=?
					loginRes=2;					
				}
			}

			System.out.println("Risultato login di  "+username+"="+loginRes);
			rs.close();

			//risf = ris.toString();
			//System.out.println(risf);
			return loginRes;
		} catch (Exception ex) {
			System.out.println("SQLException: "+ ex.getMessage());
			ex.printStackTrace();
			//			System.out.println("SQLState: "+ ex.getSQLState());
			//			System.out.println("VendorError: "+ ex.getErrorCode());
			return -1;
		}
	}
	
}
