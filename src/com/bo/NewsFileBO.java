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
		NewsFileDAO dao = new NewsFileDAO();
		return dao.newsFile(newsFileDto);
	}

	public ArrayList<UploadFileDTO> getNewsImages(NewsFileDTO newsFileDto) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsImages(newsFileDto);
	}

	public ArrayList<UploadFileDTO> getUploadFleByNewsId(NewsFileDTO newsFileDTO) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = newsFileDao.getUploadFleByNewsId(newsFileDTO);
		return uploadFiledto;
	}

	public String deleteNewsFile(NewsFileDTO newsFileDto) {
		NewsFileDAO dao = new NewsFileDAO();
		return dao.deleteNewsFile(newsFileDto);
	}
	
	public ArrayList<UploadFileDTO> getNewsFilesByFileId(NewsFileDTO newsFileDto) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsFilesByFileId(newsFileDto);
	}
	
	public ArrayList<NewsFileDTO> getNewsFileByFileId(NewsFileDTO newsFileDto) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsFileByFileId(newsFileDto);
	}
}
