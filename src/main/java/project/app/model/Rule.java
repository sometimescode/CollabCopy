package project.app.model;

public class Rule {
    private int dbId;
    private String ruleName;
    private int ruleValue;
    private String ruleDenomination;
    private String ruleDescription;
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
    public String getRuleDenomination() {
        return ruleDenomination;
    }
    public void setRuleDenomination(String ruleDenomination) {
        this.ruleDenomination = ruleDenomination;
    }
    public String getRuleDescription() {
        return ruleDescription;
    }
    public void setRuleDescription(String ruleDescription) {
        this.ruleDescription = ruleDescription;
    }
    @Override
    public String toString() {
        return "Rule [dbId=" + dbId + ", ruleDenomination=" + ruleDenomination + ", ruleDescription=" + ruleDescription
                + ", ruleName=" + ruleName + ", ruleValue=" + ruleValue + "]";
    }
  }
