package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.StoriesDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.EventFileDTO;
import com.dto.MemberDTO;
import com.dto.MemberFileDTO;
import com.dto.NewsDTO;
import com.dto.StoriesDTO;
import com.dto.UploadFileDTO;

public class EventBO {

	public String addEvent(EventDTO eventDto) {
		EventDAO dao = new EventDAO();
		return dao.addEvent(eventDto);
	}
	public ArrayList<EventDTO> getEventDetails() {
		EventDAO dao = new EventDAO();
		ArrayList<EventDTO> eventdto = new ArrayList<EventDTO>();
		return dao.getEventDetails();
		
	}
	
	public ArrayList<EventDTO> getEventProfile(EventDTO eventDto){
	     EventDAO dao = new EventDAO();
	     return dao.getEventProfile(eventDto);
	}
	
	public String eventUpdate(EventDTO eventDto) {
		EventDAO dao = new EventDAO();
		return dao.eventUpdate(eventDto);
	}
	public String deleteEvent(EventDTO eventDto){
	     EventDAO  dao = new EventDAO();
	     return dao.deleteEvent(eventDto);
	}
	public ArrayList<EventDTO> searchEvent(EventDTO eventDto){
	     EventDAO dao= new EventDAO();
	     return dao.searchEvent(eventDto);
	}
	public ArrayList<EventDTO> updatedEvent(ArrayList<EventDTO> eventList){
	     EventDAO dao= new EventDAO();
	     String sFilePath = null;
			try {
				if(eventList != null && eventList.size() > 0){
					for (EventDTO eventDTO : eventList) {
						String sEventId = eventDTO.getEventId();
						//System.out.println("sMemberId==="+sMemberId);
						
						EventFileDTO eventFileDTO = new EventFileDTO();
						eventFileDTO.setEventId(sEventId);
						
						EventFileBO eventFileBO = new EventFileBO();
						ArrayList<UploadFileDTO> lstUploadFiledto = eventFileBO.getUploadFleByEventId(eventFileDTO);
						//System.out.println("lstUploadFiledto.size==="+lstUploadFiledto.size());
						
						if(lstUploadFiledto != null && lstUploadFiledto.size() > 0){
							for(UploadFileDTO uploadFileDTO : lstUploadFiledto){
								String  sFilePathExt = uploadFileDTO.getFilePath();
								sFilePath = sFilePathExt;
							}
						}else{
							String sDefaultPath = "images/uploads/blankMale.jpg";
							sFilePath = sDefaultPath;
						}
						System.out.println("sEventId===="+sEventId+"========sFilePath==="+sFilePath);
						eventDTO.setFilePath(sFilePath);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	     return eventList;
	}
}
