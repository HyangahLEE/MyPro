package lms.student.dto;

public class PreTestScoreDTO {

/*	SID	VARCHAR2(30 BYTE)
	ANSWER1	NUMBER
	ANSWER2	NUMBER
	ANSWER3	NUMBER
	ANSWER4	NUMBER
	ANSWER5	NUMBER
	ANSWER6	NUMBER
	ANSWER7	NUMBER
	ANSWER8	NUMBER
	ANSWER9	NUMBER
	ANSWER10	NUMBER
	TOTALSCORE	NUMBER
	SECURR	VARCHAR2(20 BYTE)
	*/
	
	private String sId;
	private String memberId;
	private int answer1;
	private int answer2;
	private int answer3;
	private int answer4;
	private int answer5;
	private int answer6;
	private int answer7;
	private int answer8;
	private int answer9;
	private int answer10;
	private int totalScore;
	private String seCurr;
	
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
	public int getAnswer1() {
		return answer1;
	}
	public void setAnswer1(int answer1) {
		this.answer1 = answer1;
	}
	public int getAnswer2() {
		return answer2;
	}
	public void setAnswer2(int answer2) {
		this.answer2 = answer2;
	}
	public int getAnswer3() {
		return answer3;
	}
	public void setAnswer3(int answer3) {
		this.answer3 = answer3;
	}
	public int getAnswer4() {
		return answer4;
	}
	public void setAnswer4(int answer4) {
		this.answer4 = answer4;
	}
	public int getAnswer5() {
		return answer5;
	}
	public void setAnswer5(int answer5) {
		this.answer5 = answer5;
	}
	public int getAnswer6() {
		return answer6;
	}
	public void setAnswer6(int answer6) {
		this.answer6 = answer6;
	}
	public int getAnswer7() {
		return answer7;
	}
	public void setAnswer7(int answer7) {
		this.answer7 = answer7;
	}
	public int getAnswer8() {
		return answer8;
	}
	public void setAnswer8(int answer8) {
		this.answer8 = answer8;
	}
	public int getAnswer9() {
		return answer9;
	}
	public void setAnswer9(int answer9) {
		this.answer9 = answer9;
	}
	public int getAnswer10() {
		return answer10;
	}
	public void setAnswer10(int answer10) {
		this.answer10 = answer10;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public String getSeCurr() {
		return seCurr;
	}
	public void setSeCurr(String seCurr) {
		this.seCurr = seCurr;
	}
	
}
