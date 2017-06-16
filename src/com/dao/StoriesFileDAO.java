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
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getUploadFleByStoriesId(StoriesFileDTO storiesFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByStoriesId",
					storiesFileDTO.getStoriesId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	public String deleteStoriesFile(StoriesFileDTO storiesFileDTO) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("StoriesFile.deleteStoriesFile", storiesFileDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getStoriesFilesByFileId(StoriesFileDTO storiesFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("storiesFileDTO.getFileId =="+storiesFileDTO.getFileId());
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getStoriesFilesByFileId", storiesFileDTO.getFileId());
			System.out.println("uploadFiledto.size =="+uploadFiledto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<StoriesFileDTO> getStoriesFileByFileId(StoriesFileDTO storiesFileDTO) {
		ArrayList<StoriesFileDTO> storiesFileDto = new ArrayList<StoriesFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("storiesFileDTO.getFileId =="+storiesFileDTO.getFileId());
			storiesFileDto = (ArrayList<StoriesFileDTO>) session.queryForList("StoriesFile.getStoriesFileByFileId", storiesFileDTO.getFileId());
			System.out.println("storiesFileDto.size =="+storiesFileDto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return storiesFileDto;
	}
}
