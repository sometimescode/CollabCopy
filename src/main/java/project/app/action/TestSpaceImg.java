package project.app.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

import project.app.service.DBService;

public class TestSpaceImg extends ActionSupport {
    private File file;
    private String contentType;
    private String filename;
    private String error;
    

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

    public String execute() {
        try {
            DBService.testAddBookEntryGetId(file, contentType, filename);
        } catch (ClassNotFoundException | SQLException | IOException e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }
}