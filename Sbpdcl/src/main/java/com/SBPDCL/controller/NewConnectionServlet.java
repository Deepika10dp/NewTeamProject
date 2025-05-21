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

    // Define permanent upload directory outside server deploy folder
    private static final String PERMANENT_UPLOAD_DIR = "C:\\SBPDCLUploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Use permanent folder for uploads
        String uploadPath = PERMANENT_UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

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

        // Save uploaded files with app ID prefix into permanent directory
        formData.setIdProofFile(saveFile(request.getPart("documentFile"), uploadPath, app_id + "_idProof"));
        formData.setAddressProofFront(saveFile(request.getPart("frontPage"), uploadPath, app_id + "_frontPage"));
        formData.setAddressProofLast(saveFile(request.getPart("lastPage"), uploadPath, app_id + "_lastPage"));
        formData.setPhoto(saveFile(request.getPart("photo"), uploadPath, app_id + "_photo"));
        formData.setOwnershipFirst(saveFile(request.getPart("photoOwnerFirst"), uploadPath, app_id + "_owner1"));
        formData.setOwnershipSecond(saveFile(request.getPart("photoOwnerSecond"), uploadPath, app_id + "_owner2"));

        // Store form data in session (for back/edit flow)
        HttpSession session = request.getSession();
        session.setAttribute("formData", formData);

        // Fetch location names (assuming LocationNameUtil.getLocationNames is implemented)
        LocationNameBean locationNames = LocationNameUtil.getLocationNames(formData);

        request.setAttribute("formData", formData);
        request.setAttribute("locationNames", locationNames);
        request.getRequestDispatcher("preview.jsp").forward(request, response);
    }

    private String saveFile(Part part, String uploadPath, String prefix) throws IOException {
        if (part != null && part.getSize() > 0) {
            String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String extension = "";
            int dotIndex = originalFileName.lastIndexOf('.');
            if (dotIndex > 0) {
                extension = originalFileName.substring(dotIndex);
            }
            String fileName = prefix + extension;
            String fullPath = uploadPath + File.separator + fileName;

            System.out.println("Saving file to: " + fullPath);
            part.write(fullPath);

            // Store only fileName (not full path) to use in image URL later
            return fileName;
        }
        return null;
    }

}
