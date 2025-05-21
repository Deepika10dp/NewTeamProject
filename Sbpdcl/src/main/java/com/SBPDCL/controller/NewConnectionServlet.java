package com.SBPDCL.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.SBPDCL.bean.LocationNameBean;
import com.SBPDCL.bean.NewConnectionRequest;
import com.SBPDCL.util.LocationNameUtil;

@WebServlet("/NewConnectionServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 20 * 1024 * 1024)
public class NewConnectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();


        String app_id = "APP" + System.currentTimeMillis();

        // Collect form data
        NewConnectionRequest formData = new NewConnectionRequest();
        formData.setApp_id(app_id);
        formData.setConnectionType(request.getParameter("connectionType"));
        formData.setConsumerId(request.getParameter("consumerId"));
        formData.setMobile(request.getParameter("mobile"));
        formData.setEmail(request.getParameter("email"));
        formData.setHouseNo(request.getParameter("houseNo"));
        formData.setStreet(request.getParameter("street"));
        formData.setAddressLine1(request.getParameter("addressLine1"));
        formData.setAddressLine2(request.getParameter("addressLine2"));
        formData.setAddressLine3(request.getParameter("addressLine3"));
        formData.setCity(request.getParameter("city"));
        formData.setPincode(request.getParameter("pincode"));
        formData.setDistrict(request.getParameter("district"));
        formData.setBlock(request.getParameter("block"));
        formData.setPanchayat(request.getParameter("panchayat"));
        formData.setVillage(request.getParameter("village_ward"));
        formData.setDivision(request.getParameter("division"));
        formData.setSubDivision(request.getParameter("subdivision"));
        formData.setSection(request.getParameter("section"));
        formData.setTariff(request.getParameter("tariff"));
        formData.setPhase(request.getParameter("E_phase"));
        formData.setLoad(request.getParameter("E_load"));
        formData.setGender(request.getParameter("gender"));
        formData.setApplicantName(request.getParameter("applicantName"));
        formData.setF_hName(request.getParameter("f_hName"));
        formData.setIdProof(request.getParameter("idProof"));
        formData.setAddressProof(request.getParameter("addressProof"));

        // Save uploaded files
        formData.setIdProofFile(saveFile(request.getPart("documentFile"), uploadPath));
        formData.setAddressProofFront(saveFile(request.getPart("frontPage"), uploadPath));
        formData.setAddressProofLast(saveFile(request.getPart("lastPage"), uploadPath));
        formData.setPhoto(saveFile(request.getPart("photo"), uploadPath));
        formData.setOwnershipFirst(saveFile(request.getPart("photoOwnerFirst"), uploadPath));
        formData.setOwnershipSecond(saveFile(request.getPart("photoOwnerSecond"), uploadPath));
        System.out.println("Upload Path: " + uploadPath);

        // Store data in session (for back/edit flow)
        HttpSession session = request.getSession();
        session.setAttribute("formData", formData);

        // Fetch location names
        LocationNameBean locationNames = LocationNameUtil.getLocationNames(formData);

        request.setAttribute("formData", formData);
        request.setAttribute("locationNames", locationNames);
        request.getRequestDispatcher("preview.jsp").forward(request, response);
    }

    private String saveFile(Part part, String uploadPath) throws IOException {
        try {
            if (part != null && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String filePath = uploadPath + File.separator + fileName;
                System.out.println("Saving to: " + filePath);
                part.write(filePath);
                return "uploads/" + fileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
