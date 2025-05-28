package com.SBPDCL.bean;
public class VillageWard {
    private int id;
    private String name;
    private int panchayatId;
    private int sectionId;
    public VillageWard() {}
    public VillageWard(int id, String name, int panchayatId, int sectionId) {
        this.id = id;
        this.name = name;
        this.panchayatId = panchayatId;
        this.sectionId = sectionId;
    }
	public VillageWard(int int1, String string, int int2) {
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
    public int getPanchayatId() {
        return panchayatId;
    }
    public void setPanchayatId(int panchayatId) {
        this.panchayatId = panchayatId;
    }
    public int getSectionId() {
        return sectionId;
    }
    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }
}
