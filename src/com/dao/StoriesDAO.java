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

			//System.out.println("3. In StoriesDAO addStories---------- getStoriesName===" + storiesDto.getName());
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
			//System.out.println("3. In StoriesDAO getStoriesDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();

			storiesdto = (ArrayList<StoriesDTO>) session.queryForList("Stories.getStoriesDetails");
			//System.out.println("3. In StoriesDAO getStoriesDetails----------storiesdto==" + storiesdto);
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
			//System.out.println("3. In StoriesDAO getdeleteStories----------");
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
			System.out.println("3. In StoriesDAO getStoriesProfile----------");
			SqlMapClient session = new IbatisFactory().getSession();
			String sStoriesId = storiesDto.getStoriesId();

			//System.out.println("3b. In StoriesDAO getStoriesProfile----------sStoriesId==" + sStoriesId);
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

			//System.out.println("3. In StoriesDAO storiesUpdate---------- getStoriesTitle===" + storiesDto.getTitle());
			session.insert("Stories.storiesUpdate", storiesDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
