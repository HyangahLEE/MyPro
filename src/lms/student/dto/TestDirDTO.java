package lms.student.dto;

import java.util.Date;

public class TestDirDTO {

	
	/*
MEMBERID	VARCHAR2(20)
SEMDIV	VARCHAR2(30)
SEMSCORE	NUMBER
SEMCURR	VARCHAR2(20)
SUBJECTSNAME	VARCHAR2(100)
SUBJECTSDIV	VARCHAR2(20)
PNAME	VARCHAR2(20)
SEMDATE	DATE
SEMTIME	NUMBER
SEMTYPE	VARCHAR2(30)
UNITNAME	VARCHAR2(50)
	*/
	
	private String memberId;
	private String semDiv;
	private int semScore;
	private String semCurr;
	private String subjectsName;
	private String subjectsDiv;
	private String pName;
	private Date semDate;
	private int semTime;
	private String semType;
	private String unitName;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSemDiv() {
		return semDiv;
	}
	public void setSemDiv(String semDiv) {
		this.semDiv = semDiv;
	}
	public int getSemScore() {
		return semScore;
	}
	public void setSemScore(int semScore) {
		this.semScore = semScore;
	}
	public String getSemCurr() {
		return semCurr;
	}
	public void setSemCurr(String semCurr) {
		this.semCurr = semCurr;
	}
	public String getSubjectsName() {
		return subjectsName;
	}
	public void setSubjectsName(String subjectsName) {
		this.subjectsName = subjectsName;
	}
	public String getSubjectsDiv() {
		return subjectsDiv;
	}
	public void setSubjectsDiv(String subjectsDiv) {
		this.subjectsDiv = subjectsDiv;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public Date getSemDate() {
		return semDate;
	}
	public void setSemDate(Date semDate) {
		this.semDate = semDate;
	}
	public int getSemTime() {
		return semTime;
	}
	public void setSemTime(int semTime) {
		this.semTime = semTime;
	}
	public String getSemType() {
		return semType;
	}
	public void setSemType(String semType) {
		this.semType = semType;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	
}
