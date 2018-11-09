package lms.student.dto;

public class SevalueDTO {

/*	SEID	VARCHAR2(30 BYTE)
	SENAME	VARCHAR2(100 BYTE)
	SETYPE	VARCHAR2(30 BYTE)
	SELEVEL	NUMBER
	SETIME	NUMBER
	SENUMBER	NUMBER
	SESCORE	NUMBER
	SECURR	VARCHAR2(20 BYTE)
	SEGRADE	NUMBER
	SID	VARCHAR2(30 BYTE)*/
	
	private String seId;
	private String seName;
	private String seType;
	private int seLevel;
	private int seTime;
	private int seNumber;
	private int seScore;
	private String seCurr;
	private int seGrade;
	private String sId;
	private String memberId;
	
	
	public String getSeId() {
		return seId;
	}
	public void setSeId(String seId) {
		this.seId = seId;
	}
	public String getSeName() {
		return seName;
	}
	public void setSeName(String seName) {
		this.seName = seName;
	}
	public String getSeType() {
		return seType;
	}
	public void setSeType(String seType) {
		this.seType = seType;
	}
	public int getSeLevel() {
		return seLevel;
	}
	public void setSeLevel(int seLevel) {
		this.seLevel = seLevel;
	}
	public int getSeTime() {
		return seTime;
	}
	public void setSeTime(int seTime) {
		this.seTime = seTime;
	}
	public int getSeNumber() {
		return seNumber;
	}
	public void setSeNumber(int seNumber) {
		this.seNumber = seNumber;
	}
	public int getSeScore() {
		return seScore;
	}
	public void setSeScore(int seScore) {
		this.seScore = seScore;
	}
	public String getSeCurr() {
		return seCurr;
	}
	public void setSeCurr(String seCurr) {
		this.seCurr = seCurr;
	}
	public int getSeGrade() {
		return seGrade;
	}
	public void setSeGrade(int seGrade) {
		this.seGrade = seGrade;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
