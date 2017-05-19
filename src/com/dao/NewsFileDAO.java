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
	public ArrayList<UploadFileDTO> getNewsImages(NewsFileDTO newsFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			System.out.println("3. In NewsDAO getNewsImage---------- fileId===" + newsFileDto.getNewsId());
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

			System.out.println("3. In UploadFileDAO ---------- newsFileDTO getNewsId===" + newsFileDTO.getNewsId());
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByNewsId", newsFileDTO.getNewsId());
			System.out.println("3.a. In UploadFileDAO ---------- uploadFiledto.size===" + uploadFiledto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	public String deleteNewsFile(NewsFileDTO newsFileDto) {
		String result = "fail";
		try {
			System.out.println("3. In NewsFileDAO deleteNewsFile----------getNewsId="+newsFileDto.getNewsId()+"------getFileId="+newsFileDto.getFileId());
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("NewsFile.deleteNewsFile", newsFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
