package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.NewsDTO;
import com.dto.StoriesDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class StoriesDAO {
	public String addStories(StoriesDTO storiesDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("Stories.addStories", storiesDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<StoriesDTO> getStoriesDetails() {
		ArrayList<StoriesDTO> storiesdto = new ArrayList<StoriesDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			storiesdto = (ArrayList<StoriesDTO>) session.queryForList("Stories.getStoriesDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!storiesdto.equals(null)) {
			return storiesdto;
		} else {
			return storiesdto;
		}
	}

	public String deleteStories(StoriesDTO storiesDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Stories.deleteStories", storiesDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<StoriesDTO> getStoriesProfile(StoriesDTO storiesDto) {
		ArrayList<StoriesDTO> storiesdto = new ArrayList<StoriesDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			String sStoriesId = storiesDto.getStoriesId();

			storiesdto = (ArrayList<StoriesDTO>) session.queryForList("Stories.getStoriesById", sStoriesId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return storiesdto;
	}

	public String storiesUpdate(StoriesDTO storiesDto){
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("Stories.storiesUpdate", storiesDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<StoriesDTO> searchStories(StoriesDTO storiesDto) {
		ArrayList<StoriesDTO> storiesdto = new ArrayList<StoriesDTO>();
		boolean bAnd = false;
		String sQuery = null;
		//System.out.println("in to memberDAO");
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sName = storiesDto.getName();
			String sFarmName = storiesDto.getFarmName();
			String sPlace = storiesDto.getPlace();
			
			
			System.out.println("3.a In StoriesDAO searchStories---------- sName===" + sName);
			System.out.println("3.b In StoriesDAO searchStories---------- sFarmName===" + sFarmName);
			System.out.println("3.c In StoriesDAO searchStories---------- sPlace===" + sPlace);

			storiesdto = (ArrayList<StoriesDTO>) session.queryForList("Stories.storiesSearch", storiesDto);
			System.out.println("in to stories Update size"+storiesdto.size());
	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return storiesdto;
	}
}
