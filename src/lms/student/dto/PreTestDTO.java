package lms.student.dto;

public class PreTestDTO {

/*	SENAME	VARCHAR2(100)
	SETYPE	VARCHAR2(30)
	SESCORE	NUMBER
	PNAME	VARCHAR2(20)
	MEMBERID	VARCHAR2(20)
	SECURR	VARCHAR2(20 BYTE)
	SETIME	NUMBER
	SENUMBER	NUMBER
	TOTALSCORE	NUMBER
	*/
	
	private String seName;
	private String seType;
	private int seScore;
	private String pName;
	private String memberId;
	private String seCurr;
	private int seTime;
	private int seNumber;
	private int totalScore;
	
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
	public int getSeScore() {
		return seScore;
	}
	public void setSeScore(int seScore) {
		this.seScore = seScore;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSeCurr() {
		return seCurr;
	}
	public void setSeCurr(String seCurr) {
		this.seCurr = seCurr;
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
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	
}
