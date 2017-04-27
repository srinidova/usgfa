package com.bo;

import com.dao.StoriesFileDAO;
import com.dto.StoriesFileDTO;

public class StoriesFileBO {

	public String storiesFile(StoriesFileDTO storiesFileDto) {
		System.out.println("2. In storiesFile---------- storiesFile===" + storiesFileDto.getFileId());
		StoriesFileDAO dao = new StoriesFileDAO();
		return dao.storiesFile(storiesFileDto);
		/*EventFileDAO dao = new EventFileDAO();
		return dao.eventFile(eventFileDto);*/
		
	}
	
}
