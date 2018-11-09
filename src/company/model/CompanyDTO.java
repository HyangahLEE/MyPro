package company.model;

import java.io.Serializable;

public class CompanyDTO implements Serializable {
	
	private int cpnum;     
	private String cpname;
	private String cphomepage; 
	private String cpestablished;
	private String cpceo;        
	private String cpaddr1;      
	private String cpaddr2;      
	private int cpempnum;        
	private String cpsector;     
	private String cpetc;        
	private String cpbusinessarea;
	private String cpannual;      
	private String cpscale;       
	private int cpzipcode;        
	private String cpcontactname; 
	private String cpcontactposition;
	private String cpcontacttel;     
	private String cpcontactemail;   
	private String cptel;            
	private String cpfax;
	
	public CompanyDTO(int cpnum, String cpname, String cphomepage, String cpestablished, String cpceo, String cpaddr1,
			String cpaddr2, int cpempnum, String cpsector, String cpetc, String cpbusinessarea, String cpannual,
			String cpscale, int cpzipcode, String cpcontactname, String cpcontactposition, String cpcontacttel,
			String cpcontactemail, String cptel, String cpfax) {
		super();
		this.cpnum = cpnum;
		this.cpname = cpname;
		this.cphomepage = cphomepage;
		this.cpestablished = cpestablished;
		this.cpceo = cpceo;
		this.cpaddr1 = cpaddr1;
		this.cpaddr2 = cpaddr2;
		this.cpempnum = cpempnum;
		this.cpsector = cpsector;
		this.cpetc = cpetc;
		this.cpbusinessarea = cpbusinessarea;
		this.cpannual = cpannual;
		this.cpscale = cpscale;
		this.cpzipcode = cpzipcode;
		this.cpcontactname = cpcontactname;
		this.cpcontactposition = cpcontactposition;
		this.cpcontacttel = cpcontacttel;
		this.cpcontactemail = cpcontactemail;
		this.cptel = cptel;
		this.cpfax = cpfax;
	}
	
	public CompanyDTO() {}

	public int getCpnum() {
		return cpnum;
	}
	public void setCpnum(int cpnum) {
		this.cpnum = cpnum;
	}
	public String getCpname() {
		return cpname;
	}
	public void setCpname(String cpname) {
		this.cpname = cpname;
	}
	public String getCphomepage() {
		return cphomepage;
	}
	public void setCphomepage(String cphomepage) {
		this.cphomepage = cphomepage;
	}
	public String getCpestablished() {
		return cpestablished;
	}
	public void setCpestablished(String cpestablished) {
		this.cpestablished = cpestablished;
	}
	public String getCpceo() {
		return cpceo;
	}
	public void setCpceo(String cpceo) {
		this.cpceo = cpceo;
	}
	public String getCpaddr1() {
		return cpaddr1;
	}
	public void setCpaddr1(String cpaddr1) {
		this.cpaddr1 = cpaddr1;
	}
	public String getCpaddr2() {
		return cpaddr2;
	}
	public void setCpaddr2(String cpaddr2) {
		this.cpaddr2 = cpaddr2;
	}
	public int getCpempnum() {
		return cpempnum;
	}
	public void setCpempnum(int cpempnum) {
		this.cpempnum = cpempnum;
	}
	public String getCpsector() {
		return cpsector;
	}
	public void setCpsector(String cpsector) {
		this.cpsector = cpsector;
	}
	public String getCpetc() {
		return cpetc;
	}
	public void setCpetc(String cpetc) {
		this.cpetc = cpetc;
	}
	public String getCpbusinessarea() {
		return cpbusinessarea;
	}
	public void setCpbusinessarea(String cpbusinessarea) {
		this.cpbusinessarea = cpbusinessarea;
	}
	public String getCpannual() {
		return cpannual;
	}
	public void setCpannual(String cpannual) {
		this.cpannual = cpannual;
	}
	public String getCpscale() {
		return cpscale;
	}
	public void setCpscale(String cpscale) {
		this.cpscale = cpscale;
	}
	public int getCpzipcode() {
		return cpzipcode;
	}
	public void setCpzipcode(int cpzipcode) {
		this.cpzipcode = cpzipcode;
	}
	public String getCpcontactname() {
		return cpcontactname;
	}
	public void setCpcontactname(String cpcontactname) {
		this.cpcontactname = cpcontactname;
	}
	public String getCpcontactposition() {
		return cpcontactposition;
	}
	public void setCpcontactposition(String cpcontactposition) {
		this.cpcontactposition = cpcontactposition;
	}
	public String getCpcontacttel() {
		return cpcontacttel;
	}
	public void setCpcontacttel(String cpcontacttel) {
		this.cpcontacttel = cpcontacttel;
	}
	public String getCpcontactemail() {
		return cpcontactemail;
	}
	public void setCpcontactemail(String cpcontactemail) {
		this.cpcontactemail = cpcontactemail;
	}
	public String getCptel() {
		return cptel;
	}
	public void setCptel(String cptel) {
		this.cptel = cptel;
	}
	public String getCpfax() {
		return cpfax;
	}
	public void setCpfax(String cpfax) {
		this.cpfax = cpfax;
	}

	// 값이 담겼는지 확인
	@Override
	public String toString() {
		return "CompanyDTO [cpnum=" + cpnum + ", cpname=" + cpname + ", cphomepage=" + cphomepage + ", cpestablished="
				+ cpestablished + ", cpceo=" + cpceo + ", cpaddr1=" + cpaddr1 + ", cpaddr2=" + cpaddr2 + ", cpempnum="
				+ cpempnum + ", cpsector=" + cpsector + ", cpetc=" + cpetc + ", cpbusinessarea=" + cpbusinessarea
				+ ", cpannual=" + cpannual + ", cpscale=" + cpscale + ", cpzipcode=" + cpzipcode + ", cpcontactname="
				+ cpcontactname + ", cpcontactposition=" + cpcontactposition + ", cpcontacttel=" + cpcontacttel
				+ ", cpcontactemail=" + cpcontactemail + ", cptel=" + cptel + ", cpfax=" + cpfax + "]";
	}

}
