package com.SBPDCL.services;

import com.SBPDCL.DAO.LocationDAO;
import com.SBPDCL.bean.*;

import java.sql.SQLException;
import java.util.*;

public class LocationService {

    LocationDAO dao = new LocationDAO();

    public List<District> getAllDistricts() throws Exception {
        return dao.getAllDistricts();
    }

    public List<Block> getBlocksByDistrict(int districtId) throws Exception {
        return dao.getBlocksByDistrict(districtId);
    }

    public List<Panchayat> getPanchayatsByBlock(int blockId) throws Exception {
        return dao.getPanchayatsByBlock(blockId);
    }

    public List<VillageWard> getVillagesByPanchayat(int panchayatId) throws Exception {
        return dao.getVillagesByPanchayat(panchayatId);
    }

    public DivisionHierarchy getDivisionHierarchyByVillageId(int villageId) throws Exception {
        return dao.getDivisionHierarchyByVillageId(villageId);
    }


}
