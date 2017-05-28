package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.NewsFileDAO;
import com.dao.UploadFileDAO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;

public class NewsFileBO {

	public String newsFile(NewsFileDTO newsFileDto) {
		System.out.println("2. In newsFile---------- newsFile===" + newsFileDto.getFileId());
		NewsFileDAO dao = new NewsFileDAO();
		return dao.newsFile(newsFileDto);
	}

	public ArrayList<UploadFileDTO> getNewsImages(NewsFileDTO newsFileDto) {
		System.out.println("2. In newsFile---------- newsFile===" + newsFileDto.getNewsId());
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsImages(newsFileDto);
	}

	public ArrayList<UploadFileDTO> getUploadFleByNewsId(NewsFileDTO newsFileDTO) {
		//System.out.println("2. In NewsFileBO---------- getUploadFleByNewsId ===" + newsFileDTO.getNewsId());
		NewsFileDAO newsFileDao = new NewsFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = newsFileDao.getUploadFleByNewsId(newsFileDTO);
		//System.out.println("2.a. In NewsFileBO ---------- uploadFiledto.size===" + uploadFiledto.size());
		return uploadFiledto;
	}

	public String deleteNewsFile(NewsFileDTO newsFileDto) {
		//System.out.println("2. In NewsFileBO----------- deleteNewsFile====");
		NewsFileDAO dao = new NewsFileDAO();
		return dao.deleteNewsFile(newsFileDto);
	}
}
