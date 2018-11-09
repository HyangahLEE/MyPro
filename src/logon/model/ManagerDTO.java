package logon.model;

public class ManagerDTO {

	
	public String mgid;
	public String mgname;
	public String mgpwd;
	public String pgposition;
	public String mgaddr;
	public String mgemail;
	public String mgphone;
	
	
	
	public ManagerDTO() {
		super();
	}



	public ManagerDTO(String mgid, String mgname, String mgpwd, String pgposition, String mgaddr, String mgemail,
			String mgphone) {
		super();
		this.mgid = mgid;
		this.mgname = mgname;
		this.mgpwd = mgpwd;
		this.pgposition = pgposition;
		this.mgaddr = mgaddr;
		this.mgemail = mgemail;
		this.mgphone = mgphone;
	}
	
	
	
	public String getMgid() {
		return mgid;
	}
	public void setMgid(String mgid) {
		this.mgid = mgid;
	}
	public String getMgname() {
		return mgname;
	}
	public void setMgname(String mgname) {
		this.mgname = mgname;
	}
	public String getMgpwd() {
		return mgpwd;
	}
	public void setMgpwd(String mgpwd) {
		this.mgpwd = mgpwd;
	}
	public String getPgposition() {
		return pgposition;
	}
	public void setPgposition(String pgposition) {
		this.pgposition = pgposition;
	}
	public String getMgaddr() {
		return mgaddr;
	}
	public void setMgaddr(String mgaddr) {
		this.mgaddr = mgaddr;
	}
	public String getMgemail() {
		return mgemail;
	}
	public void setMgemail(String mgemail) {
		this.mgemail = mgemail;
	}
	public String getMgphone() {
		return mgphone;
	}
	public void setMgphone(String mgphone) {
		this.mgphone = mgphone;
	}
	
	
	
}
