package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FilenameUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import net.sf.json.JSONObject;

import com.bo.EmployeeBO;
import com.bo.NewsBO;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.NewsDTO;
import com.dto.SkillsDTO;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;
import com.util.CommonUtils;

import org.apache.commons.lang.StringUtils;

@Path("/empService")
public class Service {
	EmployeeDTO dto = new EmployeeDTO();

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/setEmpDetails")
	public JSONObject setEmpDetails(@Context HttpServletRequest request,
			@QueryParam("Name") String Name,
			@QueryParam("Gender") String Gender,
			@QueryParam("Blood") String Blood,
			@QueryParam("empSkills") String empSkills,
			@QueryParam("Address") String Address) {
		JSONObject jobj1 = new JSONObject();
 System.out.println("hyddd....1.......Name==="+Name);
		String result = "fail";
		HttpSession session = request.getSession();
		String photoPath = (String) session.getAttribute("uploadPath");
		System.out.println("hyddd....11.......photoPath==="+photoPath);
		photoPath = photoPath.replace("/", "\\");
		System.out.println("hyddd....12.......photoPath==="+photoPath);
		String empId = (String) session.getAttribute("empId");
		System.out.println("hyddd....2.......empId==="+empId);
		System.out.println("hyddd....3.......empId==="+empId);
		EmployeeBO bo = new EmployeeBO();
		EmployeeDTO empDto = new EmployeeDTO();
		empDto.setEmpName(Name);
		empDto.setEmpGender(Gender);
		empDto.setEmpGroupId(Blood);
		empDto.setEmpAddress(Address);
		empDto.setEmpId(empId);
		empDto.setPhotoPath(photoPath);
		empDto.setEmpSkills(empSkills);
		System.out.println("Doc path-->" + empSkills);
		try {
			result = bo.setUserDetails(empDto);
			System.out.println("result........."+result);
			if (!"fail".equals(result)) {
				jobj1.put("Msg", result);
			} else {
				jobj1.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jobj1);
		return jobj1;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateEmpDetails")
	public JSONObject updateEmpDetails(@Context HttpServletRequest request,
			@QueryParam("Name") String Name,
			@QueryParam("Gender") String Gender,
			@QueryParam("Blood") String Blood,
			@QueryParam("empSkills") String empSkills,
			@QueryParam("Address") String Address,
			@QueryParam("empId") String empId) {
		JSONObject jobj1 = new JSONObject();

		String result = "fail";
		HttpSession session = request.getSession();
		String photoPath = (String) session.getAttribute("uploadPath");
		photoPath = photoPath.replace("/", "\\");
		EmployeeBO bo = new EmployeeBO();
		EmployeeDTO empDto = new EmployeeDTO();
		empDto.setEmpName(Name);
		empDto.setEmpGender(Gender);
		empDto.setEmpGroupId(Blood);
		empDto.setEmpAddress(Address);
		empDto.setEmpId(empId);
		empDto.setPhotoPath(photoPath);
		empDto.setEmpSkills(empSkills);
		System.out.println("Doc path-->" + empSkills);
		try {
			result = bo.updateUserDetails(empDto);
			if (!"fail".equals(result)) {
				jobj1.put("Msg", result);
			} else {
				jobj1.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jobj1);
		return jobj1;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEmpDetails")
	public JSONObject getEmpDetails() {
		JSONObject jobj1 = new JSONObject();
		JSONObject jobj2 = new JSONObject();
		EmployeeBO bo = new EmployeeBO();
		ArrayList<EmployeeDTO> empList = new ArrayList<EmployeeDTO>();
		try {
			System.out.println("*****Called getEmpDetails**********");
			empList = bo.getEmpDetails();
			System.out.println("****empList.size=="+empList.size());
			System.out.println("arraylist--->" + empList.toString());
			if (!(empList.size() < 0)) {
				jobj1.put("EmpDetails", empList);
			} else {
				jobj1.put("EmpDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jobj1);
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteEmpDetails")
	public JSONObject deleteEmpDetails(@QueryParam("empId") String empId) {
		JSONObject jobj1 = new JSONObject();
		JSONObject jobj2 = new JSONObject();
		EmployeeBO bo = new EmployeeBO();
		EmployeeDTO dto = new EmployeeDTO();
		dto.setEmpId(empId);
		String result = "fail";
		try {
			result = bo.deleteEmpDetails(dto);
			jobj1.put("EmpDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}

	// TO EDIT EMPLOYEE DETAILS
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editEmpDetails")
	public JSONObject editEmpDetails(@QueryParam("empId") String empId) {
		JSONObject jobj1 = new JSONObject();
		JSONObject jobj2 = new JSONObject();
		EmployeeBO bo = new EmployeeBO();
		ArrayList<EmployeeDTO> dto = new ArrayList<EmployeeDTO>();
		ArrayList<SkillsDTO> skillDTO = new ArrayList<SkillsDTO>();
		String result = "fail";
		try {
			dto = bo.getEmpDetailsById(empId);
			skillDTO = bo.getSkillDetailsById(empId);
			jobj1.put("EmpDetails", dto);
			jobj1.put("EmpSkillDetails", skillDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("edit jobj-->" + jobj1);
		return jobj1;

	}

	// To get Blood groups
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getBloodGroups")
	public JSONObject getBloodGroups() {
		JSONObject jobj1 = new JSONObject();
		EmployeeBO bo = new EmployeeBO();
		ArrayList<BloodGroupDTO> groupList = new ArrayList<BloodGroupDTO>();
		try {
			groupList = bo.getBloodGroups();
			System.out.println("arraylist--->" + groupList.toString());
			if (!"failed".equals(groupList)) {
				jobj1.put("BloodGroup", groupList);
			} else {
				jobj1.put("BloodGroup", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jobj1);
		return jobj1;
	}

	// To get Skills
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getSkillsDetails")
	public JSONObject getSkills() {
		JSONObject jobj1 = new JSONObject();
		EmployeeBO bo = new EmployeeBO();
		ArrayList<SkillsDTO> skillsList = new ArrayList<SkillsDTO>();
		try {
			skillsList = bo.getSkills();
			System.out.println("arraylist--->" + skillsList.toString());
			if (!"failed".equals(skillsList)) {
				jobj1.put("Skills", skillsList);
			} else {
				jobj1.put("BloodGroup", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jobj1);
		return jobj1;
	}

	// TO UPLOAD FILE
	@POST
	@Path("/upload")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public void uploadFile(@Context HttpServletRequest request,
			@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail) {
		//final String UPLOAD_FOLDER = "E:/Sharath/WS/USGFA/WebContent/images/"; 
		final String UPLOAD_FOLDER = "D:/work/USGFA/WebContent/html/uploads/"; 
		// check if all form parameters are provided
		if (uploadedInputStream == null || fileDetail == null)
			// return Response.status(400).entity("Invalid form data").build();
			// create our destination folder, if it not exists
			try {
				createFolderIfNotExists(UPLOAD_FOLDER);
			} catch (SecurityException se) {
				// return
				// Response.status(500).entity("Can not create destination folder on server").build();
			}
		try {
			UUID uuid = UUID.randomUUID();
			String empId = uuid.toString();
			System.out.println("file ex-->"
					+ FilenameUtils.getExtension(fileDetail.getFileName()));
			String uploadedFileLocation = UPLOAD_FOLDER + empId + "."
					+ FilenameUtils.getExtension(fileDetail.getFileName());
			saveToFile(uploadedInputStream, uploadedFileLocation);
			HttpSession session = request.getSession();
			System.out.println("uploc -->" + uploadedFileLocation);
			session.setAttribute("uploadPath", uploadedFileLocation);
			session.setAttribute("empId", empId);
		} catch (IOException e) {
			// return Response.status(500).entity("Can not save file").build();
		}
		// return Response.status(200).entity("File saved to " +
		// uploadedFileLocation).build();

	}

	/**
	 * Utility method to save InputStream data to target location/file
	 * 
	 * @param inStream
	 *            - InputStream to be saved
	 * @param target
	 *            - full path to destination file
	 */
	private void saveToFile(InputStream inStream, String target)
			throws IOException {
		OutputStream out = null;
		int read = 0;
		byte[] bytes = new byte[1024];
		out = new FileOutputStream(new File(target));
		while ((read = inStream.read(bytes)) != -1) {
			out.write(bytes, 0, read);
		}
		out.flush();
		out.close();
	}

	/**
	 * Creates a folder to desired location if it not already exists
	 * 
	 * @param dirName
	 *            - full path to the folder
	 * @throws SecurityException
	 *             - in case you don't have permission to create the folder
	 */
	private void createFolderIfNotExists(String dirName)
			throws SecurityException {
		File theDir = new File(dirName);
		if (!theDir.exists()) {
			theDir.mkdir();
		}
	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNews")
	public JSONObject addNews(@Context HttpServletRequest request, @QueryParam("newsId") String newsId,
			@QueryParam("newsTitle") String newsTitle, @QueryParam("date") String date,
			@QueryParam("paper") String paper, @QueryParam("link") String link, @QueryParam("moreInfo") String moreInfo) {
		JSONObject jObj = new JSONObject();
		String result = "fail";

		System.out.println("1.a In addNews---------- newsTitle===" + newsTitle);
		System.out.println("1.b In addNews---------- paper===" + paper);
		System.out.println("1.d In addNews---------- date===" + date);

		try {
			if (StringUtils.isNotEmpty(newsTitle)) {
				
				NewsDTO newsDto = new NewsDTO();
				String sId = CommonUtils.getAutoGenId();
				String sUpdtedOn = CommonUtils.getDate();
				
				System.out.println("1.e In addNews---------- sId===" + sId);
				System.out.println("1.f In addNews---------- sUpdtedOn===" + sUpdtedOn);
				
				newsDto.setNewsId(sId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);
				
				NewsBO bo = new NewsBO();
				result = bo.addNewsDetails(newsDto);
			}
			System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jObj);
		return jObj;
	}

}
