package com.ntt.seatlocator.action;

import gestione.file.FileManager;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;


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

	
	public String execute() {

		String r;
//		UtenteDAO utente = new UtenteDAO();
//		Utente u = new Utente();
//		u.setUsername(username);
//		u.setPassword(password);
//		if (utente.login(u)){ 
//			session.put("user", u);
		if ((("" + username).equals("admin") && (("" + password).equals(""))))
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
		
		this.logger.info("Login: "+r+" Input:"+username+ " *** PWLen:"+(password!=null?password.length():"null") + " ***");
		
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
	
	
	public void validate(){
		if("".equals(getUsername())){
			addFieldError("username", getText("Inserire username"));
		}
	}

}
