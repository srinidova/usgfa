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

			// System.out.println("3. In NewsDAO setNewsDetails----------
			// getNewsTitle===" + newsDto.getNewsTitle());
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
			// System.out.println("3. In NewsDAO getNewsDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();

			newsdto = (ArrayList<NewsDTO>) session.queryForList("News.getNewsDetails");
			// System.out.println("3. In NewsDAO
			// getNewsDetails----------newsdto==" + newsdto);
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
			// System.out.println("3. In NewsDAO getdeleteNews----------");
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
			// System.out.println("3. In NewsDAO getNewsProfile----------");
			SqlMapClient session = new IbatisFactory().getSession();

			String sNewsId = newsDto.getNewsId();
			// System.out.println("3b. In NewsDAO
			// getNewsProfile----------sNewsId==" + sNewsId);
			newsdto = (ArrayList<NewsDTO>) session.queryForList("News.getNewsById", sNewsId);

			// System.out.println("3c. In NewsDAO
			// getNewsProfile----------newsdto1 size==" + newsdto.size());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsdto;
	}

	public String newsUpdate(NewsDTO newsDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			// System.out.println("3. In NewsDAO newsUpdate----------
			// getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("News.newsUpdate", newsDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
