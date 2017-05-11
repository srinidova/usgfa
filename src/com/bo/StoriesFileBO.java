package com.bo;

import java.util.ArrayList;

import com.dao.NewsFileDAO;
import com.dao.StoriesFileDAO;
import com.dto.NewsFileDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;

public class StoriesFileBO {

	public String storiesFile(StoriesFileDTO storiesFileDto) {
		System.out.println("2. In storiesFile---------- storiesFile===" + storiesFileDto.getFileId());
		StoriesFileDAO dao = new StoriesFileDAO();
		return dao.storiesFile(storiesFileDto);
		/*EventFileDAO dao = new EventFileDAO();
		return dao.eventFile(eventFileDto);*/
		
	}
	public ArrayList<UploadFileDTO> getStoriesImages(StoriesFileDTO storiesFileDto){
		System.out.println("2. In storiesFile---------- storiesFile===" + storiesFileDto.getStoriesId());
		//System.out.println("2. In newsFile---------- newsFile===" + uploadFileDto.);
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		return storiesFileDao.getStoriesImages(storiesFileDto);
			//NewsFileDAO newsFileDao = new NewsFileDAO();
			//return newsFileDao.getNewsImages(newsFileDto);
		}
}
