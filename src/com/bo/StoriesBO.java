package com.bo;

import java.util.ArrayList;

import com.dao.EventDAO;
import com.dao.NewsDAO;
import com.dao.StoriesDAO;
import com.dto.NewsDTO;
import com.dto.StoriesDTO;
import com.dto.UploadFileDTO;

public class StoriesBO {

	public String addStories(StoriesDTO storiesDto) {
		StoriesDAO dao = new StoriesDAO();
		return dao.addStories(storiesDto);
		
	}
	public ArrayList<StoriesDTO> getStoriesDetails() {
		StoriesDAO dao = new StoriesDAO();
		ArrayList<StoriesDTO> storiesdto = new ArrayList<StoriesDTO>();
		return dao.getStoriesDetails();
	}
	public String deleteStories(StoriesDTO storiesDto){
	     StoriesDAO dao = new StoriesDAO();
	     return dao.deleteStories(storiesDto);
	}
	public ArrayList<StoriesDTO> getStoriesProfile(StoriesDTO storiesDto){
		StoriesDAO dao = new StoriesDAO();
		return dao.getStoriesProfile(storiesDto);
	}
	public String storiesUpdate(StoriesDTO storiesDto) {
		StoriesDAO  dao = new StoriesDAO();
		return dao.storiesUpdate(storiesDto);
	}
    
}
