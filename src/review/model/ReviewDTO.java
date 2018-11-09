package review.model;

import java.util.Date;

public class ReviewDTO {
	
	private int rid;
	private String rtitle;
	private Date rwritedt;
	private int rreaded;
	private String rcontent;
	private String rdid;
	private String writer;
	
	
	public int getRid() {
		return rid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public Date getRwritedt() {
		return rwritedt;
	}
	public void setRwritedt(Date rwritedt) {
		this.rwritedt = rwritedt;
	}

	public int getRreaded() {
		return rreaded;
	}
	public void setRreaded(int rreaded) {
		this.rreaded = rreaded;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdid() {
		return rdid;
	}
	public void setRdid(String rdid) {
		this.rdid = rdid;
	}
	
 
	


	
	
}

