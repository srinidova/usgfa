package com.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import org.apache.commons.lang.StringUtils;

import com.bo.EventBO;
import com.bo.NewsBO;
import com.bo.ProgramBO;
import com.bo.ProgramFileBO;
import com.bo.StoriesBO;
import com.bo.StoriesFileBO;
import com.bo.UploadFileBO;
import com.dto.EventDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.ProgramFileDTO;
import com.dto.StoriesDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;
import com.sun.jersey.multipart.FormDataParam;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/storiesService")
public class StoriesService {

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addStories")
	public JSONObject addStories(@Context HttpServletRequest request, @FormDataParam("storiesId") String storiesId,
			@FormDataParam("title") String title, @FormDataParam("name") String name,
			@FormDataParam("profession") String profession, @FormDataParam("farmName") String farmName,
			@FormDataParam("farmAddress") String farmAddress, @FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal, @FormDataParam("district") String district,
			@FormDataParam("farmState") String farmState, @FormDataParam("farmPinCode") String farmPinCode,
			@FormDataParam("aboutFarm") String aboutFarm,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,FormDataMultiPart multiPart) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String sId = null;
		String sLoginId = "";
		CommonUtils utils = new CommonUtils();
		try {
			
			//List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
			if (StringUtils.isNotEmpty(title)) {
				//utils.processFileUpload(bodyParts,request );
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				
				StoriesDTO storiesDto = new StoriesDTO();
				sId = CommonUtils.getAutoGenId();
				String sUpdatedOn = CommonUtils.getDate();

				storiesDto.setStoriesId(sId);
				storiesDto.setTitle(title);
				storiesDto.setName(name);
				storiesDto.setProfession(profession);
				storiesDto.setFarmName(farmName);
				storiesDto.setFarmAddress(farmAddress);
				storiesDto.setPlace(place);
				storiesDto.setMandal(mandal);
				storiesDto.setDistrict(district);
				storiesDto.setFarmState(farmState);
				storiesDto.setFarmPinCode(farmPinCode);
				storiesDto.setAboutFarm(aboutFarm);
				storiesDto.setUpdatedOn(sUpdatedOn);
				storiesDto.setUpdatedBy(sLoginId);


				StoriesBO bo = new StoriesBO();
				result = bo.addStories(storiesDto);

				
			}
			/*if(bodyParts != null && bodyParts.size() > 0 ){
				utils.processFileUpload(bodyParts,request );
				CommonUtils.saveFileData(request, sId, "STORIES");
				}*/
			if (!"fail".equals(result)) {
				//CommonUtils.saveFileData(request, sId, "STORIES");
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
	@Path("/getStoriesDetails")
	public JSONObject getStoriesDetails() {

		JSONObject jobj1 = new JSONObject();

		StoriesBO bo = new StoriesBO();
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();

		try {
			storiesList = bo.getStoriesDetails();

			if (!(storiesList.size() < 0)) {
				jobj1.put("StoriesDetails", storiesList);
			} else {
				jobj1.put("StoriesDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStoriesId")
	public JSONObject getStoriesId(@QueryParam("storiesId") String storiesId, @Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(storiesId.length() < 0)) {
				session.setAttribute("STORIESID", storiesId);
			} else {
				jobj.put("StoriesId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStoriesProfile")
	public JSONObject getStoriesProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String storiesId = (String) session.getAttribute("STORIESID");
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			if (StringUtils.isNotEmpty(storiesId)) {
				StoriesDTO dto = new StoriesDTO();
				dto.setStoriesId(storiesId);
				
				StoriesBO bo = new StoriesBO();
				storiesList = bo.getStoriesProfile(dto);

				if (!(storiesList.size() < 0)) {
					jobj.put("StoriesProfile", storiesList);
				} else {
					jobj.put("StoriesProfile", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// get stories images
		StoriesFileDTO storiesFileDto = new StoriesFileDTO();
		storiesFileDto.setStoriesId(storiesId);
		StoriesFileBO storiesFileBo = new StoriesFileBO();
		lstUploadFileDTO = storiesFileBo.getStoriesImages(storiesFileDto);
		if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
			jobj.put("STORIESFILES", lstUploadFileDTO);
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editStories")
	public JSONObject editStories(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String storiesId = (String) session.getAttribute("STORIESID");
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(storiesId)) {
				StoriesDTO dto = new StoriesDTO();
				dto.setStoriesId(storiesId);

				StoriesBO bo = new StoriesBO();
				storiesList = bo.getStoriesProfile(dto);

				if (!(storiesList.size() < 0)) {
					jobj.put("EditStories", storiesList);
					// get stories images
					StoriesFileDTO storiesFileDto = new StoriesFileDTO();
					storiesFileDto.setStoriesId(storiesId);
					StoriesFileBO storiesFileBo = new StoriesFileBO();
					lstUploadFileDTO = storiesFileBo.getStoriesImages(storiesFileDto);
					if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
						jobj.put("STORIESFILES", lstUploadFileDTO);
					}
				} else {
					jobj.put("EditStories", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/storiesUpdate")
	public JSONObject storiesUpdate(@Context HttpServletRequest request, @FormDataParam("storiesId") String storiesId,
			@FormDataParam("title") String title, @FormDataParam("name") String name,
			@FormDataParam("profession") String profession, @FormDataParam("farmName") String farmName,
			@FormDataParam("farmAddress") String farmAddress, @FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal, @FormDataParam("district") String district,
			@FormDataParam("farmState") String farmState, @FormDataParam("farmPinCode") String farmPinCode,
			@FormDataParam("aboutFarm") String aboutFarm,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,FormDataMultiPart multiPart) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sLoginId = "";
		CommonUtils utils = new CommonUtils();

		try {
			List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
			if (StringUtils.isNotEmpty(name)) {
				//utils.processFileUpload(bodyParts,request );
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				StoriesDTO storiesDto = new StoriesDTO();
				String sUpdatedOn = CommonUtils.getDate();
				storiesDto.setStoriesId(storiesId);
				storiesDto.setTitle(title);
				storiesDto.setName(name);
				storiesDto.setProfession(profession);
				storiesDto.setFarmName(farmName);
				storiesDto.setFarmAddress(farmAddress);
				storiesDto.setPlace(place);
				storiesDto.setMandal(mandal);
				storiesDto.setDistrict(district);
				storiesDto.setFarmState(farmState);
				storiesDto.setFarmPinCode(farmPinCode);
				storiesDto.setAboutFarm(aboutFarm);
				storiesDto.setUpdatedOn(sUpdatedOn);
				storiesDto.setUpdatedBy(sLoginId);


				StoriesBO bo = new StoriesBO();
				result = bo.storiesUpdate(storiesDto);
				
				if(bodyParts != null && bodyParts.size() > 0 ){
					utils.processFileUpload(bodyParts,request );
					CommonUtils.saveFileData(request, storiesId, "STORIES");
					}
				//CommonUtils.saveFileData(request, storiesId, "STORIES");
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

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteStories")
	public JSONObject deleteStories(@QueryParam("storiesId") String storiesId) {

		JSONObject jobj1 = new JSONObject();
		StoriesBO bo = new StoriesBO();

		StoriesDTO dto = new StoriesDTO();
		dto.setStoriesId(storiesId);
		String result = "fail";
		try {
			result = bo.deleteStories(dto);
			jobj1.put("StoriesDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	
	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addStoriesNew")
	public JSONObject addStoriesNew(@Context HttpServletRequest request, @FormDataParam("storiesId") String storiesId,
			@FormDataParam("title") String title, @FormDataParam("name") String name,
			@FormDataParam("profession") String profession, @FormDataParam("farmName") String farmName,
			@FormDataParam("farmAddress") String farmAddress, @FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal, @FormDataParam("district") String district,
			@FormDataParam("farmState") String farmState, @FormDataParam("farmPinCode") String farmPinCode,
			@FormDataParam("aboutFarm") String aboutFarm,
			@FormDataParam("moreInfo") String moreInfo,@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info, FormDataMultiPart multiPart) {	
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String sId = null;
		String sLoginId = "";
		String path = "";
		CommonUtils utils = new CommonUtils();
		try {
			if (StringUtils.isNotEmpty(title)) {
				List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
				//utils.processFileUpload(bodyParts,request );
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				
				StoriesDTO storiesDto = new StoriesDTO();
				sId = CommonUtils.getAutoGenId();
				String sUpdatedOn = CommonUtils.getDate();

				storiesDto.setStoriesId(sId);
				storiesDto.setTitle(title);
				storiesDto.setName(name);
				storiesDto.setProfession(profession);
				storiesDto.setFarmName(farmName);
				storiesDto.setFarmAddress(farmAddress);
				storiesDto.setPlace(place);
				storiesDto.setMandal(mandal);
				storiesDto.setDistrict(district);
				storiesDto.setFarmState(farmState);
				storiesDto.setFarmPinCode(farmPinCode);
				storiesDto.setAboutFarm(aboutFarm);
				storiesDto.setUpdatedOn(sUpdatedOn);
				storiesDto.setUpdatedBy(sLoginId);


				StoriesBO bo = new StoriesBO();
				result = bo.addStories(storiesDto);

				if(bodyParts != null && bodyParts.size() > 0 ){
					utils.processFileUpload(bodyParts,request );
					CommonUtils.saveFileData(request, sId, "STORIES");
					}
			}
			
			if (!"fail".equals(result)) {
				
				//CommonUtils.saveFileData(request, sId, "STORIES");
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
	@Path("/searchStories")
	public JSONObject searchStories(@QueryParam("name") String sName, 
			@QueryParam("farmName") String sFarmName ,
			 @QueryParam("place") String sPlace
			 ) {
		JSONObject jobj1 = new JSONObject();
		StoriesBO bo = new StoriesBO();
		StoriesDTO dto = new StoriesDTO();
		dto.setName(sName);
		dto.setFarmName(sFarmName);
		dto.setPlace(sPlace);
		
		
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();
		try {
			storiesList = bo.searchStories(dto);
			if(storiesList != null && storiesList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("StoriesDetails", storiesList);
			}else {
				jobj1.put("StoriesDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStoriesDetailsHome")
	public JSONObject getStoriesDetailsHome(){
		JSONObject jobj1 = new JSONObject();
		StoriesDTO dto = new StoriesDTO();
		StoriesBO bo = new StoriesBO();
		
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();
		try{
			storiesList = bo.getStoriesDetailsHome(dto);
			if(storiesList != null && storiesList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("StoriesDetailsHome", storiesList);
			}else {
				jobj1.put("StoriesDetailsHome", "failed");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobj1;
	}
}
