package com.SBPDCL.DAO;

import java.sql.*;
import java.util.*;

import com.SBPDCL.bean.*;
import com.SBPDCL.util.DBConnection;

public class LocationDAO {

    public List<District> getAllDistricts() throws Exception {
        List<District> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM district");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            District d = new District();
            d.setId(rs.getInt("id"));
            d.setName(rs.getString("name"));
            list.add(d);
        }
        return list;
    }

    public List<Block> getBlocksByDistrict(int districtId) throws Exception {
        List<Block> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM block WHERE district_id=?");
        ps.setInt(1, districtId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Block b = new Block();
            b.setId(rs.getInt("id"));
            b.setName(rs.getString("name"));
            b.setDistrictId(rs.getInt("district_id"));
            list.add(b);
        }
        return list;
    }

    public List<Panchayat> getPanchayatsByBlock(int blockId) throws Exception {
        List<Panchayat> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM panchayat WHERE block_id=?");
        ps.setInt(1, blockId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Panchayat p = new Panchayat();
            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setBlockId(rs.getInt("block_id"));
            list.add(p);
        }
        return list;
    }

    public List<VillageWard> getVillagesByPanchayat(int panchayatId) throws Exception {
        List<VillageWard> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM village_ward WHERE panchayat_id=?");
        ps.setInt(1, panchayatId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            VillageWard v = new VillageWard();
            v.setId(rs.getInt("id"));
            v.setName(rs.getString("name"));
            v.setPanchayatId(rs.getInt("panchayat_id"));
            v.setSectionId(rs.getInt("section_id"));
            list.add(v);
        }
        return list;
    }

    public DivisionHierarchy getDivisionHierarchyByVillageId(int villageId) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT d.id AS division_id, d.name AS divisionName, " +
            "sd.id AS subdivision_id, sd.name AS subdivisionName, " +
            "s.id AS section_id, s.name AS sectionName " +
            "FROM village_ward v " +
            "JOIN section s ON v.section_id = s.id " +
            "JOIN sub_division sd ON s.sub_division_id = sd.id " +
            "JOIN division d ON sd.division_id = d.id " +
            "WHERE v.id = ?");
        ps.setInt(1, villageId);
        ResultSet rs = ps.executeQuery();
        DivisionHierarchy dh = null;
        if (rs.next()) {
            Division d = new Division();
            d.setId(rs.getInt("division_id"));
            d.setName(rs.getString("divisionName"));

            SubDivision sd = new SubDivision();
            sd.setId(rs.getInt("subdivision_id"));
            sd.setName(rs.getString("subdivisionName"));
            sd.setDivisionId(rs.getInt("division_id"));

            Section s = new Section();
            s.setId(rs.getInt("section_id"));
            s.setName(rs.getString("sectionName"));
            s.setSubDivisionId(rs.getInt("subdivision_id"));

            dh = new DivisionHierarchy();
            dh.setDivision(d);
            dh.setSubdivision(sd);
            dh.setSection(s);
        }
        return dh;
    }
    // Helper method to fetch name by ID
    private static String getNameById(Connection conn, String tableName, int id) {
        String name = "";
        String query = "SELECT name FROM " + tableName + " WHERE id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            System.out.println("Executing Query: " + query + " with ID = " + id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    name = rs.getString("name");
                    System.out.println("Fetched from " + tableName + ": " + name);
                } else {
                    System.out.println("No record found in table '" + tableName + "' for ID: " + id);
                }
            }
        } catch (Exception e) {
            System.out.println("Error fetching name from " + tableName + " for ID: " + id);
            e.printStackTrace();
        }

        return name;
    }


    // Fetch location names based on IDs
    public LocationNameBean getLocationNames(int districtId, int blockId, int panchayatId, int villageId, int divisionId, int subDivisionId, int sectionId) {
        LocationNameBean bean = new LocationNameBean();

        try (Connection conn = DBConnection.getConnection()) {
            bean.setDistrictName(getNameById(conn, "district", districtId));
            bean.setBlockName(getNameById(conn, "block", blockId));
            bean.setPanchayatName(getNameById(conn, "panchayat", panchayatId));
            bean.setVillageName(getNameById(conn, "village_ward", villageId));
            bean.setDivisionName(getNameById(conn, "division", divisionId));
            bean.setSubDivisionName(getNameById(conn, "sub_division", subDivisionId));
            bean.setSectionName(getNameById(conn, "section", sectionId));
            System.out.println("Village ID: " + villageId + ", Name: " + getNameById(conn, "village_ward", villageId));

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return bean;
    }
}
