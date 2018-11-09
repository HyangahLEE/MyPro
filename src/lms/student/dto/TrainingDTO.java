package lms.student.dto;

import java.util.Date;

public class TrainingDTO {

	//뷰
	
	private String memberId;
	private String sbmImgFile;
	private Date tpoStartDt;
	private Date tpoEndDt;
	private String tpName;
	private String tpType;
	private String tpGuideBook;
	private String pGuide;
	private String pName;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSbmImgFile() {
		return sbmImgFile;
	}
	public void setSbmImgFile(String sbmImgFile) {
		this.sbmImgFile = sbmImgFile;
	}
	public Date getTpoStartDt() {
		return tpoStartDt;
	}
	public void setTpoStartDt(Date tpoStartDt) {
		this.tpoStartDt = tpoStartDt;
	}
	public Date getTpoEndDt() {
		return tpoEndDt;
	}
	public void setTpoEndDt(Date tpoEndDt) {
		this.tpoEndDt = tpoEndDt;
	}
	public String getTpName() {
		return tpName;
	}
	public void setTpName(String tpName) {
		this.tpName = tpName;
	}
	public String getTpType() {
		return tpType;
	}
	public void setTpType(String tpType) {
		this.tpType = tpType;
	}
	public String getTpGuideBook() {
		return tpGuideBook;
	}
	public void setTpGuideBook(String tpGuideBook) {
		this.tpGuideBook = tpGuideBook;
	}
	public String getpGuide() {
		return pGuide;
	}
	public void setpGuide(String pGuide) {
		this.pGuide = pGuide;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	
}
