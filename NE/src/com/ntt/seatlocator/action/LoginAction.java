package com.ntt.seatlocator.action;

import gestione.file.FileManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
//import com.ntt.seatlocator.beans.Utente;
//import com.ntt.seatlocator.dao.UtenteDAO;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction extends ActionSupport implements SessionAware{
	protected transient final Logger logger=Logger.getLogger(getClass());

	private static final long serialVersionUID = 1203516423320483102L;
	private String username;
	private String password;
	private Map<String, Object> session;


	@Override
	public String execute() throws SQLException, NamingException {

		String r;
		
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/ne");
		Connection connessione = ds.getConnection();

		if ( this.checkUserPassword(connessione, username, password)==null)
		{
			Map<String, Object> session=ActionContext.getContext().getSession();
			session.put("username", username);
			List<String> flist=(new FileManager()).seekFile(username);
			session.put("currentFileList", flist);
			r= "success";
		} else {
			super.addActionError("Login incorrect");
			r= "error";
		}		
		connessione.close();
		return r;

	}

	@Override
	public void setSession(Map<String, Object> session) {

		this.session = session;
		logger.debug("Session content:"+this.session);
	}

	//	public Map<String, Object> getSession()
	//	{
	//		logger.info("Requested session:"+session);
	//		return session;
	//	}

	public String getUsername() {

		return username;
	}


	public void setUsername(String username) {
		logger.info("SET USERNAME="+username);

		this.username = username;
	}

	public String getPassword() {

		return password;
	}

	public void setPassword(String password) {

		this.password = password;

	}

	public List<String> getCurrentFileList(){
		String username=""+(String)session.get("username");
		return (new FileManager()).seekFile(username);

	}


	@Override
	public void validate(){
		if("".equals(getUsername())){
			addFieldError("username", getText("Inserire username"));
		}
	}
	

	@SuppressWarnings("boxing")
	public Integer checkUserPassword(Connection c, String username,String password)
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
