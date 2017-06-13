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
	
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getNewsFilesByFileId(NewsFileDTO newsFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("newsFileDTO.getFileId =="+newsFileDTO.getFileId());
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getNewsFilesByFileId", newsFileDTO.getFileId());
			System.out.println("uploadFiledto.size =="+uploadFiledto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<NewsFileDTO> getNewsFileByFileId(NewsFileDTO newsFileDTO) {
		ArrayList<NewsFileDTO> newsFileDto = new ArrayList<NewsFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("newsFileDTO.getFileId =="+newsFileDTO.getFileId());
			newsFileDto = (ArrayList<NewsFileDTO>) session.queryForList("NewsFile.getNewsFileByFileId", newsFileDTO.getFileId());
			System.out.println("newsFileDto.size =="+newsFileDto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsFileDto;
	}
}
