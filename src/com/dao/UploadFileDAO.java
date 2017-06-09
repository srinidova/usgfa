package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UploadFileDAO {
	public String addUploadFileDetails(UploadFileDTO uploadFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("UploadFile.addUploadFileDetails", uploadFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public String deleteImage(String fileId) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("UploadFile.deleteImage", fileId);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String updateShowAsPublic(UploadFileDTO uploadFileDTO) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("UploadFile.updateShowAsPublic", uploadFileDTO);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
