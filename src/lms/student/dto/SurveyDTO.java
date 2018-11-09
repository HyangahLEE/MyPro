package lms.student.dto;

import java.util.Date;

public class SurveyDTO {

/*	MEMBERID	VARCHAR2(20)
	SURQUESTION	VARCHAR2(500)
	SSMTIME	DATE
	SSMDIV	VARCHAR2(30)
	PNAME	VARCHAR2(20)*/
	
	private String memberId;
	private String surQuestion;
	private Date ssmTime;
	private String ssmDiv;
	private String pName;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getSurQuestion() {
		return surQuestion;
	}
	public void setSurQuestion(String surQuestion) {
		this.surQuestion = surQuestion;
	}
	public Date getSsmTime() {
		return ssmTime;
	}
	public void setSsmTime(Date ssmTime) {
		this.ssmTime = ssmTime;
	}
	public String getSsmDiv() {
		return ssmDiv;
	}
	public void setSsmDiv(String ssmDiv) {
		this.ssmDiv = ssmDiv;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	
}
