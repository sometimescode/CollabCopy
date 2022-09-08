package project.app.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import project.app.model.Rule;
import project.app.service.DBService;

public class AdminManageRules extends ActionSupport implements SessionAware {
    private Map<String, Object> userSession;
    
    private String error;
    private List<Rule> rules;

    public String execute() {
        try {
            rules = DBService.getRules();
            return SUCCESS;
        } catch (ClassNotFoundException | SQLException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public List<Rule> getRules() {
        return rules;
    }

    public void setRules(List<Rule> rules) {
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
