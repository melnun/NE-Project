package com.ntt.seatlocator.action;

import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;


public class SaveExcelAction extends ActionSupport implements SessionAware {
	protected transient final Logger logger=Logger.getLogger(getClass());
	
	private static final long serialVersionUID = 1203516423320483102L;
	private String filename; //="SenzaNome.csv";
	private String jsonData;
	private Map<String, Object> session;
	
	public String execute() {
		
		logger.info("Requested to save the following json data to file:"+ filename);
		logger.info(""+jsonData);
		String f;
		if(session.get("username")==null){
			f="login";
		}else{
			final String username = (String)session.get("username");			
			logger.info("Username: "+username);
			String destFile="percorsobho/"+username+"/"+filename+".json";
			logger.info("Saving into..."+destFile);
			f="success";
		}
		return f;
	}
	

	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}



	public String getJsonData() {
		return jsonData;
	}



	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}



	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;		
	}
	
	
}
