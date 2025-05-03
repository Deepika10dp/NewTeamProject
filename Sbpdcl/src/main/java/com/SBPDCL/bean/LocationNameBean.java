package com.SBPDCL.bean;

public class LocationNameBean {
    private String districtName;
    private String blockName;
    private String panchayatName;
    private String villageName;
    private String divisionName;
    private String subDivisionName;
    private String sectionName;

    // Getter and setter methods
    public String getDistrictName() {
        return districtName;
    }
    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }
    public String getBlockName() {
        return blockName;
    }
    public void setBlockName(String blockName) {
        this.blockName = blockName;
    }
    public String getPanchayatName() {
        return panchayatName;
    }
    public void setPanchayatName(String panchayatName) {
        this.panchayatName = panchayatName;
    }
    public String getVillageName() {
        return villageName;
    }
    public void setVillageName(String villageName) {
        this.villageName = villageName;
    }
    public String getDivisionName() {
        return divisionName;
    }
    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }
    public String getSubDivisionName() {
        return subDivisionName;
    }
    public void setSubDivisionName(String subDivisionName) {
        this.subDivisionName = subDivisionName;
    }
    public String getSectionName() {
        return sectionName;
    }
    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    @Override
    public String toString() {
        return "LocationNameBean [districtName=" + districtName + ", blockName=" + blockName + ", panchayatName="
                + panchayatName + ", villageName=" + villageName + ", divisionName=" + divisionName
                + ", subDivisionName=" + subDivisionName + ", sectionName=" + sectionName + "]";
    }
}
