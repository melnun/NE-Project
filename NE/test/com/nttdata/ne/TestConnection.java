package com.nttdata.ne;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class TestConnection {

	public void main (String[] args)
	{
		Connection connessione = null;
		ResultSet rs ;
		String risf;
		try{
			connessione = DriverManager.getConnection("jdbc:mysql://localhost/ne?user=root");
			System.out.println("Connessione:"+connessione);
			String query2 = "SELECT DATA,USERNAME FROM users;";
			Statement qry = (Statement) connessione.prepareStatement(query2);
			String query = "INSERT INTO 'users' ('Username, 'Pass', 'Flag', 'Data') VALUES ('gandalf','frodo', 0, '2014-09-22')";			
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
			
			//risf = ris.toString();
			//System.out.println(risf);
		} catch (Exception ex) {
			System.out.println("SQLException: "+ ex.getMessage());
			//			System.out.println("SQLState: "+ ex.getSQLState());
			//			System.out.println("VendorError: "+ ex.getErrorCode());
		}
	}
}
