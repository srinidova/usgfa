package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
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

			//System.out.println("3. In NewsDAO setNewsDetails---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("StoriesFile.storiesFile", storiesFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
