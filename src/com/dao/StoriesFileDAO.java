package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.EventFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class StoriesFileDAO {
	public String storiesFile(StoriesFileDTO storiesFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("StoriesFile.storiesFile", storiesFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<UploadFileDTO> getStoriesImages(StoriesFileDTO storiesFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getStoriesImages", storiesFileDto.getStoriesId());
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
}
