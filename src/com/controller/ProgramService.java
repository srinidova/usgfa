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

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addProgram")
	public JSONObject addProgram(@Context HttpServletRequest request, 
			@QueryParam("programId") String programId,
			@QueryParam("programName") String programName, 
			@QueryParam("duration") String duration,
			@QueryParam("dateAndTimeFrom") String dateAndTimeFrom, 
			@QueryParam("dateAndTimeTo") String dateAndTimeTo, 
			@QueryParam("channel") String channel,
			@QueryParam("guest") String guest,
			@QueryParam("youtube") String youtube,
			@QueryParam("moreInfo") String moreInfo) {
		//System.out.println("in to controller");
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";

		//System.out.println("1.a In addProgram---------- programName===" + programName);
		//System.out.println("1.b In addProgram---------- duration===" + duration);
		//System.out.println("1.d In addProgram---------- dateAndTimeFrom===" + dateAndTimeFrom);

		try {
			if (StringUtils.isNotEmpty(programName)) {
				ProgramDTO programDto = new ProgramDTO();
				String sId = CommonUtils.getAutoGenId();
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
				
				ProgramBO bo = new ProgramBO();
				result = bo.addProgram(programDto);
				
				HttpSession session = request.getSession();
				HashMap<String,String> hmImages = (HashMap<String,String>)session.getAttribute("UPLOADED_FILELIST");
				if(hmImages != null && hmImages.size() > 0){
					for(Map.Entry m:hmImages.entrySet()){
						String sFileId  = (String) m.getKey();
						String sFilePath  = (String) m.getValue();
						System.out.println("--------------sFileId---------"+sFileId);
						System.out.println("--------------sFilePath---------"+sFilePath);
						//System.out.println(m.getKey()+" "+m.getValue());
					
					// saving in to uploadFile Table
					UploadFileDTO uploadFileDto = new UploadFileDTO();
					uploadFileDto.setFileId(sFileId);
					uploadFileDto.setFilePath(sFilePath);
				    uploadFileDto.setUpdatedBy(CommonUtils.getDate());
				    
				    UploadFileBO filebo = new UploadFileBO();
				    resultFile = filebo.addUploadFileDetails(uploadFileDto);
				    System.out.println("resultFile===="+resultFile);
				    
				 // saving in to programFile Table
				    
				    ProgramFileDTO  programFileDto = new ProgramFileDTO();
				    programFileDto.setFileId(sFileId);
				    programFileDto.setProgramId(sId);
				    System.out.println("programFile---------"+sId);
				    ProgramFileBO programFileBo = new ProgramFileBO();
				    resultFile = programFileBo.programFile(programFileDto);
				    
				    System.out.println("resultFile===="+resultFile);
					}
				}
				
			}
			//System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("jobj-->" + jObj);
		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProgramDetails")
	public JSONObject getProgramDetails() {
		
		JSONObject jobj1 = new JSONObject();
		//JSONObject jobj2 = new JSONObject();
		
		ProgramBO bo= new ProgramBO();
		ArrayList<ProgramDTO> programList = new ArrayList<ProgramDTO>();
		
		
		try {
			//System.out.println("1. *****Called getProgramDetails**********");
			programList = bo.getProgramDetails();
			
			
			//System.out.println("****programList.size=="+programList.size());
			//System.out.println("arraylist--->" + programList.toString());
			if (!(programList.size() < 0)) {
				jobj1.put("ProgramDetails", programList);
			} else {
				jobj1.put("ProgramDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("jobj-->" + jobj1);
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProgramId")
	public JSONObject getProgramId(@QueryParam("programId") String programId, @Context HttpServletRequest request) {
		//System.out.println("1. *****Called getProgramId**********programId==" + programId);
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
		//System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getProgramProfile")
	public JSONObject getProgramProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String programId = (String) session.getAttribute("PROGRAMID");
		//System.out.println("1a. *****Called getProgramProfile**********programId==" + programId);
		ArrayList<ProgramDTO> programList = new ArrayList<ProgramDTO>();

		try {
			if (StringUtils.isNotEmpty(programId)) {
				
				ProgramDTO dto = new ProgramDTO();
				dto.setProgramId(programId);

				ProgramBO bo = new ProgramBO();
				programList = bo.getProgramProfile(dto);
				//NewsBO bo = new NewsBO();
				//newsList = bo.getNewsProfile(dto);

				//System.out.println("****programList.size==" + programList.size());
				//System.out.println("arraylist--->" + programList.toString());
				if (!(programList.size() < 0)) {
					jobj.put("ProgramProfile", programList);
				} else {
					jobj.put("ProgramProfile", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}	
	
	
	
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editProgram")
	public JSONObject editProgram(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String programId = (String) session.getAttribute("PROGRAMID");
		//System.out.println("1a. *****Called editProgram**********ProgramId==" + programId);
		ArrayList<ProgramDTO> programList = new ArrayList<ProgramDTO>();

		try {
			if (StringUtils.isNotEmpty(programId)) {

				ProgramDTO dto = new ProgramDTO();
				dto.setProgramId(programId);
				//dto.setProgramId(newsId);
				ProgramBO bo = new ProgramBO();
				programList = bo.getProgramProfile(dto);

				/*NewsBO bo = new NewsBO();
				programList = bo.getNewsProfile(dto);*/

				//System.out.println("****programList.size==" + programList.size());
				//System.out.println("arraylist--->" + programList.toString());
				if (!(programList.size() < 0)) {
					jobj.put("EditProgram", programList);
				} else {
					jobj.put("EditProgram", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("editProgram jobj-->" + jobj);
		return jobj;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteProgram")
	public JSONObject deleteProgram(@QueryParam("programId") String programId) {
		//System.out.println("1. *****Called deleteProgram**********programId=="+programId);
		JSONObject jobj1 = new JSONObject();
		ProgramBO bo = new ProgramBO();
		ProgramDTO dto = new ProgramDTO();
		dto.setProgramId(programId);
		
		String result = "fail";
		/*JSONObject jobj2 = new JSONObject();
		EmployeeBO bo = new EmployeeBO();
		EmployeeDTO dto = new EmployeeDTO();
		dto.setEmpId(empId);
		String result = "fail";*/
		try {
			result = bo.deleteProgram(dto);
			//result = bo.deleteNews(dto);
			//result = bo.deleteEmpDetails(dto);
			jobj1.put("ProgramDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}	

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/programUpdate")
	public JSONObject newsUpdate(@Context HttpServletRequest request, @QueryParam("programId") String programId,
			@QueryParam("programName") String programName, @QueryParam("duration") String duration,
			@QueryParam("dateAndTimeFrom") String dateAndTimeFrom, @QueryParam("dateAndTimeTo") String dateAndTimeTo,
			 @QueryParam("channel") String channel,
			 @QueryParam("guest") String guest,
			@QueryParam("moreInfo") String moreInfo) {
		JSONObject jObj = new JSONObject();
		String result = "fail";

		//System.out.println("1.a In programUpdate---------- programName===" + programName);
		//System.out.println("1.b In programUpdate---------- duration===" + duration);
		//System.out.println("1.d In programUpdate---------- channel===" + channel);
		//System.out.println("1.d In programUpdate---------- programId===" + programId);

		try {
			if (StringUtils.isNotEmpty(programName)) {
				
				ProgramDTO programDto = new ProgramDTO();
				String sUpdatedOn = CommonUtils.getDate();

				NewsDTO newsDto = new NewsDTO();
				// String sId = CommonUtils.getAutoGenId();
				//String sUpdtedOn = CommonUtils.getDate();

				// //System.out.println("1.e In addNews---------- sId===" + sId);
				////System.out.println("1.f In addNews---------- sUpdtedOn===" + sUpdtedOn);
				programDto.setProgramId(programId);
				programDto.setProgramName(programName);
				programDto.setDateAndTimeFrom(dateAndTimeFrom);
				programDto.setDateAndTimeTo(dateAndTimeTo);
				programDto.setChannel(channel);
				programDto.setGuest(guest);
				programDto.setMoreInfo(moreInfo);
				programDto.setUpdatedOn(sUpdatedOn);
				
				/*newsDto.setNewsId(newsId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);
				*/
				
				ProgramBO bo = new ProgramBO();
				//NewsBO bo = new NewsBO();
				//result = bo.newsUpdate(newsDto);
				result = bo .programUpdate(programDto);
			}
			//System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("jobj-->" + jObj);
		return jObj;
	}

}

