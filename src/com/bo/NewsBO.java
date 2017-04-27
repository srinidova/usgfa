package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dto.NewsDTO;

public class NewsBO {

	public String addNewsDetails(NewsDTO newsDto) {
		//System.out.println("2. In NewsBO---------- addNewsDetails===" + newsDto.getNewsTitle());
		NewsDAO dao = new NewsDAO();
		return dao.setNewsDetails(newsDto);
	}
	public ArrayList<NewsDTO> getNewsDetails() {
		//System.out.println("2. In NewsBO---------- getNewsDetails===");
		NewsDAO dao = new NewsDAO();
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		return dao.getNewsDetails();
	}
	public String deleteNews(NewsDTO newsDto){
	     //System.out.println("2. In NewsBO----------- getNewsDelete====");
		NewsDAO dao = new NewsDAO();
		return dao.deleteNews(newsDto);
	}
	public ArrayList<NewsDTO> getNewsProfile(NewsDTO newsDto){
	     //System.out.println("2. In NewsBO----------- getNewsProfile====");
		NewsDAO dao = new NewsDAO();
		return dao.getNewsProfile(newsDto);
	}
	public String newsUpdate(NewsDTO newsDto) {
		//System.out.println("2. In NewsBO---------- newsUpdate===" + newsDto.getNewsTitle());
		NewsDAO dao = new NewsDAO();
		return dao.newsUpdate(newsDto);
	}
}
