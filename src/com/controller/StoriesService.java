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

	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addStories")
	public JSONObject addStories(@Context HttpServletRequest request, 
			@QueryParam("storiesId") String storiesId,
			@QueryParam("title") String title, 
			@QueryParam("name") String name,
			@QueryParam("profession") String profession, 
			@QueryParam("farmName") String farmName, 
			@QueryParam("farmAddress") String farmAddress,
			@QueryParam("place") String place,
			@QueryParam("mandal") String mandal,
			@QueryParam("district") String district,
			@QueryParam("farmState") String farmState,
			@QueryParam("farmPinCode")String farmPinCode,
			@QueryParam("aboutFarm") String aboutFarm
			 ) {
		//System.out.println("in to controller");
		JSONObject jObj = new JSONObject();
		String result = "fail";

		//System.out.println("1.a In addStories---------- title===" + title);
		//System.out.println("1.b In addStories---------- name===" + name);
		//System.out.println("1.d In addStories---------- profession===" + profession);
		//System.out.println("1.d In addStories---------- farmName===" + farmName);
		//System.out.println("1.d In addStories---------- state===" + farmState);

		try {
			if (StringUtils.isNotEmpty(title)) {
				
				StoriesDTO storiesDto = new StoriesDTO();
				
				storiesDto.setStoriesId(CommonUtils.getAutoGenId());
				storiesDto.setTitle(title);
				storiesDto.setName(farmName);
				storiesDto.setProfession(profession);
				storiesDto.setFarmName(farmName);
				storiesDto.setAddress(farmAddress);
				storiesDto.setPlace(place);
				storiesDto.setMandal(mandal);
				storiesDto.setDistrict(district);
				storiesDto.setState(farmState);
				storiesDto.setPincode(farmPinCode);
				storiesDto.setAboutFarm(aboutFarm);
				storiesDto.setUpdatedOn(CommonUtils.getDate());
				
				//StoriesBO bo = new StoriesBO();
				
				//result = bo.addStories(storiesDto);
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
	
	}*/
	

		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/addStories")
		public JSONObject addStories(@Context HttpServletRequest request, @QueryParam("storiesId") String storiesId,
				@QueryParam("title") String title, 
				@QueryParam("name") String name,
				@QueryParam("profession") String profession, 
				@QueryParam("farmName") String farmName,
				@QueryParam("farmAddress") String farmAddress,
				@QueryParam("place") String place,
				@QueryParam("mandal") String mandal,
				@QueryParam("district") String district,
				@QueryParam("farmState") String farmState,
				@QueryParam("farmPinCode") String farmPinCode,
				@QueryParam("aboutFarm") String aboutFarm) {
			JSONObject jObj = new JSONObject();
			String result = "fail";
			String resultFile = "fail";

			//System.out.println("1.a In addStories---------- name===" + name);
			//System.out.println("1.b In addStories---------- profession===" + profession);
			////System.out.println("1.d In addStories---------- farmName===" + farmName);
			
			////System.out.println("getContextPath-------"+request.getContextPath());
			try {
				if (StringUtils.isNotEmpty(title)) {
					StoriesDTO storiesDto = new StoriesDTO();
					String sId = CommonUtils.getAutoGenId();
					String sUpdatedOn = CommonUtils.getDate();
					
					storiesDto.setStoriesId(sId);
					storiesDto.setTitle(title);
					storiesDto.setName(name);
					//storiesDto.setName(farmName);
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
					

					
					//System.out.println("1.e In addStories---------- sId===" + sId);
					//System.out.println("1.f In addStories---------- sUpdatedOn===" + sUpdatedOn);
					
					StoriesBO  bo = new StoriesBO();
					result = bo.addStories(storiesDto);
					
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
					    
					 // saving in to storiesFile Table
					    
					    StoriesFileDTO  storiesFileDto = new StoriesFileDTO();
					    storiesFileDto.setFileId(sFileId);
					    storiesFileDto.setStoriesId(sId);
					   /* programFileDto.setFileId(sFileId);
					    programFileDto.setProgramId(sId);*/
					   /* newsFileDto.setFileId(sFileId);
					    newsFileDto.setNewsId(sId);*/
					    System.out.println("programFile---------"+sId);
					    StoriesFileBO storiesFileBo = new StoriesFileBO();
					    resultFile = storiesFileBo.storiesFile(storiesFileDto);
					    /*ProgramFileBO programFileBo = new ProgramFileBO();
					    resultFile = programFileBo.programFile(programFileDto);*/
					   /* NewsFileBO newsFileBo = new NewsFileBO();
					    resultNewsFile = newsFileBo.newsFile(newsFileDto);*/
					    
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
		@Path("/getStoriesDetails")
		public JSONObject getStoriesDetails() {
			
			JSONObject jobj1 = new JSONObject();
			//JSONObject jobj2 = new JSONObject();
			
			StoriesBO bo= new StoriesBO();
			ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();
			
			
			try {
				//System.out.println("1. *****Called getStoriesDetails**********");
				storiesList = bo.getStoriesDetails();
				//programList = bo.getProgramDetails();
				
				
				//System.out.println("****storiesList.size=="+storiesList.size());
				//System.out.println("arraylist--->" + storiesList.toString());
				if (!(storiesList.size() < 0)) {
					jobj1.put("StoriesDetails", storiesList);
				} else {
					jobj1.put("StoriesDetails", "failed");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("jobj-->" + jobj1);
			return jobj1;

		}
		
		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getStoriesId")
		public JSONObject getStoriesId(@QueryParam("storiesId") String storiesId, @Context HttpServletRequest request) {
			//System.out.println("1. *****Called getStoriesId**********storiesId==" + storiesId);
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
			//System.out.println("Profile jobj-->" + jobj);
			return jobj;

		}

		
		
		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/getStoriesProfile")
		public JSONObject getStoriesProfile(@Context HttpServletRequest request) {

			JSONObject jobj = new JSONObject();
			HttpSession session = request.getSession();
			String storiesId = (String) session.getAttribute("STORIESID");
			//System.out.println("1a. *****Called getStoriesProfile**********storiesId==" + storiesId);
			ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();

			try {
				if (StringUtils.isNotEmpty(storiesId)) {
					StoriesDTO dto = new StoriesDTO();
					dto.setStoriesId(storiesId);
					/*NewsDTO dto = new NewsDTO();
					dto.setNewsId(storiesId);*/
					
					StoriesBO bo = new StoriesBO();
					storiesList = bo.getStoriesProfile(dto);
					//storiesList = bo.getNewsProfile(dto);

					/*NewsBO bo = new NewsBO();
					newsList = bo.getNewsProfile(dto);
*/
					//System.out.println("****storiesList.size==" + storiesList.size());
					//System.out.println("arraylist--->" + storiesList.toString());
					if (!(storiesList.size() < 0)) {
						jobj.put("StoriesProfile", storiesList);
					} else {
						jobj.put("StoriesProfile", "failed");
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
		@Path("/editStories")
		public JSONObject editStories(@Context HttpServletRequest request) {

			JSONObject jobj = new JSONObject();
			HttpSession session = request.getSession();
			String storiesId = (String) session.getAttribute("STORIESID");
			//System.out.println("1a. *****Called editStories**********storiesId==" + storiesId);
			ArrayList<StoriesDTO> storiesList = new ArrayList<StoriesDTO>();

			try {
				if (StringUtils.isNotEmpty(storiesId)) {
					StoriesDTO dto = new StoriesDTO();
					dto.setStoriesId(storiesId);

					StoriesBO bo = new StoriesBO();
					storiesList = bo.getStoriesProfile(dto);
					/*NewsBO bo = new NewsBO();
					newsList = bo.getNewsProfile(dto);*/

					//System.out.println("****storiesList.size==" + storiesList.size());
					//System.out.println("arraylist--->" + storiesList.toString());
					if (!(storiesList.size() < 0)) {
						jobj.put("EditStories", storiesList);
					} else {
						jobj.put("EditStories", "failed");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("editStories jobj-->" + jobj);
			return jobj;

		}
		@GET
		@Produces(MediaType.APPLICATION_JSON)
		@Path("/storiesUpdate")
		public JSONObject storiesUpdate(@Context HttpServletRequest request, @QueryParam("storiesId") String storiesId,
				@QueryParam("title") String title, 
				@QueryParam("name") String name,
				@QueryParam("profession") String profession, 
				@QueryParam("farmName") String farmName,
				@QueryParam("farmAddress") String farmAddress,
				@QueryParam("place") String place,
				@QueryParam("mandal") String mandal,
				@QueryParam("district") String district,
				@QueryParam("farmState") String farmState,
				@QueryParam("farmPinCode") String farmPinCode,
				@QueryParam("aboutFarm") String aboutFarm) {
			JSONObject jObj = new JSONObject();
			String result = "fail";
			//System.out.println("1a. *****Called storiesUpdate**********storiesId==" + storiesId);
			//System.out.println("1.a In storiesUpdate---------- name===" + name);
			//System.out.println("1.b In storiesUpdate---------- profession===" + profession);
			//System.out.println("1.d In storiesUpdate---------- farmName===" + farmName);
			
			////System.out.println("getContextPath-------"+request.getContextPath());
			try {
				if (StringUtils.isNotEmpty(name)) {
					StoriesDTO storiesDto = new StoriesDTO();
					//String sId = CommonUtils.getAutoGenId();
					String sUpdatedOn = CommonUtils.getDate();
					storiesDto.setStoriesId(storiesId);
					//storiesDto.setStoriesId(sId);
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
					//storiesDto.setUpdatedOn(updatedOn);
					storiesDto.setUpdatedOn(sUpdatedOn);
					

					
					//System.out.println("1.e In storiesUpdate---------- sId===" + storiesId);
					//System.out.println("1.f In storiesUpdate---------- sUpdatedOn===" + sUpdatedOn);

					
					
					StoriesBO  bo = new StoriesBO();
					result = bo.storiesUpdate(storiesDto);
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
		@Path("/deleteStories")
		public JSONObject deleteStories(@QueryParam("storiesId") String storiesId) {
			//System.out.println("1. *****Called deleteStories**********storiesId==" + storiesId);
			
			JSONObject jobj1 = new JSONObject();
			StoriesBO bo = new StoriesBO();
			//NewsBO bo = new NewsBO();
			StoriesDTO dto = new StoriesDTO();
			dto.setStoriesId(storiesId);
			//NewsDTO dto = new NewsDTO();
			//dto.setNewsId(newsId);
			String result = "fail";
			try {
				result = bo.deleteStories(dto);
				jobj1.put("StoriesDelete", result);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("delete jobj-->" + jobj1);
			return jobj1;

		}
}


