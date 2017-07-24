package com.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.EventFileBO;
import com.bo.FarmFileBO;
import com.bo.MemberFileBO;
import com.bo.NewsBO;
import com.bo.NewsFileBO;
import com.bo.ProgramFileBO;
import com.bo.StoriesFileBO;
import com.bo.UploadFileBO;
import com.dto.EventFileDTO;
import com.dto.FarmFileDTO;
import com.dto.MemberFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;
import com.sun.security.ntlm.Server;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/uploadService")
public class UploadFileService {

	
	
	@SuppressWarnings("null")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteImage")
	public JSONObject deleteImage(@QueryParam("fileId") String fileId, @QueryParam("type") String sType,
			@Context HttpServletRequest request) {
		String result = "fail";
		String path = "";
		//path = request.getServletContext().getRealPath("/");
		
		JSONObject jObj = new JSONObject();
		NewsFileBO newsFileBo = null;
		ProgramFileBO programFileBo = null;
		StoriesFileBO storiesFileBo = null;
		EventFileBO eventFileBo = null;
		MemberFileBO memberFileBo = null;
		FarmFileBO farmFileBo = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;
		try {
			path = request.getServletContext().getRealPath("/");
			newsFileBo = new NewsFileBO();
			programFileBo = new ProgramFileBO();
			storiesFileBo = new StoriesFileBO();
			eventFileBo = new EventFileBO();
			memberFileBo = new MemberFileBO();
			farmFileBo = new FarmFileBO();
			if (StringUtils.isNotEmpty(sType) && sType.equals("NEWS")) {
				lstLatestUploadFiles = newsFileBo.deleteFileNews(fileId, path);
				jObj.put("NEWSFILES", lstLatestUploadFiles);
				result = "success";
			}if(sType.equals("PROGRAM")){
				if(StringUtils.isNotEmpty(sType) && sType.equals("PROGRAM")){
					lstLatestUploadFiles = programFileBo.deleteFileProgram(fileId, path);
					jObj.put("PROGRAMFILES",lstLatestUploadFiles);
					result = "success";
				}
			}else if(StringUtils.isNotEmpty(sType) && sType.equals("STORIES")){
				lstLatestUploadFiles = storiesFileBo.deleteFileStories(fileId, path);
				jObj.put("STORIESFILES",lstLatestUploadFiles);
				result = "success";
			}
			else if(StringUtils.isNotEmpty(sType) && sType.equals("EVENT")){
				lstLatestUploadFiles = eventFileBo.deleteFileEvent(fileId, path);
				jObj.put("EVENTFILES",lstLatestUploadFiles);
				result = "success";
			}else if(StringUtils.isNotEmpty(sType) && sType.equals("MEMBER")){
				lstLatestUploadFiles = memberFileBo.deleteFileMember(fileId, path);
				jObj.put("MEMBERFILES",lstLatestUploadFiles);
				result = "success";
			}else if(StringUtils.isNotEmpty(sType) && sType.equals("FARM")){
				lstLatestUploadFiles = farmFileBo.deleteFileFarm(fileId, path);
				jObj.put("FARMFILES",lstLatestUploadFiles);
				result = "success";
			}

			jObj.put("Msg", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;

	}

	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateShowAsPublic")
	public JSONObject updateShowAsPublic(@QueryParam("fileId") String fileId,
			@QueryParam("showAsPublic") String showAsPublic, @QueryParam("type") String sType) {

		JSONObject jObj = new JSONObject();
		NewsFileDTO newsFileDto = null;
		NewsFileBO newsFileBo = null;
		StoriesFileDTO storiesFileDto = null;
		StoriesFileBO storiesFileBo = null;
		EventFileBO eventFileBo = null;
		EventFileDTO eventFileDto = null;
		ProgramFileDTO programFileDto = null;
		ProgramFileBO programFileBo = null;
		MemberFileDTO memberFileDto = null;
		MemberFileBO memberFileBo = null;
		FarmFileDTO farmFileDto = null;
		FarmFileBO farmFileBo = null;
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		String result = "fail";
		try {
			UploadFileDTO uploadFileDTO = new UploadFileDTO();
			uploadFileDTO.setFileId(fileId);
			uploadFileDTO.setShowPublic(showAsPublic);

			UploadFileBO fileBo = new UploadFileBO();
			fileBo.updateShowAsPublic(uploadFileDTO);

			if (StringUtils.isNotEmpty(sType) && sType.equals("NEWS")) {
				newsFileDto = new NewsFileDTO();
				newsFileDto.setFileId(fileId);

				newsFileBo = new NewsFileBO();
				lstUploadFileDTO = newsFileBo.getNewsFilesByFileId(newsFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("NEWSFILES", lstUploadFileDTO);
					result = "success";
				}
			}else if (StringUtils.isNotEmpty(sType) && sType.equals("STORIES")) {
				storiesFileDto = new StoriesFileDTO();
				storiesFileDto.setFileId(fileId);

				storiesFileBo = new StoriesFileBO();
				lstUploadFileDTO = storiesFileBo.getStoriesFilesByFileId(storiesFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("STORIESFILES", lstUploadFileDTO);
					result = "success";
				}
			}
			else if (StringUtils.isNotEmpty(sType) && sType.equals("EVENT")) {
				eventFileDto = new EventFileDTO();
				eventFileDto.setFileId(fileId);

				eventFileBo = new EventFileBO();
				lstUploadFileDTO = eventFileBo.getEventFilesByFileId(eventFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("EVENTFILES", lstUploadFileDTO);
					result = "success";
				}
			}else if (StringUtils.isNotEmpty(sType) && sType.equals("PROGRAM")) {
				programFileDto = new ProgramFileDTO();
				programFileDto.setFileId(fileId);

				programFileBo = new ProgramFileBO();
				lstUploadFileDTO = programFileBo.getProgramFilesByFileId(programFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("PROGRAMFILES", lstUploadFileDTO);
					result = "success";
				}
			}else if (StringUtils.isNotEmpty(sType) && sType.equals("MEMBER")) {
				memberFileDto = new MemberFileDTO();
				memberFileDto.setFileId(fileId);

				memberFileBo = new MemberFileBO();
				lstUploadFileDTO = memberFileBo.getMemberFilesByFileId(memberFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("MEMBERFILES", lstUploadFileDTO);
					result = "success";
				}
			}else if (StringUtils.isNotEmpty(sType) && sType.equals("FARM")) {
				farmFileDto = new FarmFileDTO();
				farmFileDto.setFileId(fileId);

				farmFileBo = new FarmFileBO();
				lstUploadFileDTO = farmFileBo.getFarmFilesByFileId(farmFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("FARMFILES", lstUploadFileDTO);
					result = "success";
				}
			}
			jObj.put("Msg", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPublicImagesHome")
	public JSONObject getPublicImagesHome(){
		
		JSONObject jobj1 = new JSONObject();
		UploadFileDTO uploadFileDTO = new UploadFileDTO();
		UploadFileBO fileBo = new UploadFileBO();
		
		ArrayList<UploadFileDTO> uploadList = new ArrayList<UploadFileDTO>();
		try{
			uploadList = fileBo.getPublicImagesHome(uploadFileDTO);
			if(uploadList != null && uploadList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("getPublicImages", uploadList);
			}else {
				jobj1.put("getPublicImages", "failed");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobj1;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getPublicVideosHome")
	public JSONObject getPublicVideosHome(){
		
		JSONObject jobj1 = new JSONObject();
		UploadFileDTO uploadFileDTO = new UploadFileDTO();
		UploadFileBO fileBo = new UploadFileBO();
		
		ArrayList<UploadFileDTO> uploadList = new ArrayList<UploadFileDTO>();
		try{
			uploadList = fileBo.getPublicVideosHome(uploadFileDTO);
			if(uploadList != null && uploadList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("getPublicVideos", uploadList);
			}else {
				jobj1.put("getPublicVideos", "failed");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobj1;
	}
}
