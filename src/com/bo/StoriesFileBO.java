package com.bo;

import java.util.ArrayList;

import com.dao.NewsFileDAO;
import com.dao.StoriesFileDAO;
import com.dto.NewsFileDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;

public class StoriesFileBO {

	public String storiesFile(StoriesFileDTO storiesFileDto) {
		StoriesFileDAO dao = new StoriesFileDAO();
		return dao.storiesFile(storiesFileDto);
	}
	public ArrayList<UploadFileDTO> getStoriesImages(StoriesFileDTO storiesFileDto){
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		return storiesFileDao.getStoriesImages(storiesFileDto);
		}
}
