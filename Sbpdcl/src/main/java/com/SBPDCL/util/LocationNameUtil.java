package com.SBPDCL.util;

import com.SBPDCL.DAO.LocationDAO;
import com.SBPDCL.bean.LocationNameBean;
import com.SBPDCL.bean.NewConnectionRequest;

public class LocationNameUtil {

    public static LocationNameBean getLocationNames(NewConnectionRequest formData) {
        LocationNameBean nameBean = new LocationNameBean();
        try {
            // Ensure form data is not null
            if (formData != null) {
                // Convert String IDs to int IDs
                int districtId = (formData.getDistrict() != null && !formData.getDistrict().isEmpty()) ? Integer.parseInt(formData.getDistrict()) : 0;
                int blockId = (formData.getBlock() != null && !formData.getBlock().isEmpty()) ? Integer.parseInt(formData.getBlock()) : 0;
                int panchayatId = (formData.getPanchayat() != null && !formData.getPanchayat().isEmpty()) ? Integer.parseInt(formData.getPanchayat()) : 0;
                int villageId = (formData.getVillage() != null && !formData.getVillage().isEmpty()) ? Integer.parseInt(formData.getVillage()) : 0;
                int divisionId = (formData.getDivision() != null && !formData.getDivision().isEmpty()) ? Integer.parseInt(formData.getDivision()) : 0;
                int subDivisionId = (formData.getSubDivision() != null && !formData.getSubDivision().isEmpty()) ? Integer.parseInt(formData.getSubDivision()) : 0;
                int sectionId = (formData.getSection() != null && !formData.getSection().isEmpty()) ? Integer.parseInt(formData.getSection()) : 0;
                // Print for debugging
                System.out.println("IDs received from formData:");
                System.out.println("District ID: " + districtId);
                System.out.println("Block ID: " + blockId);
                System.out.println("Panchayat ID: " + panchayatId);
                System.out.println("Village ID: " + villageId);
                System.out.println("Division ID: " + divisionId);
                System.out.println("SubDivision ID: " + subDivisionId);
                System.out.println("Section ID: " + sectionId);
                
                // Instantiate LocationDAO
                LocationDAO dao = new LocationDAO();
                nameBean = dao.getLocationNames(
                    districtId, blockId, panchayatId, villageId, divisionId, subDivisionId, sectionId
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return nameBean;
    }
   
	
}
