package com.bo;

import com.dao.EventFileDAO;
import com.dto.EventFileDTO;

public class EventFileBO {

	public String eventFile(EventFileDTO eventFileDto) {
		System.out.println("2. In eventFile---------- eventFile===" + eventFileDto.getFileId());
		EventFileDAO dao = new EventFileDAO();
		return dao.eventFile(eventFileDto);
		
	}
	
}
