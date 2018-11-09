package Attended.model;

import java.util.Date;

public class TpNameDTO {
    private String tpid;
    private String tpname;
    private int tptime;
    private int col;
    private String tpdaily;
    private int tpclass;
    private String tptype;
    private int tpcost;
    private String mgid;
    private Date adminstart;
    private Date adminend;
    private String apid;
    
    private String campusname;
    private int mcnt;
    
    private String totaltype;
    
    
    
    public String getTotaltype() {
        return totaltype;
    }
    public void setTotaltype(String totaltype) {
        this.totaltype = totaltype;
    }
    public String getCampusname() {
        return campusname;
    }
    public void setCampusname(String campusname) {
        this.campusname = campusname;
    }
    public int getMcnt() {
        return mcnt;
    }
    public void setMcnt(int mcnt) {
        this.mcnt = mcnt;
    }
    public String getTpid() {
        return tpid;
    }
    public void setTpid(String tpid) {
        this.tpid = tpid;
    }
    public String getTpname() {
        return tpname;
    }
    public void setTpname(String tpname) {
        this.tpname = tpname;
    }
    public int getTptime() {
        return tptime;
    }
    public void setTptime(int tptime) {
        this.tptime = tptime;
    }
    public int getCol() {
        return col;
    }
    public void setCol(int col) {
        this.col = col;
    }
    public String getTpdaily() {
        return tpdaily;
    }
    public void setTpdaily(String tpdaily) {
        this.tpdaily = tpdaily;
    }
    public int getTpclass() {
        return tpclass;
    }
    public void setTpclass(int tpclass) {
        this.tpclass = tpclass;
    }
    public String getTptype() {
        return tptype;
    }
    public void setTptype(String tptype) {
        this.tptype = tptype;
    }
    public int getTpcost() {
        return tpcost;
    }
    public void setTpcost(int tpcost) {
        this.tpcost = tpcost;
    }
    public String getMgid() {
        return mgid;
    }
    public void setMgid(String mgid) {
        this.mgid = mgid;
    }
    public Date getAdminstart() {
        return adminstart;
    }
    public void setAdminstart(Date adminstart) {
        this.adminstart = adminstart;
    }
    public Date getAdminend() {
        return adminend;
    }
    public void setAdminend(Date adminend) {
        this.adminend = adminend;
    }
    public String getApid() {
        return apid;
    }
    public void setApid(String apid) {
        this.apid = apid;
    }
    
    
    
    
}
