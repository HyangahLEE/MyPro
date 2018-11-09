package reservation.model;

import java.sql.Date;

public class ReservDTO {

		
	private String mbid;
	private String memberid;
	private String mbprogress;
	private String mbcontent;
	private Date CONSULTINGDT;
	
	
	
	
	public String getMbid() {
		return mbid;
	}
	public void setMbid(String mbid) {
		this.mbid = mbid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMbprogress() {
		return mbprogress;
	}
	public void setMbprogress(String mbprogress) {
		this.mbprogress = mbprogress;
	}
	public String getMbcontent() {
		return mbcontent;
	}
	public void setMbcontent(String mbcontent) {
		this.mbcontent = mbcontent;
	}
	public Date getCONSULTINGDT() {
		return CONSULTINGDT;
	}
	public void setCONSULTINGDT(Date cONSULTINGDT) {
		CONSULTINGDT = cONSULTINGDT;
	}
	
	
	
}
