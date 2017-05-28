package com.controller;

import java.util.ArrayList;

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
import com.bo.GuestBO;
import com.dto.EventDTO;
import com.dto.EventFileDTO;
import com.dto.EventGuestDTO;
import com.dto.GuestDTO;
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
			@QueryParam("guestTitle") String guestTitle,
			@QueryParam("guestName") String guestName,
			@QueryParam("guestDesi") String guestDesi) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String resultGuest = "fail";
		String resultEventGuest = "fail";
		String delims = "~";

		//System.out.println("1.a In addEvent---------- guestTitle===" + guestTitle);
		//System.out.println("1.b In addEvent---------- guestName===" + guestName);
		//System.out.println("1.d In addEvent---------- guestDesi===" + guestDesi);
		
		

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
				//System.out.println("y. In EventDAO addEvent---------- result===" + result);
				
				
				GuestBO guestBo = new GuestBO();
				EventGuestBO eventGuestBo = new EventGuestBO();
				
				String[] tokensTitle = guestTitle.split(delims);
				String[] tokensName = guestName.split(delims);
				String[] tokensDesi = guestDesi.split(delims);

				int tokenCountTitle = tokensTitle.length;
				if(StringUtils.isNotEmpty(guestTitle) &&tokenCountTitle > 0){
					for (int j = 0; j < tokenCountTitle; j++) {
						
						String sTitle =  tokensTitle[j];
						String sName = tokensName[j];
						String sDesi = tokensDesi[j];
						//System.out.println("sName=="+ sName+"-----sTitle=="+ sTitle+"---------sDesi=="+ sDesi);
						
						GuestDTO guestDto = new GuestDTO();
						String sGuestId = CommonUtils.getAutoGenId();
						guestDto.setGuestId(sGuestId);
						guestDto.setTitle(sTitle);
						guestDto.setName(sName);
						guestDto.setDesignation(sDesi);
						
						resultGuest = guestBo.addGuest(guestDto);
						
						EventGuestDTO eventGuestDto = new EventGuestDTO();
						eventGuestDto.setEventId(sId);
						eventGuestDto.setGuestId(sGuestId);

						resultEventGuest = eventGuestBo.addEventGuest(eventGuestDto);
					}
				}
				//System.out.println("resultEventGuest"+resultEventGuest);
				CommonUtils.saveFileData(request, sId, "EVENT");
			}
			
			System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				System.out.println("--success--->");
				jObj.put("Msg", result);
			} else {
				System.out.println("--fail--->");
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
		//System.out.println("****eventImages==" + eventFileDto.getEventId());
		EventFileBO eventFileBo = new EventFileBO();
		lstUploadFileDTO = eventFileBo.getEventImages(eventFileDto);
		if(lstUploadFileDTO != null && lstUploadFileDTO.size() > 0){
			//System.out.println("****lstUploadFileDTO.size==" + lstUploadFileDTO.size());
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
				GuestBO gbo = new GuestBO();
				guestList = gbo.getGuestDetailsByEventId(eventGuestDto);
				//guestList = gbo.getGuestDetailsByeventId(eventGuestDto);
				//guestList = gbo.getGuestDetailsByeventId(eventGuestDto);
				
				//System.out.println("****guestList.size==" + guestList.size());
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
		
		String result = "fail";
		try {
			result = bo.deleteEvent(dto);
			
			jobj1.put("EventDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteGuest")
	public JSONObject deleteGuest(@QueryParam("guestId") String guestId) {
		//System.out.println("1. *****Called deleteGuest**********guestId=="+guestId);
		JSONObject jobj1 = null;
		String guestDelete ="fail";
		String eventGuestDelete = "fail";
		String sEventId = null;
		ArrayList<EventGuestDTO> lstEventGuestDTO = null;
		EventGuestBO eventGuestBo = new EventGuestBO();
		
		EventGuestDTO eventGuestDTO = new EventGuestDTO();
		eventGuestDTO.setGuestId(guestId);
		
		lstEventGuestDTO =  eventGuestBo.getEventGuestByGuestId(eventGuestDTO);
		
        if(lstEventGuestDTO != null && lstEventGuestDTO.size() > 0){
        	for(int i=0; i < lstEventGuestDTO.size(); i++){
        		EventGuestDTO eventGuestDto = lstEventGuestDTO.get(i);
        		sEventId = eventGuestDto.getEventId();
        	}
        }
       // System.out.println("1. *****Called deleteGuest**********sEventId=="+sEventId);
        
        // delete guest 
		GuestDTO guestDto = new GuestDTO();
		guestDto.setGuestId(guestId);
		GuestBO guestBo = new GuestBO();
		guestDelete = guestBo.deleteGuest(guestDto);
		
		//System.out.println("1. *****Called deleteGuest**********guestDelete=="+guestDelete);

		// delete eventGuest
		eventGuestDTO.setEventId(sEventId);
		eventGuestDelete = eventGuestBo.deleteEventGuest(eventGuestDTO);
		//System.out.println("1. *****Called deleteGuest**********eventGuestDelete=="+eventGuestDelete);

		if(guestDelete.equals("success") && eventGuestDelete.equals("success")  ){
			jobj1 =  getGuests(sEventId);
					
		}
		//System.out.println("delete jobj1-->" + jobj1);
		
		return jobj1;

	}
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getGuests")*/
	public JSONObject getGuests(String eventId){
		JSONObject jobj = new JSONObject();
		String resultGetGuests = "fail";
		ArrayList<GuestDTO> guestList = new ArrayList<GuestDTO>();
		/*HttpSession session = request.getSession();
		String eventId = (String) session.getAttribute("EVENTID");*/
		EventGuestDTO eventGuestDto = new EventGuestDTO();
		eventGuestDto.setEventId(eventId);
		GuestBO gbo = new GuestBO();
		guestList = gbo.getGuestDetailsByEventId(eventGuestDto);

		
		//System.out.println("****guestList.size==" + guestList.size());
		if (!(guestList.size() < 0)) {
			jobj.put("EventGuestEdit", guestList);
		}else {
			jobj.put("EventGuestEdit", "failed");
		}
		return jobj;
	}
}
