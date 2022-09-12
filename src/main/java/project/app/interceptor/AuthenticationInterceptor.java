package project.app.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import project.app.model.AppConstants;

public class AuthenticationInterceptor implements Interceptor {

    public void destroy() {
	}

	public void init() {
	}

	public String intercept( ActionInvocation actionInvocation ) throws Exception {

		Map<String, Object> session = actionInvocation.getInvocationContext().getSession();
      
		String role = (String) session.get(AppConstants.USER_SESSION_ROLE);

        String actionName = actionInvocation.getInvocationContext().getName();

        String actionNamespace = actionInvocation.getProxy().getNamespace();

        switch(actionName) {
            case "index" :
            case "register": 
            case "login": 
            case "registerUser":
            case "loginAccount": break;
            default: {
                if (role == null) {
                    return Action.LOGIN;
                } else if (role.equals("Regular") && actionNamespace.contains("/admin") ) {
                    return "unauthorized";
                }
            }
        }	
        
        return actionInvocation.invoke();
	}
}
