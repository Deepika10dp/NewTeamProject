package com.SBPDCL.bean;
public class DuesInfo {		
		private String consumerId;
		private String moblie;
	    private String dues_amount;
	    private String dues_status;	    
	    public String getConsumerId() {
			return consumerId;
		}
		public void setConsumerId(String consumerId) {
			this.consumerId = consumerId;
		}
		public String getMoblie() {
			return moblie;
		}
		public void setMoblie(String moblie) {
			this.moblie = moblie;
		}
		public String getDues_amount() {
			return dues_amount;
		}
		public void setDues_amount(String string) {
			this.dues_amount = string;
		}
		public String getDues_status() {
			return dues_status;
		}
		public void setDues_status(String dues_status) {
			this.dues_status = dues_status;
		}
		@Override
		public String toString() {
			return "DuesInfo [consumerId=" + consumerId + ", moblie=" + moblie + ", dues_amount=" + dues_amount
					+ ", dues_status=" + dues_status + "]";
		}		
}