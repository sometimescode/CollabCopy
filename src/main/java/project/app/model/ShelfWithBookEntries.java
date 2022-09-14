package project.app.model;

public class ShelfWithBookEntries {
    
    private int id;
    private String shelf_name;
    private int entries_count;
    
    public int getEntries_count() {
        return entries_count;
    }
    public void setEntries_count(int entries_count) {
        this.entries_count = entries_count;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getShelf_name() {
        return shelf_name;
    }
    public void setShelf_name(String shelf_name) {
        this.shelf_name = shelf_name;
    }

    
}
