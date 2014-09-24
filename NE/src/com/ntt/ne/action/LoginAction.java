package com.ntt.ne.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.ntt.ne.dao.UserDAO;
import com.ntt.ne.gestionefile.FileManager;
//import com.ntt.seatlocator.beans.Utente;
//import com.ntt.seatlocator.dao.UtenteDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{
	protected transient final Logger logger=Logger.getLogger(getClass());

	private static final long serialVersionUID = 1203516423320483102L;
	private String username;
	private String password;
	private Map<String, Object> session;


	@Override
	public String execute() throws SQLException, NamingException {

		String r;
		
		UserDAO dao = new UserDAO();
		
		if ( dao.checkUserPassword(username, password)==null)
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
	



}
