package com.bo;

import java.util.ArrayList;

import com.dao.EventFileDAO;
import com.dao.NewsFileDAO;
import com.dto.EventFileDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;

public class EventFileBO {

	public String eventFile(EventFileDTO eventFileDto) {
		//System.out.println("2. In eventFile---------- eventFile===" + eventFileDto.getFileId());
		EventFileDAO dao = new EventFileDAO();
		return dao.eventFile(eventFileDto);
		
	}
	public ArrayList<UploadFileDTO> getEventImages(EventFileDTO eventFileDto){
		//System.out.println("2. In eventFile---------- eventFile===" + eventFileDto.getEventId());
		EventFileDAO eventFileDao = new EventFileDAO();
		return eventFileDao.getEventImages(eventFileDto);
			
		}
}
