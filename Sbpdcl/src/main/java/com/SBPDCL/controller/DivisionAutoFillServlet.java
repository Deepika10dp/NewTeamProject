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

/**
 * Servlet implementation class DivisionAutoFillServlet
 */
@WebServlet("/DivisionAutoFillServlet")
public class DivisionAutoFillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    //  LocationService locationService=new LocationService();
    /**
     * @see HttpServlet#HttpServlet()
     */
      public DivisionAutoFillServlet() {
    	    super();
    	    System.out.println("DivisionAutoFillServlet loaded!");
    	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("DivisionAutoFillServlet is hit");
	/*  System.out.println("DivisionAutoFillServlet is hit");

	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");

	        PrintWriter out = response.getWriter();
	        Gson gson = new Gson();

	        try {
	            String action = request.getParameter("action");

	            if (action == null) {
	                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	                out.print("{\"error\":\"Missing action parameter\"}");
	                return;
	            }

	            LocationService locationService = new LocationService();

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
	                    break;

	                case "getHierarchy":
	                    int villageId = Integer.parseInt(request.getParameter("villageId"));
	                    DivisionHierarchy hierarchy = locationService.getDivisionHierarchyByVillageId(villageId);
	                    out.print(gson.toJson(hierarchy));
	                    break;

	                default:
	                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	                    out.print("{\"error\":\"Invalid action parameter\"}");
	                    break;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            if (!response.isCommitted()) {
	                response.resetBuffer(); // Important to prevent mixed response
	                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	                out.print("{\"error\":\"Exception occurred\"}");
	            }
	        } finally {
	            out.flush();
	        }*/
	    }
		//response.getWriter().append("Served at: ").append(request.getContextPath());

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       // System.out.println("DivisionAutoFillServlet is hit");

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
		//doGet(request, response);
	}
	

}
