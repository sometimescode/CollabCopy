package project.app.model;

import java.util.Date;

public class BookEntry {
    private int dbId;
    private String title;
    private String authors;
    private String cover;
    private String ISBN;
    private int pageCount;
    private String publisher;
    private Date publishedDate;
    private String genre;
    private int shelfId;
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
    public String getAuthors() {
        return authors;
    }
    public void setAuthors(String authors) {
        this.authors = authors;
    }
    public String getCover() {
        return cover;
    }
    public void setCover(String cover) {
        this.cover = cover;
    }
    public String getISBN() {
        return ISBN;
    }
    public void setISBN(String iSBN) {
        ISBN = iSBN;
    }
    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
    public String getPublisher() {
        return publisher;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public Date getPublishedDate() {
        return publishedDate;
    }
    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }
    public String getGenre() {
        return genre;
    }
    public void setGenre(String genre) {
        this.genre = genre;
    }
    public int getShelfId() {
        return shelfId;
    }
    public void setShelfId(int shelfId) {
        this.shelfId = shelfId;
    }
    @Override
    public String toString() {
        return "BookEntry [ISBN=" + ISBN + ", authors=" + authors + ", cover=" + cover + ", dbId=" + dbId + ", genre="
                + genre + ", pageCount=" + pageCount + ", publishedDate=" + publishedDate + ", publisher=" + publisher
                + ", title=" + title + "]";
    }
}
