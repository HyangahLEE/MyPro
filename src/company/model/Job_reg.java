package company.model;

import java.io.Serializable;
import java.util.Date;

public class Job_reg implements Serializable {
	
	private String jrid;
	private String jrfields;
	private String jrrespon; 
	private String jrworkplace; 
	private int jrsal;
	private String jrrequiredskill;
	private String jreducation;
	private String jrcareer; 
	private int jrrecruit;
	private String jrdeadline; 
	private String jretc;
	private String jrpreference;
	private String jrcondition; 
	private String jrapproval;
	private String jremptype; 
	private int cpnum;
	
	public Job_reg(String jrid, String jrfields, String jrrespon, String jrworkplace, int jrsal, String jrrequiredskill,
			String jreducation, String jrcareer, int jrrecruit, String jrdeadline, String jretc, String jrpreference,
			String jrcondition, String jrapproval, String jremptype, int cpnum) {
		super();
		this.jrid = jrid;
		this.jrfields = jrfields;
		this.jrrespon = jrrespon;
		this.jrworkplace = jrworkplace;
		this.jrsal = jrsal;
		this.jrrequiredskill = jrrequiredskill;
		this.jreducation = jreducation;
		this.jrcareer = jrcareer;
		this.jrrecruit = jrrecruit;
		this.jrdeadline = jrdeadline;
		this.jretc = jretc;
		this.jrpreference = jrpreference;
		this.jrcondition = jrcondition;
		this.jrapproval = jrapproval;
		this.jremptype = jremptype;
		this.cpnum = cpnum;
	}
	
	public Job_reg() {}

	public String getJrid() {
		return jrid;
	}
	public void setJrid(String jrid) {
		this.jrid = jrid;
	}
	public String getJrfields() {
		return jrfields;
	}
	public void setJrfields(String jrfields) {
		this.jrfields = jrfields;
	}
	public String getJrrespon() {
		return jrrespon;
	}
	public void setJrrespon(String jrrespon) {
		this.jrrespon = jrrespon;
	}
	public String getJrworkplace() {
		return jrworkplace;
	}
	public void setJrworkplace(String jrworkplace) {
		this.jrworkplace = jrworkplace;
	}
	public int getJrsal() {
		return jrsal;
	}
	public void setJrsal(int jrsal) {
		this.jrsal = jrsal;
	}
	public String getJrrequiredskill() {
		return jrrequiredskill;
	}
	public void setJrrequiredskill(String jrrequiredskill) {
		this.jrrequiredskill = jrrequiredskill;
	}
	public String getJreducation() {
		return jreducation;
	}
	public void setJreducation(String jreducation) {
		this.jreducation = jreducation;
	}
	public String getJrcareer() {
		return jrcareer;
	}
	public void setJrcareer(String jrcareer) {
		this.jrcareer = jrcareer;
	}
	public int getJrrecruit() {
		return jrrecruit;
	}
	public void setJrrecruit(int jrrecruit) {
		this.jrrecruit = jrrecruit;
	}
	public String getJrdeadline() {
		return jrdeadline;
	}
	public void setJrdeadline(String jrdeadline) {
		this.jrdeadline = jrdeadline;
	}
	public String getJretc() {
		return jretc;
	}
	public void setJretc(String jretc) {
		this.jretc = jretc;
	}
	public String getJrpreference() {
		return jrpreference;
	}
	public void setJrpreference(String jrpreference) {
		this.jrpreference = jrpreference;
	}
	public String getJrcondition() {
		return jrcondition;
	}
	public void setJrcondition(String jrcondition) {
		this.jrcondition = jrcondition;
	}
	public String getJrapproval() {
		return jrapproval;
	}
	public void setJrapproval(String jrapproval) {
		this.jrapproval = jrapproval;
	}
	public String getJremptype() {
		return jremptype;
	}
	public void setJremptype(String jremptype) {
		this.jremptype = jremptype;
	}
	public int getCpnum() {
		return cpnum;
	}
	public void setCpnum(int cpnum) {
		this.cpnum = cpnum;
	} 

}
