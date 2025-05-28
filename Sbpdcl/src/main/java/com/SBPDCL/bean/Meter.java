package com.SBPDCL.bean;
import java.sql.Date;
public class Meter {	
	 private String meter_id;
	 private String app_id;
	 private String meter_type;
	 private String meter_capacity;
	 private Date installation_date;
	 private String inspector_name;
	 private Date inspection_date;
	 private String address;
	 private String site_status;
	 private String confirmation_status; 
	public String getMeter_id() {
		return meter_id;
	}
	public void setMeter_id(String meter_id) {
		this.meter_id = meter_id;
	}
	public String getApp_id() {
		return app_id;
	}
	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}
	public String getMeter_type() {
		return meter_type;
	}
	public void setMeter_type(String meter_type) {
		this.meter_type = meter_type;
	}
	public String getMeter_capacity() {
		return meter_capacity;
	}
	public void setMeter_capacity(String meter_capacity) {
		this.meter_capacity = meter_capacity;
	}
	public Date getInstallation_date() {
		return installation_date;
	}
	public void setInstallation_date(Date installation_date) {
		this.installation_date = installation_date;
	}
	
	public String getInspector_name() {
		return inspector_name;
	}
	public void setInspector_name(String inspector_name) {
		this.inspector_name = inspector_name;
	}
	public Date getInspection_date() {
		return inspection_date;
	}
	public void setInspection_date(Date inspection_date) {
		this.inspection_date = inspection_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSite_status() {
		return site_status;
	}
	public void setSite_status(String site_status) {
		this.site_status = site_status;
	}
	public String getConfirmation_status() {
		return confirmation_status;
	}
	public void setConfirmation_status(String confirmation_status) {
		this.confirmation_status = confirmation_status;
	}
	@Override
	public String toString() {
		return "Meter [meter_id=" + meter_id + ", app_id=" + app_id + ", meter_type=" + meter_type + ", meter_capacity="
				+ meter_capacity + ", installation_date=" + installation_date + ", inspector_name=" + inspector_name
				+ ", inspection_date=" + inspection_date + ", address=" + address + ", site_status=" + site_status
				+ ", confirmation_status=" + confirmation_status + "]";
	}
}
