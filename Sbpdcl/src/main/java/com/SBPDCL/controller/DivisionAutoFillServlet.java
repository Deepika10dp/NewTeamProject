package com.SBPDCL.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.SBPDCL.bean.Block;
import com.SBPDCL.bean.District;
import com.SBPDCL.bean.DivisionHierarchy;
import com.SBPDCL.bean.Panchayat;
import com.SBPDCL.bean.VillageWard;
import com.SBPDCL.services.LocationService;
import com.google.gson.Gson;
@WebServlet("/DivisionAutoFillServlet")
public class DivisionAutoFillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      public DivisionAutoFillServlet() {
    	    super();
    	    System.out.println("DivisionAutoFillServlet loaded!");
    	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");        
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        LocationService locationService = new LocationService();
        String action = request.getParameter("action");
        try {
         
            switch (action) {
                case "getDistricts":
                    List<District> districts = locationService.getAllDistricts();
                    out.print(gson.toJson(districts));
                    break;

                case "getBlocks":
                    int districtId = Integer.parseInt(request.getParameter("districtId"));
                    List<Block> blocks = locationService.getBlocksByDistrict(districtId);
                    out.print(gson.toJson(blocks));
                    break;

                case "getPanchayats":
                    int blockId = Integer.parseInt(request.getParameter("blockId"));
                    List<Panchayat> panchayats = locationService.getPanchayatsByBlock(blockId);
                    out.print(gson.toJson(panchayats));
                    break;

                case "getVillages":
                    int panchayatId = Integer.parseInt(request.getParameter("panchayatId"));
                    List<VillageWard> villages = locationService.getVillagesByPanchayat(panchayatId);
                    out.print(gson.toJson(villages));
                    System.out.println("getVillage called");
                    break;

                case "getHierarchy":
                    int villageId = Integer.parseInt(request.getParameter("villageId"));
                    DivisionHierarchy hierarchy = locationService.getDivisionHierarchyByVillageId(villageId);
                    out.print(gson.toJson(hierarchy));
                    System.out.println("getHierarchy called");
                    break;

                default:
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print("{\"error\":\"Invalid action parameter\"}");
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\":\"Exception occurred\"}");
        } finally {
            out.flush();
        }
	}	
}
