package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
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
import com.bo.NewsFileBO;
import com.bo.ProgramBO;
import com.bo.ProgramFileBO;
import com.bo.UploadFileBO;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramDTO;
import com.dto.ProgramFileDTO;
import com.dto.SkillsDTO;
import com.dto.UploadFileDTO;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;
import com.util.CommonUtils;

import org.apache.commons.lang.StringUtils;

@Path("/programService")
public class ProgramService {

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addProgram")
	public JSONObject addProgram(@Context HttpServletRequest request, 
			@FormDataParam("programId") String programId,
			@FormDataParam("programName") String programName, 
			@FormDataParam("duration") String duration,
			@FormDataParam("dateAndTimeFrom") String dateAndTimeFrom, 
			@FormDataParam("dateAndTimeTo") String dateAndTimeTo, 
			@FormDataParam("channel") String channel,
			@FormDataParam("guest") String guest,
			@FormDataParam("youtube") String youtube,
			@FormDataParam("moreInfo") String moreInfo,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String sId = null;
		String sLoginId = "";

		try {
			if (StringUtils.isNotEmpty(programName)) {
				

				CommonUtils utils = new CommonUtils();
				String path = "";
				//System.out.println( request.getServletContext().getRealPath("/"));
				path = request.getServletContext().getRealPath("/") + "images/uploads/";
				utils.uploadFileToLocation(info, in, request, path);
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				
				ProgramDTO programDto = new ProgramDTO();
				sId = CommonUtils.getAutoGenId();
				programDto.setProgramId(sId);
				programDto.setProgramName(programName);
				programDto.setDuration(duration);
				programDto.setDateAndTimeFrom(dateAndTimeFrom);
				programDto.setDateAndTimeTo(dateAndTimeTo);
				programDto.setChannel(channel);
				programDto.setGuest(guest);
				programDto.setYoutube(youtube);
				programDto.setMoreInfo(moreInfo);
				programDto.setUpdatedOn(CommonUtils.getDate());
				programDto.setUpdatedBy(sLoginId);
				
				ProgramBO bo = new ProgramBO();
				result = bo.addProgram(programDto);
				
				
				
			}
			if (!"fail".equals(result)) {
				CommonUtils.saveFileData(request, sId, "PROGRAM");
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProgramDetails")
	public JSONObject getProgramDetails() {
		
		JSONObject jobj1 = new JSONObject();
		
		ProgramBO bo= new ProgramBO();
		ArrayList<ProgramDTO> programList = new ArrayList<ProgramDTO>();
		
		
		try {
			programList = bo.getProgramDetails();
			
			
			if (!(programList.size() < 0)) {
				jobj1.put("ProgramDetails", programList);
			} else {
				jobj1.put("ProgramDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProgramId")
	public JSONObject getProgramId(@QueryParam("programId") String programId, @Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(programId.length() < 0)) {
				session.setAttribute("PROGRAMID", programId);
			} else {
				jobj.put("PROGRAMID", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProgramProfile")
	public JSONObject getProgramProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String programId = (String) session.getAttribute("PROGRAMID");
		ArrayList<ProgramDTO> programList = new ArrayList<ProgramDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(programId)) {
				
				ProgramDTO dto = new ProgramDTO();
				dto.setProgramId(programId);

				ProgramBO bo = new ProgramBO();
				programList = bo.getProgramProfile(dto);
				if (!(programList.size() < 0)) {
					jobj.put("ProgramProfile", programList);
				} else {
					jobj.put("ProgramProfile", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//Get Program Images
		
		ProgramFileDTO programFileDto = new ProgramFileDTO();
		programFileDto.setProgramId(programId);
		ProgramFileBO programFileBo = new ProgramFileBO();
		lstUploadFileDTO = programFileBo.getProgramImages(programFileDto);
		if(lstUploadFileDTO != null && lstUploadFileDTO.size() > 0){
			jobj.put("PROGRAMFILES", lstUploadFileDTO);
		}
		return jobj;

	}	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editProgram")
	public JSONObject editProgram(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String programId = (String) session.getAttribute("PROGRAMID");
		ArrayList<ProgramDTO> programList = new ArrayList<ProgramDTO>();
		String resultFile = "fail";
		String resultFileProgram = "fail";
		String resultFileEdit = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			if (StringUtils.isNotEmpty(programId)) {

				ProgramDTO dto = new ProgramDTO();
				dto.setProgramId(programId);
				
				ProgramBO bo = new ProgramBO();
				programList = bo.getProgramProfile(dto);


				HttpSession session1 = request.getSession();
				HashMap<String,String> hmImages = (HashMap<String,String>)session1.getAttribute("UPLOADED_FILELIST");
				if(hmImages != null && hmImages.size() > 0){
					for(Map.Entry m:hmImages.entrySet()){
						String sFileId  = (String) m.getKey();
						String sFilePath  = (String) m.getValue();
					
					// saving in to uploadFile Table
					UploadFileDTO uploadFileDto = new UploadFileDTO();
					uploadFileDto.setFileId(sFileId);
					uploadFileDto.setFilePath(sFilePath);
				    uploadFileDto.setUpdatedBy(CommonUtils.getDate());
				    
				    UploadFileBO filebo = new UploadFileBO();
				    resultFile = filebo.addUploadFileDetails(uploadFileDto);
				    
				 // saving in to programFile Table
				    
				    ProgramFileDTO  programFileDto = new ProgramFileDTO();
				    programFileDto.setFileId(sFileId);
				    programFileDto.setProgramId(programId);
				    ProgramFileBO programFileBo = new ProgramFileBO();
				    resultFileEdit = programFileBo.programFile(programFileDto);
				    
					}
				}
				if (!(programList.size() < 0)) {
					jobj.put("EditProgram", programList);
					
					ProgramFileDTO programFileDto = new ProgramFileDTO();
					programFileDto.setProgramId(programId);
					ProgramFileBO programFileBo = new ProgramFileBO();
					lstUploadFileDTO = programFileBo.getProgramImages(programFileDto);
					if(lstUploadFileDTO != null && lstUploadFileDTO.size() > 0){
						jobj.put("PROGRAMFILES", lstUploadFileDTO);
					}
				} else {
					jobj.put("EditProgram", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteProgram")
	public JSONObject deleteProgram(@QueryParam("programId") String programId) {
		JSONObject jobj1 = new JSONObject();
		ProgramBO bo = new ProgramBO();
		ProgramDTO dto = new ProgramDTO();
		dto.setProgramId(programId);
		
		String result = "fail";
		try {
			result = bo.deleteProgram(dto);
			jobj1.put("ProgramDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}	

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/programUpdate")
	public JSONObject programUpdate(@Context HttpServletRequest request, 
			@FormDataParam("programId") String programId,
			@FormDataParam("programName") String programName, 
			@FormDataParam("duration") String duration,
			@FormDataParam("dateAndTimeFrom") String dateAndTimeFrom, 
			@FormDataParam("dateAndTimeTo") String dateAndTimeTo,
			@FormDataParam("channel") String channel,
			@FormDataParam("guest") String guest,
			@FormDataParam("youtube") String youtube,
			@FormDataParam("moreInfo") String moreInfo,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sLoginId = "";


		try {
			if (StringUtils.isNotEmpty(programName)) {
				
				CommonUtils utils = new CommonUtils();
				String path = "";
				//System.out.println( request.getServletContext().getRealPath("/"));
				path = request.getServletContext().getRealPath("/") + "images/uploads/";
				utils.uploadFileToLocation(info, in, request, path);
				
				ProgramDTO programDto = new ProgramDTO();
				String sUpdatedOn = CommonUtils.getDate();
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}


				programDto.setProgramId(programId);
				programDto.setProgramName(programName);
				programDto.setDuration(duration);
				programDto.setDateAndTimeFrom(dateAndTimeFrom);
				programDto.setDateAndTimeTo(dateAndTimeTo);
				programDto.setChannel(channel);
				programDto.setYoutube(youtube);
				programDto.setGuest(guest);
				programDto.setMoreInfo(moreInfo);
				programDto.setUpdatedOn(sUpdatedOn);
				programDto.setUpdatedBy(sLoginId);
				
				ProgramBO bo = new ProgramBO();
				
				result = bo .programUpdate(programDto);
				CommonUtils.saveFileData(request, programId, "PROGRAM");
			}
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}

}

