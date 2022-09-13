package project.app.model;

public class SerialId {
    private int dbId;
    private String serialId;

    public SerialId(int dbId, String serialId) {
        this.dbId = dbId;
        this.serialId = serialId;
    }

    public int getDbId() {
        return dbId;
    }

    public void setDbId(int dbId) {
        this.dbId = dbId;
    }

    public String getSerialId() {
        return serialId;
    }

    public void setSerialId(String serialId) {
        this.serialId = serialId;
    }

    @Override
    public String toString() {
        return "SerialId [dbId=" + dbId + ", serialId=" + serialId + "]";
    }
}
