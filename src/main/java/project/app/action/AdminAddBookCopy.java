package project.app.action;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import project.app.model.BookCopy;
import project.app.model.BookEntry;
import project.app.service.DBService;

public class AdminAddBookCopy extends ActionSupport implements SessionAware {
    private Map<String, Object> userSession;

    private BookCopy bookCopyBean;
    private BookEntry bookEntryBean;
    private String error;
    private String validationString;
    private int bookCopyLatestSerialCount;
    private boolean toggleAutoGenerateCopies;
    private int copiesToGenerate;

    public String execute() {
        bookEntryBean = new BookEntry();
        toggleAutoGenerateCopies = false;
        copiesToGenerate = 2;

        int bookEntryId = (int) userSession.get("bookEntryId");
        try {
            bookEntryBean = DBService.getBookEntryById(bookEntryId);

            String serialId = DBService.getLatestBookCopySerial(bookEntryBean.getDbId());

            if(serialId != null) {
                bookCopyLatestSerialCount = Integer.parseInt(serialId.split("-")[1]) + 1; 
            } else {
                bookCopyLatestSerialCount = 1;
            }                

            return SUCCESS;
        } catch (ClassNotFoundException | SQLException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public void validate(){
        if(toggleAutoGenerateCopies && copiesToGenerate < 2) {
            addFieldError("copiesToGenerate", "Copies to generate must be greater than 1.");
        }
    }

    public String addBookCopy() {
        bookCopyBean.setBookEntryId((int) userSession.get("bookEntryId"));
        bookCopyBean.setSerialId(bookEntryBean.getISBN() + "-" + bookCopyLatestSerialCount);

        if(!toggleAutoGenerateCopies) {
            copiesToGenerate = 1;
        }

        try {
            DBService.addBookCopy(bookCopyBean, copiesToGenerate);
            return SUCCESS;
        } catch (SQLException | ClassNotFoundException e) {
            if(e instanceof SQLIntegrityConstraintViolationException) {
                validationString = "Serial Id already exists in database.";
                return INPUT;
            } else {
                error = e.toString();
                e.printStackTrace();
                return ERROR;
            }
        }
    }

    public BookCopy getBookCopyBean() {
        return bookCopyBean;
    }

    public void setBookCopyBean(BookCopy bookCopyBean) {
        this.bookCopyBean = bookCopyBean;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public BookEntry getBookEntryBean() {
        return bookEntryBean;
    }

    public void setBookEntryBean(BookEntry bookEntryBean) {
        this.bookEntryBean = bookEntryBean;
    }

    public Map<String, Object> getUserSession() {
        return userSession;
    }

    public void setUserSession(Map<String, Object> userSession) {
        this.userSession = userSession;
    }

    public String getValidationString() {
        return validationString;
    }

    public void setValidationString(String validationString) {
        this.validationString = validationString;
    }

    public int getBookCopyLatestSerialCount() {
        return bookCopyLatestSerialCount;
    }

    public void setBookCopyLatestSerialCount(int bookCopyLatestSerialCount) {
        this.bookCopyLatestSerialCount = bookCopyLatestSerialCount;
    }

    public boolean isToggleAutoGenerateCopies() {
        return toggleAutoGenerateCopies;
    }

    public void setToggleAutoGenerateCopies(boolean toggleAutoGenerateCopies) {
        this.toggleAutoGenerateCopies = toggleAutoGenerateCopies;
    }

    public int getCopiesToGenerate() {
        return copiesToGenerate;
    }

    public void setCopiesToGenerate(int copiesToGenerate) {
        this.copiesToGenerate = copiesToGenerate;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        userSession = session;        
    }
}
