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

			session.insert("NewsFile.newsFile", newsFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<UploadFileDTO> getNewsImages(NewsFileDTO newsFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getNewsImages", newsFileDto.getNewsId());

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getUploadFleByNewsId(NewsFileDTO newsFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByNewsId",
					newsFileDTO.getNewsId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}

	public String deleteNewsFile(NewsFileDTO newsFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("NewsFile.deleteNewsFile", newsFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
