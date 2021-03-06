package com.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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
import com.bo.EventFileBO;
import com.bo.EventGuestBO;
import com.bo.GuestBO;
import com.bo.MemberBO;
import com.bo.NewsBO;
import com.dto.EventDTO;
import com.dto.EventFileDTO;
import com.dto.EventGuestDTO;
import com.dto.GuestDTO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.UploadFileDTO;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;
import com.sun.jersey.multipart.FormDataParam;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/eventService")
public class EventService {

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addEvent")
	public JSONObject addEvent(@Context HttpServletRequest request, 
			@FormDataParam("eventId") String eventId,
			@FormDataParam("eventName") String eventName, 
			@FormDataParam("noOfDays") String noOfDays,
			@FormDataParam("timeFrom") String timeFrom, 
			@FormDataParam("timeEnd") String timeEnd, 
			@FormDataParam("address") String address,
			@FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal,
			@FormDataParam("district") String district,
			@FormDataParam("state") String state,
			@FormDataParam("landMark") String landMark,
			@FormDataParam("pincode") String pinCode,
			@FormDataParam("moreInfo") String moreInfo,
			@FormDataParam("guestId") String guestId,
			@FormDataParam("guestTitle") String guestTitle,
			@FormDataParam("guestName") String guestName,
			@FormDataParam("guestDesi") String guestDesi,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,FormDataMultiPart multiPart) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String resultGuest = "fail";
		String resultEventGuest = "fail";
		String delims = "~";
		String sId = null ;
		String sLoginId = "";
		CommonUtils utils = new CommonUtils();
		

		try {
			List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
			if (StringUtils.isNotEmpty(eventName)){
				
				
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}


				
				EventDTO eventDto = new EventDTO();
				sId = CommonUtils.getAutoGenId();
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
				eventDto.setUpdatedBy(sLoginId);
				
				
				EventBO bo = new EventBO();
				result = bo.addEvent(eventDto);
				
				if (StringUtils.isNotEmpty(guestName)){
					
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
				}
			}
			
