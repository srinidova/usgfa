package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
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
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.ProgramFileDTO;
import com.dto.StoriesDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/storiesService")
public class StoriesService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addStories")
	public JSONObject addStories(@Context HttpServletRequest request, @QueryParam("storiesId") String storiesId,
			@QueryParam("title") String title, @QueryParam("name") String name,
			@QueryParam("profession") String profession, @QueryParam("farmName") String farmName,
			@QueryParam("farmAddress") String farmAddress, @QueryParam("place") String place,
			@QueryParam("mandal") String mandal, @QueryParam("district") String district,
			@QueryParam("farmState") String farmState, @QueryParam("farmPinCode") String farmPinCode,
			@QueryParam("aboutFarm") String aboutFarm) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String sId = null;

		// System.out.println("1.a In addStories---------- name===" + name);
		// System.out.println("1.b In addStories---------- profession===" +
		// profession);
		//// System.out.println("1.d In addStories---------- farmName===" +
		// farmName);

		//// System.out.println("getContextPath-------"+request.getContextPath());
		try {
			if (StringUtils.isNotEmpty(title)) {
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

				// System.out.println("1.e In addStories---------- sId===" +
				// sId);
				// System.out.println("1.f In addStories----------
				// sUpdatedOn===" + sUpdatedOn);

				StoriesBO bo = new StoriesBO();
				result = bo.addStories(storiesDto);

				
			}
			// System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				CommonUtils.saveFileData(request, sId, "STORIES");
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("jobj-->" + jObj);
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
			// System.out.println("1. *****Called getStoriesDetails**********");
			storiesList = bo.getStoriesDetails();

			// System.out.println("****storiesList.size=="+storiesList.size());
			// System.out.println("arraylist--->" + storiesList.toString());
			if (!(storiesList.size() < 0)) {
				jobj1.put("StoriesDetails", storiesList);
			} else {
				jobj1.put("StoriesDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("jobj-->" + jobj1);
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStoriesId")
	public JSONObject getStoriesId(@QueryParam("storiesId") String storiesId, @Context HttpServletRequest request) {
		System.out.println("1. *****Called getStoriesId**********storiesId==" + storiesId);
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(storiesId.length() < 0)) {
				System.out.println("Profile44444444444 jobj-->" + jobj);
				session.setAttribute("STORIESID", storiesId);
			} else {
				jobj.put("StoriesId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getStoriesProfile")
	public JSONObject getStoriesProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String storiesId = (String) session.getAttribute("STORIESID");
	    System.out.println("1a. *****Called getStoriesProfile**********storiesId==" + storiesId);
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			if (StringUtils.isNotEmpty(storiesId)) {
				StoriesDTO dto = new StoriesDTO();
				dto.setStoriesId(storiesId);
				
				StoriesBO bo = new StoriesBO();
				storiesList = bo.getStoriesProfile(dto);

				 System.out.println("****storiesList.size==" + storiesList.size());
				 System.out.println("arraylist--->" + storiesList.toString());
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
		//System.out.println("****storiesImages==" + storiesFileDto.getStoriesId());
		StoriesFileBO storiesFileBo = new StoriesFileBO();
		lstUploadFileDTO = storiesFileBo.getStoriesImages(storiesFileDto);
		if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
			//System.out.println("****lstUploadFileDTO.size==" + lstUploadFileDTO.size());
			jobj.put("STORIESFILES", lstUploadFileDTO);
		}
		// System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editStories")
	public JSONObject editStories(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String storiesId = (String) session.getAttribute("STORIESID");
		// System.out.println("1a. *****Called editStories**********storiesId=="
		// + storiesId);
		ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();

		try {
			if (StringUtils.isNotEmpty(storiesId)) {
				StoriesDTO dto = new StoriesDTO();
				dto.setStoriesId(storiesId);

				StoriesBO bo = new StoriesBO();
				storiesList = bo.getStoriesProfile(dto);

				// System.out.println("****storiesList.size==" +
				// storiesList.size());
				// System.out.println("arraylist--->" + storiesList.toString());
				if (!(storiesList.size() < 0)) {
					jobj.put("EditStories", storiesList);
				} else {
					jobj.put("EditStories", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("editStories jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/storiesUpdate")
	public JSONObject storiesUpdate(@Context HttpServletRequest request, @QueryParam("storiesId") String storiesId,
			@QueryParam("title") String title, @QueryParam("name") String name,
			@QueryParam("profession") String profession, @QueryParam("farmName") String farmName,
			@QueryParam("farmAddress") String farmAddress, @QueryParam("place") String place,
			@QueryParam("mandal") String mandal, @QueryParam("district") String district,
			@QueryParam("farmState") String farmState, @QueryParam("farmPinCode") String farmPinCode,
			@QueryParam("aboutFarm") String aboutFarm) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		// System.out.println("1a. *****Called
		// storiesUpdate**********storiesId==" + storiesId);
		// System.out.println("1.a In storiesUpdate---------- name===" + name);
		// System.out.println("1.b In storiesUpdate---------- profession===" +
		// profession);
		// System.out.println("1.d In storiesUpdate---------- farmName===" +
		// farmName);

		//// System.out.println("getContextPath-------"+request.getContextPath());
		try {
			if (StringUtils.isNotEmpty(name)) {
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

				// System.out.println("1.e In storiesUpdate---------- sId===" +
				// storiesId);
				// System.out.println("1.f In storiesUpdate----------
				// sUpdatedOn===" + sUpdatedOn);

				StoriesBO bo = new StoriesBO();
				result = bo.storiesUpdate(storiesDto);
				CommonUtils.saveFileData(request, storiesId, "STORIES");
			}
			// System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("jobj-->" + jObj);
		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteStories")
	public JSONObject deleteStories(@QueryParam("storiesId") String storiesId) {
		// System.out.println("1. *****Called
		// deleteStories**********storiesId==" + storiesId);

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
		// System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}
}
