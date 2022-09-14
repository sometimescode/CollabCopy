package project.app.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import project.app.model.BookEntry;
import project.app.model.Shelf;
import project.app.model.ShelfWithBookEntries;
import project.app.service.DBService;

public class AdminManageShelf extends ActionSupport implements SessionAware{
    
    private List<ShelfWithBookEntries> shelves;
    private List<BookEntry> bookEntries;
    private List<Integer> shelfList;
    private String title;
    private String shelfName;
    private String error;
    private int shelfId;
    private int dbId;

    public String execute() {
        try {
            shelves = DBService.getShelvesEntries();
            return SUCCESS;
        } catch (Exception e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
        
    }

    public String addShelf() {
        try {
            return SUCCESS;
        } catch (Exception e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public String addShelfToDb() {
        try {
            DBService.addShelf(shelfName);
            return SUCCESS;
        } catch (Exception e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public String getShelfById() {
        try {
            bookEntries = DBService.getShelfById(shelfId);
            return SUCCESS;
        } catch (Exception e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }
    
    public String changeShelf() {
        try {
            return INPUT;
        } catch (Exception e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    public String changeShelfSelect() {
        try {
            DBService.changeShelf(shelfId, dbId);
            return SUCCESS;
        } catch (Exception e) {
            error = e.toString();
            e.printStackTrace();
            return ERROR;
        }
    }

    @Override
    public void setSession(Map<String, Object> session) {
        // TODO Auto-generated method stub
        
    }
    
    public int getShelfId() {
        return shelfId;
    }

    public void setShelfId(int shelfId) {
        this.shelfId = shelfId;
    }

    public List<ShelfWithBookEntries> getShelves() {
        return shelves;
    }

    public void setShelves(List<ShelfWithBookEntries> shelves) {
        this.shelves = shelves;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getShelfName() {
        return shelfName;
    }

    public void setShelfName(String shelfName) {
        this.shelfName = shelfName;
    }

    public List<BookEntry> getBookEntries() {
        return bookEntries;
    }

    public void setBookEntries(List<BookEntry> bookEntries) {
        this.bookEntries = bookEntries;
    }

    public List<Integer> getShelfList() throws ClassNotFoundException, SQLException {
        return DBService.getShelvesInList();
    }

    public void setShelfList(List<Integer> shelfList) {
        this.shelfList = shelfList;
    }

    public int getDbId() {
        return dbId;
    }

    public void setDbId(int dbId) {
        this.dbId = dbId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
