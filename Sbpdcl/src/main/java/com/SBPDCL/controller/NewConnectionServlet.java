package com.SBPDCL.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.SBPDCL.bean.LocationNameBean;
import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.services.NewConnectionService;
import com.SBPDCL.util.LocationNameUtil;

@WebServlet("/NewConnectionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
maxFileSize = 5 * 1024 * 1024,           // 5MB
maxRequestSize = 20 * 1024 * 1024)       // 20MB
public class NewConnectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // Directory to save uploaded files
    private static final String UPLOAD_DIR = "uploads";

    public NewConnectionServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // When "Back to Edit" is clicked, redirect to the form page
        RequestDispatcher dispatcher = request.getRequestDispatcher("form.html");
        dispatcher.forward(request, response);
    }

    @SuppressWarnings("unused")
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Fetch form data
    	 // Get file save path
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        String app_id = "APP" + System.currentTimeMillis();
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
        String village = request.getParameter("village_ward");
        String division = request.getParameter("division");
        String subDivision = request.getParameter("subdivision");
        String section = request.getParameter("section");
        String tariff = request.getParameter("tariff");
        String phase = request.getParameter("E_phase");
        String load = request.getParameter("E_load");
        String gender = request.getParameter("gender");
        String applicantName = request.getParameter("applicantName");
        String f_hName = request.getParameter("f_hName");
        String idProof = request.getParameter("idProof");
        String addressProof = request.getParameter("addressProof");

        // Step 2: Populate NewConnectionRequest object
        NewConnectionRequest formData = new NewConnectionRequest();
        formData.setApp_id(app_id);
        formData.setConnectionType(connectionType);
        formData.setConsumerId(consumerId);
        formData.setMobile(mobile);
        formData.setEmail(email);
        formData.setHouseNo(houseNo);
        formData.setStreet(street);
        formData.setAddressLine1(addressLine1);
        formData.setAddressLine2(addressLine2);
        formData.setAddressLine3(addressLine3);
        formData.setCity(city);
        formData.setPincode(pincode);
        formData.setDistrict(district);
        formData.setBlock(block);
        formData.setPanchayat(panchayat);
        formData.setVillage(village);
        formData.setDivision(division);
        formData.setSubDivision(subDivision);
        formData.setSection(section);
        formData.setTariff(tariff);
        formData.setPhase(phase);
        formData.setLoad(load);
        formData.setGender(gender);
        formData.setApplicantName(applicantName);
        formData.setF_hName(f_hName);
        formData.setIdProof(idProof);
        formData.setAddressProof(addressProof);
        
     // Step 2: Handle file uploads
        formData.setIdProofFile(saveFile(request.getPart("documentFile"), uploadPath));
        formData.setAddressProofFront(saveFile(request.getPart("frontPage"), uploadPath));
        formData.setAddressProofLast(saveFile(request.getPart("lastPage"), uploadPath));
        formData.setPhoto(saveFile(request.getPart("photo"), uploadPath));
        formData.setOwnershipFirst(saveFile(request.getPart("photoOwnerFirst"), uploadPath));
        formData.setOwnershipSecond(saveFile(request.getPart("photoOwnerSecond"), uploadPath));
       
        System.out.println("Received form data for Consumer ID: " + consumerId);

        Enumeration<String> params = request.getParameterNames();
        while (params.hasMoreElements()) {
            String name = params.nextElement();
            System.out.println("Param: " + name + " = " + request.getParameter(name));
        }


        // Step 3: Save form data temporarily (optional - for preview)
        NewConnectionService service = new NewConnectionService();
        try {
            boolean isInserted = service.processNewConnection(formData);
            System.out.println("Inserted status: " + isInserted);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Step 4: Fetch location names
        LocationNameBean locationNames = LocationNameUtil.getLocationNames(formData);
       
        request.setAttribute("formData", formData);  
        request.setAttribute("locationNames", locationNames); 
        RequestDispatcher rd = request.getRequestDispatcher("preview.jsp");  
        rd.forward(request, response);
        System.out.println("Form Data: " + formData);
        System.out.println("Location Names: " + locationNames);

    }
    // Helper method to save file and return relative path
    private String saveFile(Part part, String uploadPath) throws IOException {
        if (part != null && part.getSize() > 0) {
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;
            part.write(filePath);
            return "uploads/" + fileName;
        }
        return null;
    }
}