package ask.model;

import java.util.Date;

public class AskDTO {
 
	private int anum; 
	private String atitle;
	private Date awritedt;
	private int areaded;
	private String afile;
	private String acontent;	
	private String writer;
	private String adid;
	private String pass;
	private String email;
	private int ref;
	private int step;
	private int depth;
	private String savefile;
	
	
	
	
	
	
	public String getSavefile() {
		return savefile;
	}
	public void setSavefile(String savefile) {
		this.savefile = savefile;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public Date getAwritedt() {
		return awritedt;
	}
	public void setAwritedt(Date awritedt) {
		this.awritedt = awritedt;
	}
	public int getAreaded() {
		return areaded;
	}
	public void setAreaded(int areaded) {
		this.areaded = areaded;
	}
	public String getAfile() {
		return afile;
	}
	public void setAfile(String afile) {
		this.afile = afile;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAdid() {
		return adid;
	}
	public void setAdid(String adid) {
		this.adid = adid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
}

