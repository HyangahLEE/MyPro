package lms.student.dto;

public class RgraphDTO {

	private int graphId;
	private int pescore;
	private String pename;
	private String sname;
	private int sscore;
	private String sId;
/*	private String memberId;*/
	
	
	public int getGraphId() {
		return graphId;
	}
	public void setGraphId(int graphId) {
		this.graphId = graphId;
	}
	public int getPescore() {
		return pescore;
	}
	public void setPescore(int pescore) {
		this.pescore = pescore;
	}
	public String getPename() {
		return pename;
	}
	public void setPename(String pename) {
		this.pename = pename;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getSscore() {
		return sscore;
	}
	public void setSscore(int sscore) {
		this.sscore = sscore;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
/*	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}*/
	
}
