package project.app.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import project.app.model.Rule;
import project.app.service.DBService;

public class AdminManageRules extends ActionSupport implements SessionAware {
    private Map<String, Object> userSession;
    
    private String error;
    private HashMap<String, Rule> rules;

    public String execute() {
        try {
            rules = DBService.getRulesHashMap();
            
            return SUCCESS;
        } catch (ClassNotFoundException | SQLException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public HashMap<String, Rule> getRules() {
        return rules;
    }

    public void setRules(HashMap<String, Rule> rules) {
        this.rules = rules;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        userSession = session;
        
    }
}
