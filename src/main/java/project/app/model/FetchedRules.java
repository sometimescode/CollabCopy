package project.app.model;

import java.util.HashMap;

public class FetchedRules {
    private HashMap<String, Rule> fetchedRules = new HashMap<String, Rule>();

    public HashMap<String, Rule> getFetchedRules() {
        return fetchedRules;
    }

    public void setFetchedRules(HashMap<String, Rule> fetchedRules) {
        this.fetchedRules = fetchedRules;
    }

    public int getMaxBorrowLimit() {
        return fetchedRules.get(AppConstants.RULE_NAME_MAX_BORROW_LIMIT).getRuleValue();
    }

    public int getMaxBorrowDuration() {
        return fetchedRules.get(AppConstants.RULE_NAME_MAX_BORROW_DURATION).getRuleValue();
    }

    public int getLateFee() {
        return fetchedRules.get(AppConstants.RULE_NAME_LATE_FEE).getRuleValue();
    }

    public int getMaxReservationDuration() {
        return fetchedRules.get(AppConstants.RULE_NAME_MAX_RESERVATION_DURATION).getRuleValue();
    }

    public int getFailureToPickUpFee() {
        return fetchedRules.get(AppConstants.RULE_NAME_FAILURE_TO_PICK_UP_FEE).getRuleValue();
    }

    public int getMaxStrikes() {
        return fetchedRules.get(AppConstants.RULE_NAME_MAX_STRIKES).getRuleValue();
    }
}
