package student.model;

public class Member02DTO {

   private String memberid;   
   private String mname;
   private String mpwd;
   private String memail;
   private String mbirth;
   private String mgender;
   private int mzipcode;
   private String maddr1;
   private String member_div;
   private String mphone;
   private String mtel;
   private String rgname;
   private int rgnumber;
   
   public Member02DTO() {};
   
   public Member02DTO(String memberid, String mname, String mpwd, String memail, String mbirth, String mgender,
         int mzipcode, String maddr1, String member_div, String mphone, String mtel) {
      super();
      this.memberid = memberid;
      this.mname = mname;
      this.mpwd = mpwd;
      this.memail = memail;
      this.mbirth = mbirth;
      this.mgender = mgender;
      this.mzipcode = mzipcode;
      this.maddr1 = maddr1;
      this.member_div = member_div;
      this.mphone = mphone;
      this.mtel = mtel;
   }

   public String getMemberid() {
      return memberid;
   }

   public void setMemberid(String memberid) {
      this.memberid = memberid;
   }

   public String getMname() {
      return mname;
   }

   public void setMname(String mname) {
      this.mname = mname;
   }

   public String getMpwd() {
      return mpwd;
   }

   public void setMpwd(String mpwd) {
      this.mpwd = mpwd;
   }

   public String getMemail() {
      return memail;
   }

   public void setMemail(String memail) {
      this.memail = memail;
   }

   public String getMbirth() {
      return mbirth;
   }

   public void setMbirth(String mbirth) {
      this.mbirth = mbirth;
   }



   public String getMgender() {
    return mgender;
}

public void setMgender(String mgender) {
    this.mgender = mgender;
}

public int getMzipcode() {
      return mzipcode;
   }

   public void setMzipcode(int mzipcode) {
      this.mzipcode = mzipcode;
   }

   public String getMaddr1() {
      return maddr1;
   }

   public void setMaddr1(String maddr1) {
      this.maddr1 = maddr1;
   }

   public String getMember_div() {
      return member_div;
   }

   public void setMember_div(String member_div) {
      this.member_div = member_div;
   }

   public String getMphone() {
      return mphone;
   }

   public void setMphone(String mphone) {
      this.mphone = mphone;
   }

   public String getMtel() {
      return mtel;
   }

   public void setMtel(String mtel) {
      this.mtel = mtel;
   }

   public String getRgname() {
      return rgname;
   }

   public void setRgname(String rgname) {
      this.rgname = rgname;
   }

   public int getRgnumber() {
      return rgnumber;
   }

   public void setRgnumber(int rgnumber) {
      this.rgnumber = rgnumber;
   }
   
   
   
}