			if(bodyParts != null && bodyParts.size() > 0 ){
				utils.processFileUpload(bodyParts,request );
				CommonUtils.saveFileData(request, sId, "EVENT");
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
	@Path("/getEventDetails")
	public JSONObject getEventDetails() {
		
		JSONObject jobj1 = new JSONObject();
		EventBO bo= new EventBO();
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		
		try {
			eventList = bo.getEventDetails();
			
			if (!(eventList.size() < 0)) {
				jobj1.put("EventDetails", eventList);
			} else {
				jobj1.put("EventDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventId")
	public JSONObject getEventId(@QueryParam("eventId") String eventId, @Context HttpServletRequest request) {
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
		return jobj;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventProfile")
	public JSONObject getEventProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String eventId = (String) session.getAttribute("EVENTID");
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		ArrayList<GuestDTO> guestList = new ArrayList<GuestDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(eventId)) {
				EventDTO dto = new EventDTO();
				dto.setEventId(eventId);

				
                EventBO bo = new EventBO();
                eventList = bo.getEventProfile(dto);
				
				if (!(eventList.size() < 0)) {
					jobj.put("EventProfile", eventList);
				} else {
					jobj.put("EventProfile", "failed");
				}
				EventGuestDTO eventGuestDto = new EventGuestDTO();
				eventGuestDto.setEventId(eventId);
				
				GuestBO guestBo = new GuestBO();
				guestList = guestBo.getGuestDetailsByEventId(eventGuestDto);
				if (!(guestList.size() < 0)) {
					jobj.put("EventGuestProfile", guestList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// get program image
		EventFileDTO eventFileDto = new EventFileDTO();
		eventFileDto.setEventId(eventId);
		EventFileBO eventFileBo = new EventFileBO();
		lstUploadFileDTO = eventFileBo.getEventImages(eventFileDto);
		if(lstUploadFileDTO != null && lstUploadFileDTO.size() > 0){
			jobj.put("EVENTFILES", lstUploadFileDTO);
		}
		return jobj;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editEvent")
	public JSONObject editEvent(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String eventId = (String) session.getAttribute("EVENTID");
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		ArrayList<GuestDTO> guestList = new ArrayList<GuestDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(eventId)) {
				
				
				EventDTO dto = new EventDTO();
				dto.setEventId(eventId);
				EventBO bo = new EventBO();
				eventList = bo.getEventProfile(dto);
				
				if (!(eventList.size() < 0)) {
					jobj.put("EditEvent", eventList);
				} else {
					jobj.put("EditEvent", "failed");
				}
				EventGuestDTO eventGuestDto = new EventGuestDTO();
				eventGuestDto.setEventId(eventId);
				GuestBO gbo = new GuestBO();
				guestList = gbo.getGuestDetailsByEventId(eventGuestDto);
				
				if (!(guestList.size() < 0)) {
					jobj.put("EventGuestEdit", guestList);
					// get program image
					EventFileDTO eventFileDto = new EventFileDTO();
					eventFileDto.setEventId(eventId);
					EventFileBO eventFileBo = new EventFileBO();
					lstUploadFileDTO = eventFileBo.getEventImages(eventFileDto);
					if(lstUploadFileDTO != null && lstUploadFileDTO.size() > 0){
						jobj.put("EVENTFILES", lstUploadFileDTO);
					}
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
	@Path("/eventUpdate")
	public JSONObject eventUpdate(@Context HttpServletRequest request, 
			@FormDataParam("eventId") String eventId,
			@FormDataParam("eventName") String eventName, 
			@FormDataParam("noOfDays") String noOfDays,
			@FormDataParam("timeFrom") String timeFrom, 
			@FormDataParam("timeEnd") String timeEnd, 
			@FormDataParam("address") String address,
			@FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal,
			@FormDataParam("district") String district,
			@FormDataParam("state") String state,
			@FormDataParam("landMark") String landMark,
			@FormDataParam("pincode") String pinCode,
			@FormDataParam("moreInfo") String moreInfo,
			@FormDataParam("guestId") String guestId,
			@FormDataParam("guestTitle") String guestTitle,
			@FormDataParam("guestName") String guestName,
			@FormDataParam("guestDesi") String guestDesi,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,FormDataMultiPart multiPart) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sLoginId = "";
		String delims = "~";
		String resultGuest = "fail";
		String resultEventGuest = "fail";
		CommonUtils utils = new CommonUtils();

		try {
			List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
			if (StringUtils.isNotEmpty(eventName)){
				//utils.processFileUpload(bodyParts,request );
				
				if (request.getSession().getAttribute("LOGINID") != null) {
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				EventDTO eventDto = new EventDTO();
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
				eventDto.setUpdatedBy(sLoginId);
				
				
				EventBO bo = new EventBO();
				result = bo.eventUpdate(eventDto);
				
				if (StringUtils.isNotEmpty(guestName)){
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
						
						GuestDTO guestDto = new GuestDTO();
						
						String sGuestId = CommonUtils.getAutoGenId();
						guestDto.setGuestId(sGuestId);
						guestDto.setTitle(sTitle);
						guestDto.setName(sName);
						guestDto.setDesignation(sDesi);
						System.out.println("in to add guest in eventEdit page");
						resultGuest = guestBo.addGuest(guestDto);
						System.out.println("add guest ---------"+resultGuest);
						
						
						EventGuestDTO eventGuestDto = new EventGuestDTO();
						eventGuestDto.setEventId(eventId);
						eventGuestDto.setGuestId(sGuestId);

						resultEventGuest = eventGuestBo.addEventGuest(eventGuestDto);
					}
				}
				}
				if(bodyParts != null && bodyParts.size() > 0 ){
				utils.processFileUpload(bodyParts,request );
				CommonUtils.saveFileData(request, eventId, "EVENT");
				}
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
	@Path("/deleteEvent")
	public JSONObject deleteEvent(@QueryParam("eventId") String eventId) {
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
		return jobj1;

	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteGuest")
	public JSONObject deleteGuest(@QueryParam("guestId") String guestId) {
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
        
        // delete guest 
		GuestDTO guestDto = new GuestDTO();
		guestDto.setGuestId(guestId);
		GuestBO guestBo = new GuestBO();
		guestDelete = guestBo.deleteGuest(guestDto);
		

		// delete eventGuest
		eventGuestDTO.setEventId(sEventId);
		eventGuestDelete = eventGuestBo.deleteEventGuest(eventGuestDTO);

		if(guestDelete.equals("success") && eventGuestDelete.equals("success")  ){
			jobj1 =  getGuests(sEventId);
					
		}
		
		return jobj1;

	}
	public JSONObject getGuests(String eventId){
		JSONObject jobj = new JSONObject();
		String resultGetGuests = "fail";
		ArrayList<GuestDTO> guestList = new ArrayList<GuestDTO>();
		EventGuestDTO eventGuestDto = new EventGuestDTO();
		eventGuestDto.setEventId(eventId);
		GuestBO gbo = new GuestBO();
		guestList = gbo.getGuestDetailsByEventId(eventGuestDto);

		if (!(guestList.size() < 0)) {
			jobj.put("EventGuestEdit", guestList);
		}else {
			jobj.put("EventGuestEdit", "failed");
		}
		return jobj;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/searchEvent")
	public JSONObject searchEvent(
		@QueryParam("eventName") String sEventName, 
		@QueryParam("days") String sDays,
		@QueryParam("date") String sDate,
		@QueryParam("address") String sAddress
		) {
		
		JSONObject jobj1 = new JSONObject();
		EventBO bo = new EventBO();
		EventDTO dto = new EventDTO();
		
		dto.setEventName(sEventName);
		dto.setNoOfDays(sDays);
		dto.setTimeFrom(sDate);
		dto.setAddress(sAddress);
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();

		try {
			eventList = bo.searchEvent(dto);
			if(eventList != null && eventList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("EventDetails", eventList);
			}else {
				jobj1.put("EventDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getEventDetailsHome")
	public JSONObject getEventDetailsHome(){
		System.out.println("in to event getEventDetailsHome");
		JSONObject jobj1 = new JSONObject();
		EventDTO dto = new EventDTO();
		EventBO bo = new EventBO();
		
		ArrayList<EventDTO> eventList = new ArrayList<EventDTO>();
		try{
			eventList = bo.getEventDetailsHome(dto);
			if(eventList != null && eventList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("EventDetailsHome", eventList);
			}else {
				jobj1.put("EventDetailsHome", "failed");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobj1;
	}
}
