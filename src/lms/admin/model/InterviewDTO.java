package lms.admin.model;

public class InterviewDTO {
		
	private String tpid;
	private String tpname;
	private String adminstart;
	private String adminend;
	private int rnum;
	
	
	
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
	public String getAdminstart() {
		return adminstart;
	}
	public void setAdminstart(String adminstart) {
		this.adminstart = adminstart;
	}
	public String getAdminend() {
		return adminend;
	}
	public void setAdminend(String adminend) {
		this.adminend = adminend;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	

}
