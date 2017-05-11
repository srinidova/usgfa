package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.StoriesDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.NewsDTO;
import com.dto.StoriesDTO;
import com.dto.UploadFileDTO;

public class EventBO {

	public String addEvent(EventDTO eventDto) {
		//System.out.println("2. In EventBO---------- addNewsDetails===" + eventDto.getEventName());
		EventDAO dao = new EventDAO();
		//NewsDAO dao = new NewsDAO();
		return dao.addEvent(eventDto);
	}
	public ArrayList<EventDTO> getEventDetails() {
		//System.out.println("2. In EventBO---------- getEventDetails===");
		EventDAO dao = new EventDAO();
		ArrayList<EventDTO> eventdto = new ArrayList<EventDTO>();
		return dao.getEventDetails();
		
	}
	
	public ArrayList<EventDTO> getEventProfile(EventDTO eventDto){
	     //System.out.println("2. In EventBO----------- getEventProfile====");
	     EventDAO dao = new EventDAO();
		//NewsDAO dao = new NewsDAO();
	     return dao.getEventProfile(eventDto);
		//return dao.getNewsProfile(newsDto);
	}
	
	
	public String eventUpdate(EventDTO eventDto) {
		//System.out.println("2. In EventBO---------- eventUpdate===" + eventDto.getEventName());
		EventDAO dao = new EventDAO();
		return dao.eventUpdate(eventDto);
		//NewsDAO dao = new NewsDAO();
		//return dao.newsUpdate(newsDto);
	}
	public String deleteEvent(EventDTO eventDto){
	     //System.out.println("2. In EventBO----------- getEventDelete====");
	     EventDAO  dao = new EventDAO();
	     return dao.deleteEvent(eventDto);
	     //return dao.addEvent(eventDto);
		/*NewsDAO dao = new NewsDAO();
		return dao.deleteNews(newsDto);*/
	}
public String getEventImage(UploadFileDTO uploadFileDto){
		
		EventDAO dao = new EventDAO();
        return dao.getEventImage(uploadFileDto);
}
}
