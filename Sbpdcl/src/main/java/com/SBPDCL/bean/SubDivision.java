package com.SBPDCL.bean;
public class SubDivision {
    private int id;
    private String name;
    private int divisionId;
    public SubDivision() {}
    public SubDivision(int id, String name, int divisionId) {
        this.id = id;
        this.name = name;
        this.divisionId = divisionId;
    }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDivisionId() {
		return divisionId;
	}
	public void setDivisionId(int divisionId) {
		this.divisionId = divisionId;
	}
	@Override
	public String toString() {
		return "SubDivision [id=" + id + ", name=" + name + ", divisionId=" + divisionId + "]";
	}
}
