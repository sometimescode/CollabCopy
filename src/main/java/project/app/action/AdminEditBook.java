package project.app.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import project.app.model.BookEntry;
import project.app.service.DBService;

public class AdminEditBook extends ActionSupport implements SessionAware {
    private Map<String, Object> userSession;

    private String error;

    private String ISBN;
    private BookEntry bookEntryBean;
    private boolean newCoverUpload;

    private List<String> genreList = Arrays.asList(new String[] {"Fiction", "Non-Fiction"});

    private File file;
    private String contentType;
    private String filename;
    private String fileValidationString;

    public String editBookEntry() {
        try {
            if(newCoverUpload && file == null) {
                fileValidationString = "New cover image is required.";
                return INPUT;
            } else {
                bookEntryBean.setDbId((int) userSession.get("bookEntryId"));
                DBService.editBookEntry(bookEntryBean, newCoverUpload, file);
                return SUCCESS;
            }
        } catch (SQLException | ClassNotFoundException | IOException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public String getBookEntryById() {
        try {
            newCoverUpload = false;
            bookEntryBean = DBService.getBookEntryById((int) userSession.get("bookEntryId"));
            return SUCCESS;
        } catch (SQLException | ClassNotFoundException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String iSBN) {
        ISBN = iSBN;
    }

    public BookEntry getBookEntryBean() {
        return bookEntryBean;
    }

    public void setBookEntryBean(BookEntry bookEntryBean) {
        this.bookEntryBean = bookEntryBean;
    }

    public List<String> getGenreList() {
        return genreList;
    }

    public void setGenreList(List<String> genreList) {
        this.genreList = genreList;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setUpload(File file) {
        this.file = file;
    }

    public void setUploadContentType(String contentType) {
        this.contentType = contentType;
    }

    public void setUploadFileName(String filename) {
        this.filename = filename;
    }

    public boolean isNewCoverUpload() {
        return newCoverUpload;
    }

    public void setNewCoverUpload(boolean newCoverUpload) {
        this.newCoverUpload = newCoverUpload;
    }

    public String getFileValidationString() {
        return fileValidationString;
    }

    public void setFileValidationString(String fileValidationString) {
        this.fileValidationString = fileValidationString;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        userSession = session;
    }
}
