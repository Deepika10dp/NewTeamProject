package com.SBPDCL.services;

import com.SBPDCL.DAO.LocationDAO;
import com.SBPDCL.bean.*;

import java.util.List;

public class LocationService {

    LocationDAO dao = new LocationDAO();

    // Fetch all districts
    public List<District> getAllDistricts() throws Exception {
        return dao.getAllDistricts();
    }

    // Fetch blocks by district
    public List<Block> getBlocksByDistrict(int districtId) throws Exception {
        return dao.getBlocksByDistrict(districtId);
    }

    // Fetch panchayats by block
    public List<Panchayat> getPanchayatsByBlock(int blockId) throws Exception {
        return dao.getPanchayatsByBlock(blockId);
    }

    // Fetch villages by panchayat
    public List<VillageWard> getVillagesByPanchayat(int panchayatId) throws Exception {
        return dao.getVillagesByPanchayat(panchayatId);
    }

    // Fetch division and subdivision hierarchy by village ID
    public DivisionHierarchy getDivisionHierarchyByVillageId(int villageId) throws Exception {
        return dao.getDivisionHierarchyByVillageId(villageId);
    }

    // Fetch all location names by IDs
    public LocationNameBean getAllLocationNames(int districtId, int blockId, int panchayatId, int villageId, int divisionId, int subDivisionId, int sectionId) {
        return dao.getLocationNames(districtId, blockId, panchayatId, villageId, divisionId, subDivisionId, sectionId);
    }
    public String getSectionNameById(String sectionId) {
        return dao.getSectionNameById(sectionId);
    }
}
