package ceo.model;
import java.util.Date;

public class CeoDTO {
		private int ceoid; 
		private String ceotitle;
		private Date ceowritedt;
		private int ceoreadcnt;
		private String ceocontent;
		private String ceo;		
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
		public int getCeoid() {
			return ceoid;
		}
		public void setCeoid(int ceoid) {
			this.ceoid = ceoid;
		}
		public String getCeotitle() {
			return ceotitle;
		}
		public void setCeotitle(String ceotitle) {
			this.ceotitle = ceotitle;
		}
		public Date getCeowritedt() {
			return ceowritedt;
		}
		public void setCeowritedt(Date ceowritedt) {
			this.ceowritedt = ceowritedt;
		}
		public int getCeoreadcnt() {
			return ceoreadcnt;
		}
		public void setCeoreadcnt(int ceoreadcnt) {
			this.ceoreadcnt = ceoreadcnt;
		}
		public String getCeocontent() {
			return ceocontent;
		}
		public void setCeocontent(String ceocontent) {
			this.ceocontent = ceocontent;
		}
		public String getCeo() {
			return ceo;
		}
		public void setCeo(String ceo) {
			this.ceo = ceo;
		}
		
}
