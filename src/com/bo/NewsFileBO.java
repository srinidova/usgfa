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
		//UploadFileDAO dao = new UploadFileDAO();
		return dao.newsFile(newsFileDto);
		//return dao.addUploadFileDetails(uploadFileDto);
	}
    public ArrayList<UploadFileDTO> getNewsImages(NewsFileDTO newsFileDto){
	System.out.println("2. In newsFile---------- newsFile===" + newsFileDto.getNewsId());
	//System.out.println("2. In newsFile---------- newsFile===" + uploadFileDto.);
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsImages(newsFileDto);
	}
}
