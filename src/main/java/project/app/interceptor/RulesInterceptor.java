package project.app.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.util.ValueStack;

import project.app.model.AppConstants;
import project.app.model.FetchedRules;
import project.app.service.DBService;

public class RulesInterceptor implements Interceptor {

	public void destroy() {
	}

	public void init() {
	}

	public String intercept( ActionInvocation actionInvocation ) throws Exception {
		FetchedRules rules = new FetchedRules();
        rules.setFetchedRules(DBService.getRulesHashMap());
        
        ValueStack stack = actionInvocation.getInvocationContext().getValueStack();
        stack.set(AppConstants.RULES, rules);
		
        return actionInvocation.invoke();
	}	
}
