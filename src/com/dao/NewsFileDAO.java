package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class NewsFileDAO {
	public String newsFile(NewsFileDTO newsFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			System.out.println("3. In NewsFileDAO newsFile---------- getNewsTitle===" + newsFileDto.getNewsId());
			session.insert("NewsFile.newsFile", newsFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
