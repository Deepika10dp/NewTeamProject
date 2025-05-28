package com.SBPDCL.bean;
import java.sql.Date;
import java.sql.Timestamp;
public class NewConnectionRequest {
		 private String app_id;
		 private String connectionType;
		 private String consumerId;
		 private String mobile;
		 private String email;
		 private String houseNo;
		 private String street;
		 private String addressLine1;
		 private String addressLine2;
		 private String addressLine3;
		 private String city;
		 private String pincode;
		 private String district;
		 private String block;
		 private String panchayat;
		 private String village;
		 private String division;
		 private String subDivision;
		 private String section;
		 private String tariff;
		 private String phase;
		 private String load;
		 private String gender;
		 private String applicantName;
		 private String f_hName;
		 private String idProof;
		 private String addressProof;		 
		 private String idProofFile;
		 private String addressProofFront;
		 private String addressProofLast;
		 private String photo;
		 private String ownershipFirst;
		 private String ownershipSecond;		
		 private Timestamp submissionDate;
		 private String status;
		 private String currentStage;
		 private String jeeRemarks;
		 private String mi_remarks;
		 private String aeeRemarks;
		 private String inspectionStatus;		 
		 private String dues_cleared;
		 private String documents_verified;	
		public String getDues_cleared() {
			return dues_cleared;
		}
		public void setDues_cleared(String dues_cleared) {
			this.dues_cleared = dues_cleared;
		}
		public String getDocuments_verified() {
			return documents_verified;
		}
		public void setDocuments_verified(String documents_verified) {
			this.documents_verified = documents_verified;
		}
		public String getCurrentStage() {
			return currentStage;
		}
		public void setCurrentStage(String currentStage) {
			this.currentStage = currentStage;
		}
		public String getJeeRemarks() {
			return jeeRemarks;
		}
		public void setJeeRemarks(String jeeRemarks) {
			this.jeeRemarks = jeeRemarks;
		}
		public String getMi_remarks() {
			return mi_remarks;
		}
		public void setMi_remarks(String mi_remarks) {
			this.mi_remarks = mi_remarks;
		}
		public String getAeeRemarks() {
			return aeeRemarks;
		}
		public void setAeeRemarks(String aeeRemarks) {
			this.aeeRemarks = aeeRemarks;
		}		
		public String getApp_id() {
			return app_id;
		}
		public void setApp_id(String app_id) {
			this.app_id = app_id;
		}
		public String getAddressLine1() {
			return addressLine1;
		}
		public void setAddressLine1(String addressLine1) {
			this.addressLine1 = addressLine1;
		}
		public String getAddressLine2() {
			return addressLine2;
		}
		public void setAddressLine2(String addressLine2) {
			this.addressLine2 = addressLine2;
		}
		public String getAddressLine3() {
			return addressLine3;
		}
		public void setAddressLine3(String addressLine3) {
			this.addressLine3 = addressLine3;
		}
		public String getBlock() {
			return block;
		}
		public void setBlock(String block) {
			this.block = block;
		}
		public String getPanchayat() {
			return panchayat;
		}
		public void setPanchayat(String panchayat) {
			this.panchayat = panchayat;
		}
		public String getVillage() {
			return village;
		}
		public void setVillage(String village) {
			this.village = village;
		}
		public String getDivision() {
			return division;
		}
		public void setDivision(String division) {
			this.division = division;
		}
		public String getSubDivision() {
			return subDivision;
		}
		public void setSubDivision(String subDivision) {
			this.subDivision = subDivision;
		}
		public String getSection() {
			return section;
		}
		public void setSection(String section) {
			this.section = section;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getF_hName() {
			return f_hName;
		}
		public void setF_hName(String f_hName) {
			this.f_hName = f_hName;
		}
		public String getIdProof() {
			return idProof;
		}
		public void setIdProof(String idProof) {
			this.idProof = idProof;
		}
		public String getAddressProof() {
			return addressProof;
		}
		public void setAddressProof(String addressProof) {
			this.addressProof = addressProof;
		}
		public String getConnectionType() {
			return connectionType;
		}
		public void setConnectionType(String connectionType) {
			this.connectionType = connectionType;
		}
		public String getConsumerId() {
			return consumerId;
		}
		public void setConsumerId(String consumerId) {
			this.consumerId = consumerId;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getStreet() {
			return street;
		}
		public void setStreet(String street) {
			this.street = street;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getPincode() {
			return pincode;
		}
		public void setPincode(String pincode) {
			this.pincode = pincode;
		}
		public String getDistrict() {
			return district;
		}
		public void setDistrict(String district) {
			this.district = district;
		}
		public String getApplicantName() {
			return applicantName;
		}
		public void setApplicantName(String applicantName) {
			this.applicantName = applicantName;
		}
		public String getTariff() {
			return tariff;
		}
		public void setTariff(String tariff) {
			this.tariff = tariff;
		}
		public String getPhase() {
			return phase;
		}
		public void setPhase(String phase) {
			this.phase = phase;
		}
		public String getLoad() {
			return load;
		}
		public void setLoad(String load) {
			this.load = load;
		}
		public String getHouseNo() {
			return houseNo;
		}
		public void setHouseNo(String houseNo) {
			this.houseNo = houseNo;
		}
				 public String getIdProofFile() {
						return idProofFile;
					}
					public void setIdProofFile(String idProofFile) {
						this.idProofFile = idProofFile;
					}
					public String getAddressProofFront() {
						return addressProofFront;
					}
					public void setAddressProofFront(String addressProofFront) {
						this.addressProofFront = addressProofFront;
					}
					public String getAddressProofLast() {
						return addressProofLast;
					}
					public void setAddressProofLast(String addressProofLast) {
						this.addressProofLast = addressProofLast;
					}
					public String getPhoto() {
						return photo;
					}
					public void setPhoto(String photo) {
						this.photo = photo;
					}
					public String getOwnershipFirst() {
						return ownershipFirst;
					}
					public void setOwnershipFirst(String ownershipFirst) {
						this.ownershipFirst = ownershipFirst;
					}
					public String getOwnershipSecond() {
						return ownershipSecond;
					}
					public void setOwnershipSecond(String ownershipSecond) {
						this.ownershipSecond = ownershipSecond;
					}
					 public Timestamp getSubmissionDate() {
							return submissionDate;
						}
						public void setSubmissionDate(Timestamp timestamp) {
							this.submissionDate = timestamp;
						}
						public String getStatus() {
							return status;
						}
						public void setStatus(String status) {
							this.status = status;
						}
						
						public String getInspectionStatus() {
							return inspectionStatus;
						}
						public void setInspectionStatus(String inspectionStatus) {
							this.inspectionStatus = inspectionStatus;
						}
		@Override
		public String toString() {
			return "NewConnectionRequest [app_id=" + app_id + ", connectionType=" + connectionType + ", consumerId="
					+ consumerId + ", mobile=" + mobile + ", email=" + email + ", houseNo=" + houseNo + ", street="
					+ street + ", addressLine1=" + addressLine1 + ", addressLine2=" + addressLine2 + ", addressLine3="
					+ addressLine3 + ", city=" + city + ", pincode=" + pincode + ", district=" + district + ", block="
					+ block + ", panchayat=" + panchayat + ", village=" + village + ", division=" + division
					+ ", subDivision=" + subDivision + ", section=" + section + ", tariff=" + tariff + ", phase="
					+ phase + ", load=" + load + ", gender=" + gender + ", applicantName=" + applicantName
					+ ", f_hName=" + f_hName + ", idProof=" + idProof + ", addressProof=" + addressProof
					+ ", idProofFile=" + idProofFile + ", addressProofFront=" + addressProofFront
					+ ", addressProofLast=" + addressProofLast + ", photo=" + photo + ", ownershipFirst="
					+ ownershipFirst + ", ownershipSecond=" + ownershipSecond + ", submissionDate=" + submissionDate
					+ ", status=" + status + ", currentStage=" + currentStage + ", jeeRemarks=" + jeeRemarks
					+ ", mi_remarks=" + mi_remarks + ", aeeRemarks=" + aeeRemarks + ", inspectionStatus="
					+ inspectionStatus + ", dues_cleared=" + dues_cleared + ", documents_verified=" + documents_verified
					+ "]";
		}
		public void setSubmissionDate(Date date) {
			
		}		
}