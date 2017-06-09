package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.NewsDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class NewsDAO {
	public String setNewsDetails(NewsDTO newsDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("News.setNewsDetails", newsDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<NewsDTO> getNewsDetails() {
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			newsdto = (ArrayList<NewsDTO>) session.queryForList("News.getNewsDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!newsdto.equals(null)) {
			return newsdto;
		} else {
			return newsdto;
		}
	}

	public String deleteNews(NewsDTO newsDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("News.deleteNews", newsDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<NewsDTO> getNewsProfile(NewsDTO newsDto) {
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			String sNewsId = newsDto.getNewsId();
			newsdto = (ArrayList<NewsDTO>) session.queryForList("News.getNewsById", sNewsId);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsdto;
	}

	public String newsUpdate(NewsDTO newsDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("News.newsUpdate", newsDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
