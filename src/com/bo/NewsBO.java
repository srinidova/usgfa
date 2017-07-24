package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.NewsFileDAO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;

public class NewsBO {

	public String addNewsDetails(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.setNewsDetails(newsDto);
	}

	public ArrayList<NewsDTO> getNewsDetails() {
		NewsDAO dao = new NewsDAO();
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		return dao.getNewsDetails();
	}

	public String deleteNews(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.deleteNews(newsDto);
	}

	public ArrayList<NewsDTO> getNewsProfile(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.getNewsProfile(newsDto);
	}

	public String newsUpdate(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.newsUpdate(newsDto);
	}
	public ArrayList<NewsDTO> searchNews(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.searchNews(newsDto);
	}
	public ArrayList<NewsDTO> getNewsDetailsHome(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.getNewsDetailsHome(newsDto);
	}
	public ArrayList<NewsDTO> getPublicImagesHome(NewsDTO newsDto) {
		NewsDAO dao = new NewsDAO();
		return dao.getPublicImagesHome(newsDto);
	}
}
