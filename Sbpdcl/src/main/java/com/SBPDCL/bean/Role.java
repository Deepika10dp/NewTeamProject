package com.SBPDCL.bean;

public class Role {
	 private int id;
	 private String roleName;

	 public int getId() { 
		 return id; 
	 }
	 public void setId(int id) {
		 this.id = id;
     }
	 public String getRoleName() {
		 return roleName; 
	 }
	 @Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + "]";
	}
	public void setRoleName(String roleName) {
	    	this.roleName = roleName; 
	 }
}