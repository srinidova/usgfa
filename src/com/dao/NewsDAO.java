package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.MemberDTO;
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

	@SuppressWarnings("unchecked")
	public ArrayList<NewsDTO> searchNews(NewsDTO newsDto) {
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		boolean bAnd = false;
		String sQuery = null;
		//System.out.println("in to memberDAO");
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sNameTitle = newsDto.getNewsTitle();
			String sPaper = newsDto.getPaper();
			String sLink = newsDto.getLink();
			
			
			System.out.println("3.a In NewsDAO searchNews---------- sNameTitle===" + sNameTitle);
			System.out.println("3.b In NewsDAO searchNews---------- sPaper===" + sPaper);
			System.out.println("3.c In NewsDAO searchNews---------- sLink===" + sLink);

			newsdto = (ArrayList<NewsDTO>) session.queryForList("News.newsSearch", newsDto);
			System.out.println("in to news Update size"+newsdto.size());
	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return newsdto;
	}
}
