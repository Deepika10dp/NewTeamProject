package com.SBPDCL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SBPDCL.DAO.NewConnectionDAO;

import com.SBPDCL.bean.NewConnectionRequest;

@WebServlet("/NewConnectionServlet")
public class NewConnectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public NewConnectionServlet(){
    	super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String app_id="APP" + System.currentTimeMillis();
        String connectionType = request.getParameter("connectionType");
        String consumerId = request.getParameter("consumerId");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String houseNo = request.getParameter("houseNo");
        String street = request.getParameter("street");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String addressLine3 = request.getParameter("addressLine3");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String district = request.getParameter("district");
        String block = request.getParameter("block");
        String panchayat = request.getParameter("panchayat");
        String village = request.getParameter("village");
        String division = request.getParameter("division");
        String subDivision = request.getParameter("subDivision");
        String section = request.getParameter("section");
        String tariff = request.getParameter("tariff");
        String phase = request.getParameter("E_phase");
        String load = request.getParameter("E_load");
        String gender = request.getParameter("gender");
        String applicantName = request.getParameter("applicantName");
        String f_hName = request.getParameter("f_hName");
        String idProof = request.getParameter("idProof");
        String addressProof = request.getParameter("addressProof");
        
        NewConnectionRequest rq = new NewConnectionRequest();
        rq.setApp_id(app_id);
        rq.setConnectionType(connectionType);
        rq.setConsumerId(consumerId);
        rq.setMobile(mobile);
        rq.setEmail(email);
        rq.setHouseNo(houseNo);
        rq.setStreet(street);
        rq.setAddressLine1(addressLine1);
        rq.setAddressLine2(addressLine2);
        rq.setAddressLine3(addressLine3);
        rq.setCity(city);
        rq.setPincode(pincode);
        rq.setDistrict(district);
        rq.setBlock(block);
        rq.setPanchayat(panchayat);
        rq.setVillage(village);
        rq.setDivision(division);
        rq.setSubDivision(subDivision);
        rq.setSection(section);
        rq.setTariff(tariff);
        rq.setPhase(phase);
        rq.setLoad(load);
        rq.setGender(gender);
        rq.setApplicantName(applicantName);
        rq.setF_hName(f_hName);
        rq.setIdProof(idProof);
        rq.setAddressProof(addressProof);
        
        
        System.out.println(rq);
        
        NewConnectionDAO dao=new  NewConnectionDAO();
        try {
			dao.processNewConnection(rq);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
        response.sendRedirect("app.html");
        
        /*boolean isInserted = service.processNewConnection(rq);
        
        if (isInserted) {
            response.getWriter().write("Success: New Connection Request Submitted");
        } else {
            response.getWriter().write("Error: Unable to process request");
        }*/
    }
}
