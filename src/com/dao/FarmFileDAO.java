package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.FarmFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class FarmFileDAO {
	public String farmFile(FarmFileDTO farmFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("FarmFile.farmFile", farmFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
