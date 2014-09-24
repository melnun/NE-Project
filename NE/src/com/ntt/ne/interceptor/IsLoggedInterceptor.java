package com.ntt.ne.interceptor;

import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class IsLoggedInterceptor implements Interceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3194615124296667796L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}
	
	protected transient final Logger logger=Logger.getLogger(getClass());

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

	
		Map<String, Object> session = invocation.getInvocationContext().getSession();

		if(session==null || session.get("username")==null){
			logger.error("Utente non loggato, redirezione a login");
			return "login";
		}	
		else 
			return invocation.invoke();

	}
}