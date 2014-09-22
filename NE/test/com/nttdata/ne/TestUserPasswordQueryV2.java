package com.nttdata.ne;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class TestUserPasswordQueryV2 {

	/**
	 * Testa la passwor d utente
	 * @param args
	 */
	public static void main (String[] args)
	{
		final String user="admin";
		final String pw="sbagliata";

		//......
		/**
		 * Fare un metodo che ha in input la connessione,
		 * e ritorna 
		 * null se la combo password+utente è giusta
		 * 1 se l'utente non esistre
		 * 2 per errore generico (es password errata, ecc ecc)
		 *  
		 */
		Connection connessione = null;
		ResultSet rs ;
		String risf;
		try{
			connessione = DriverManager.getConnection("jdbc:mysql://localhost/ne?user=root");
			
			Integer r=checkUserPassword(connessione,"admin","admin");
			if(r!=null){
				System.err.println("Test admin con pw admin fallito!. Atteso null ritornato:"+r);
			}
			r=checkUserPassword(connessione, "nonesisto", "");
			if(!r.equals(1)){
				System.err.println("Test API utente non esistente fallita. Atteso 1 ritornato:"+r);							
			}
			
			
			
		} catch (Exception ex) {
			System.out.println("SQLException: "+ ex.getMessage());
			//			System.out.println("SQLState: "+ ex.getSQLState());
			//			System.out.println("VendorError: "+ ex.getErrorCode());
		}
	}

	/**
	 * 
	 * @param c
	 * @param username
	 * @param password
	 * @return
	 *    null se la combo password+utente è giusta
	 *    1 se l'utente non esistre
	 *    2 per errore generico (es password errata, ecc ecc)
	 *   -1 in caso di eccezione 
	 */
	@SuppressWarnings("boxing")
	public static Integer checkUserPassword(Connection c, String username,String password)
	{
		try{
			Connection connessione = null;
			ResultSet rs ;
			
			connessione = c;
			
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
					System.out.println("ocropoid");
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
