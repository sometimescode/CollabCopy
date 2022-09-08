package project.app.model;

public class Rule {
    private int dbId;
    private String ruleName;
    private String ruleValue;
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
    public String getRuleValue() {
        return ruleValue;
    }
    public void setRuleValue(String ruleValue) {
        this.ruleValue = ruleValue;
    }
    @Override
    public String toString() {
        return "Rule [dbId=" + dbId + ", ruleName=" + ruleName + ", ruleValue=" + ruleValue + "]";
    }
  }
