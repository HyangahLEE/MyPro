package notice.model;
import java.util.Date;

public class NoticeDTO {
		private int nnum; 
		private String ntitle;
		private Date nwritedt;
		private int nreaded;
		private String ncontent;
		private String mgid;		
		private String pass;
		private String email;
		private int ref;
		private int step;
		private int depth;
		
		
		
		
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public int getStep() {
			return step;
		}
		public void setStep(int step) {
			this.step = step;
		}
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public int getNnum() {
			return nnum;
		}
		public void setNnum(int nnum) {
			this.nnum = nnum;
		}		
		
		public String getNtitle() {
			return ntitle;
		}
		public void setNtitle(String ntitle) {
			this.ntitle = ntitle;
		}
		public Date getNwritedt() {
			return nwritedt;
		}
		public void setNwritedt(Date nwritedt) {
			this.nwritedt = nwritedt;
		}
		public int getNreaded() {
			return nreaded;
		}
		public void setNreaded(int nreaded) {
			this.nreaded = nreaded;
		}
		public String getNcontent() {
			return ncontent;
		}
		public void setNcontent(String ncontent) {
			this.ncontent = ncontent;
		}
		public String getMgid() {
			return mgid;
		}
		public void setMgid(String mgid) {
			this.mgid = mgid;
		}
}
