package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.StoriesDAO;
import com.dto.NewsDTO;
import com.dto.StoriesDTO;

public class StoriesBO {

	public String addStories(StoriesDTO storiesDto) {
		//System.out.println("2. In StoriesBO---------- addStroies===" + storiesDto.getFarmName());
		StoriesDAO dao = new StoriesDAO();
		return dao.addStories(storiesDto);
		
	}
	public ArrayList<StoriesDTO> getStoriesDetails() {
		//System.out.println("2. In StoriesBO---------- getStoriesDetails===");
		StoriesDAO dao = new StoriesDAO();
		ArrayList<StoriesDTO> storiesdto = new ArrayList<StoriesDTO>();
		return dao.getStoriesDetails();
	}
	public String deleteStories(StoriesDTO storiesDto){
	     //System.out.println("2. In StoriesBO----------- getStoriesDelete====");
	     StoriesDAO dao = new StoriesDAO();
	     return dao.deleteStories(storiesDto);
		/*NewsDAO dao = new NewsDAO();
		return dao.deleteNews(newsDto);*/
	}
	public ArrayList<StoriesDTO> getStoriesProfile(StoriesDTO storiesDto){
	     //System.out.println("2. In StoriesBO----------- getStoriesProfile====");
		StoriesDAO dao = new StoriesDAO();
		return dao.getStoriesProfile(storiesDto);
	}
	public String storiesUpdate(StoriesDTO storiesDto) {
		//System.out.println("2. In StoriesBO---------- storiesUpdate===" + storiesDto.getTitle());
		StoriesDAO  dao = new StoriesDAO();
		return dao.storiesUpdate(storiesDto);
	}
}
