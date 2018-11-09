package faq.model;

import java.util.Date;

public class FaqDTO {
	private int faqnum; 
	private String faqtitle;
	private Date faqwritedt;
	private int faqreaded;
	private String faqcontent;
	private String mgid;	
	private String faqdid;	
	private String faqdname;
	
	
	public String getFaqdname() {
		return faqdname;
	}
	public void setFaqdname(String faqdname) {
		this.faqdname = faqdname;
	}
	public int getFaqnum() {
		return faqnum;
	}
	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}
	public String getFaqtitle() {
		return faqtitle;
	}
	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}
	public Date getFaqwritedt() {
		return faqwritedt;
	}
	public void setFaqwritedt(Date faqwritedt) {
		this.faqwritedt = faqwritedt;
	}
	public int getFaqreaded() {
		return faqreaded;
	}
	public void setFaqreaded(int faqreaded) {
		this.faqreaded = faqreaded;
	}
	public String getFaqcontent() {
		return faqcontent;
	}
	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}
	public String getMgid() {
		return mgid;
	}
	public void setMgid(String mgid) {
		this.mgid = mgid;
	}
	public String getFaqdid() {
		return faqdid;
	}
	public void setFaqdid(String faqdid) {
		this.faqdid = faqdid;
	}
	
	
	
	
	
}
