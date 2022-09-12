package project.app.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import project.app.service.DBService;

public class AdminEditRule extends ActionSupport implements SessionAware {
    private Map<String, Object> userSession;

    private int dbId;
    private String ruleName;
    private int ruleValue;

    private String error;

    public String editRule() {
        try {
            DBService.editRule(dbId, ruleValue);
            return SUCCESS;
        } catch (ClassNotFoundException | SQLException | IOException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public int getDbId() {
        return dbId;
    }

    public void setDbId(int dbId) {
        this.dbId = dbId;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public int getRuleValue() {
        return ruleValue;
    }

    public void setRuleValue(int ruleValue) {
        this.ruleValue = ruleValue;
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
