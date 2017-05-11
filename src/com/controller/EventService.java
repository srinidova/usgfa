package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.bo.EventFileBO;
import com.bo.EventGuestBO;
import com.bo.FarmBO;
import com.bo.GuestBO;
import com.bo.MemberBO;
import com.bo.NewsBO;
import com.bo.ProgramFileBO;
import com.bo.UploadFileBO;
import com.dao.EventDAO;
import com.dto.EventDTO;
import com.dto.EventFileDTO;
import com.dto.EventGuestDTO;
import com.dto.FarmDTO;
import com.dto.GuestDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;
import com.dto.ProgramFileDTO;
import com.dto.UploadFileDTO;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/eventService")
public class EventService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addEvent")
	public JSONObject addEvent(@Context HttpServletRequest request, 
			@QueryParam("eventId") String eventId,
			@QueryParam("eventName") String eventName, 
			@QueryParam("noOfDays") String noOfDays,
			@QueryParam("timeFrom") String timeFrom, 
			@QueryParam("timeEnd") String timeEnd, 
			@QueryParam("address") String address,
			@QueryParam("place") String place,
			@QueryParam("mandal") String mandal,
			@QueryParam("district") String district,
			@QueryParam("state") String state,
			@QueryParam("landMark") String landMark,
			@QueryParam("pincode") String pinCode,
			@QueryParam("moreInfo") String moreInfo,
			@QueryParam("guestId") String guestId,
			@QueryParam("title") String title,
			@QueryParam("name") String name,
			@QueryParam("designation") String designation) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String resultGuest = "fail";
		String resultEventGuest = "fail";


		//System.out.println("1.a In addEvent---------- eventName===" + eventName);
		//System.out.println("1.b In addEvent---------- timeFrom===" + timeFrom);
		//System.out.println("1.d In addEvent---------- noOfDays===" + noOfDays);

		try {
			if (StringUtils.isNotEmpty(eventName)){
				EventDTO eventDto = new EventDTO();
				String sId = CommonUtils.getAutoGenId();
				//eventDto.setEventId(CommonUtils.getAutoGenId());
				eventDto.setEventId(sId);
				eventDto.setEventName(eventName);
				eventDto.setNoOfDays(noOfDays);
				eventDto.setTimeFrom(timeFrom);
				eventDto.setTimeEnd(timeEnd);
				eventDto.setAddress(address);
				eventDto.setPlace(place);
				eventDto.setMandal(mandal);
				eventDto.setDistrict(district);
				eventDto.setState(state);
				eventDto.setLandMark(landMark);
				eventDto.setPinCode(pinCode);
				eventDto.setMoreInfo(moreInfo);
				eventDto.setUpdatedOn(CommonUtils.getDate());
				
				
				EventBO bo = new EventBO();
				result = bo.addEvent(eventDto);
				
				GuestDTO guestDto = new GuestDTO();
				String sGuestId = CommonUtils.getAutoGenId();
				guestDto.setGuestId(sGuestId);
				guestDto.setTitle(title);
				guestDto.setName(name);
				guestDto.setDesignation(designation);
				
				GuestBO guestBo = new GuestBO();
				resultGuest = guestBo.addGuest(guestDto);
				
				EventGuestDTO eventGuestDto = new EventGuestDTO();
				eventGuestDto.setEventId(sId);
				eventGuestDto.setGuestId(sGuestId);
				EventGuestBO eventGuestBo = new EventGuestBO();
				resultEventGuest = eventGuestBo.addEventGuest(eventGuestDto);
					
				System.out.println("resultEventGuest"+resultEventGuest);
				CommonUtils.saveFileData(request, sId, "EVENT");
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
	@Path("/getEventDetails")
	public JSONObject getEventDetails() {
		
		JSONObject jobj1 = new JSONObject();
		//JSONObject jobj2 = new JSONObject();
		
		EventBO bo= new EventBO();
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		
		try {
			//System.out.println("1. *****Called getEventDetails**********");
			eventList = bo.getEventDetails();
			
			//System.out.println("****eventList.size=="+eventList.size());
			//System.out.println("arraylist--->" + eventList.toString());
			if (!(eventList.size() < 0)) {
				jobj1.put("EventDetails", eventList);
			} else {
				jobj1.put("EventDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("jobj-->" + jobj1);
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventId")
	public JSONObject getEventId(@QueryParam("eventId") String eventId, @Context HttpServletRequest request) {
		//System.out.println("1. *****Called getEventId**********eventId==" + eventId);
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(eventId.length() < 0)) {
				session.setAttribute("EVENTID", eventId);
			} else {
				jobj.put("EventId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventProfile")
	public JSONObject getEventProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String eventId = (String) session.getAttribute("EVENTID");
		//System.out.println("1a. *****Called getEventProfile**********eventId==" + eventId);
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		ArrayList<GuestDTO> guestList = new ArrayList<GuestDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(eventId)) {
				EventDTO dto = new EventDTO();
				dto.setEventId(eventId);

				
                EventBO bo = new EventBO();
                eventList = bo.getEventProfile(dto);
				
				//System.out.println("****eventList.size==" + eventList.size());
				//System.out.println("arraylist--->" + eventList.toString());
				if (!(eventList.size() < 0)) {
					jobj.put("EventProfile", eventList);
				} else {
					jobj.put("EventProfile", "failed");
				}
				/*GuestDTO guestDto = new GuestDTO();
				GuestBO guestBo = new GuestBO();
				guestList = guestBo.getGuestDetails();
				
				//guestDto.setName(name);
				if (!(guestList.size() < 0)) {
					jobj.put("GuestProfile", guestList);
				}*/
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// get program image
		EventFileDTO eventFileDto = new EventFileDTO();
		eventFileDto.setEventId(eventId);
		System.out.println("****eventImages==" + eventFileDto.getEventId());
		EventFileBO eventFileBo = new EventFileBO();
		lstUploadFileDTO = eventFileBo.getEventImages(eventFileDto);
		if(lstUploadFileDTO != null && lstUploadFileDTO.size() > 0){
			System.out.println("****lstUploadFileDTO.size==" + lstUploadFileDTO.size());
			jobj.put("EVENTFILES", lstUploadFileDTO);
		}
		//System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editEvent")
	public JSONObject editEvent(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String eventId = (String) session.getAttribute("EVENTID");
		//System.out.println("1a. *****Called editEvent**********eventId==" + eventId);
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		ArrayList<GuestDTO> guestList = new ArrayList<GuestDTO>();

		try {
			if (StringUtils.isNotEmpty(eventId)) {
				EventDTO dto = new EventDTO();
				dto.setEventId(eventId);
				EventBO bo = new EventBO();
				eventList = bo.getEventProfile(dto);
				
				//System.out.println("****eventList.size==" + eventList.size());
				//System.out.println("arraylist--->" + eventList.toString());
				if (!(eventList.size() < 0)) {
					jobj.put("EditEvent", eventList);
				} else {
					jobj.put("EditEvent", "failed");
				}
				EventGuestDTO eventGuestDto = new EventGuestDTO();
				eventGuestDto.setEventId(eventId);
				//memberFarmDto.setMemberId(memberId);
				GuestBO gbo = new GuestBO();
				//guestList = gbo.getGuestDetailsByEventId(eventGuestDto);
				//guestList = gbo.getGuestDetailsByeventId(eventGuestDto);
				//FarmBO fbo  = new FarmBO();
				//guestList = gbo.getGuestDetailsByeventId(eventGuestDto);
				
				//System.out.println("****farmList.size==" + farmList.size());
				if (!(guestList.size() < 0)) {
					jobj.put("EventGuestEdit", guestList);
				}
				//System.out.println("****guestList.size==" + guestList.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("editNews jobj-->" + jobj);
		return jobj;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/eventUpdate")
	public JSONObject eventUpdate(@Context HttpServletRequest request, 
			@QueryParam("eventId") String eventId,
			@QueryParam("eventName") String eventName, 
			@QueryParam("noOfDays") String noOfDays,
			@QueryParam("timeFrom") String timeFrom, 
			@QueryParam("timeEnd") String timeEnd, 
			@QueryParam("address") String address,
			@QueryParam("place") String place,
			@QueryParam("mandal") String mandal,
			@QueryParam("district") String district,
			@QueryParam("state") String state,
			@QueryParam("landMark") String landMark,
			@QueryParam("pincode") String pinCode,
			@QueryParam("moreInfo") String moreInfo) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		//System.out.println("1.a In eventUpdate---------- eventId===" + eventId);
		//System.out.println("1.a In eventUpdate---------- eventName===" + eventName);
		//System.out.println("1.b In eventUpdate---------- timeFrom===" + timeFrom);
		//System.out.println("1.d In eventUpdate---------- noOfDays===" + noOfDays);

		try {
			if (StringUtils.isNotEmpty(eventName)){
				EventDTO eventDto = new EventDTO();
				//eventDto.setEventId(CommonUtils.getAutoGenId());
				eventDto.setEventId(eventId);
				eventDto.setEventName(eventName);
				eventDto.setNoOfDays(noOfDays);
				eventDto.setTimeFrom(timeFrom);
				eventDto.setTimeEnd(timeEnd);
				eventDto.setAddress(address);
				eventDto.setPlace(place);
				eventDto.setMandal(mandal);
				eventDto.setDistrict(district);
				eventDto.setState(state);
				eventDto.setLandMark(landMark);
				eventDto.setPinCode(pinCode);
				eventDto.setMoreInfo(moreInfo);
				eventDto.setUpdatedOn(CommonUtils.getDate());
				
				
				EventBO bo = new EventBO();
				result = bo.eventUpdate(eventDto);
				//result = bo.addEvent(eventDto);
				//result = bo.addNewsDetails(eventDto);
				CommonUtils.saveFileData(request, eventId, "EVENT");
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
	@Path("/deleteEvent")
	public JSONObject deleteEvent(@QueryParam("eventId") String eventId) {
		//System.out.println("1. *****Called deleteEvent**********eventId==" + eventId);
		JSONObject jobj1 = new JSONObject();
		EventBO bo =new EventBO();
		EventDTO dto = new EventDTO();
		dto.setEventId(eventId);
		/*NewsBO bo = new NewsBO();
		NewsDTO dto = new NewsDTO();
		dto.setNewsId(newsId);*/
		String result = "fail";
		try {
			result = bo.deleteEvent(dto);
			//result = bo.deleteNews(dto);
			jobj1.put("EventDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventImages")
    public JSONObject getEventImages(@Context HttpServletRequest request,@QueryParam("eventId") String newsId,@QueryParam("fileId") String fileId){
		
		JSONObject jobj = new JSONObject();
		
		String result ="fail";
		
		UploadFileDTO uploadFileDto = new UploadFileDTO();
		uploadFileDto.setFileId(fileId);
		
		EventBO bo = new EventBO();
		result = bo.getEventImage(uploadFileDto);
		return jobj;
	}*/
}
