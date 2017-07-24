package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.UploadFileDAO;
import com.dto.NewsDTO;
import com.dto.UploadFileDTO;

public class UploadFileBO {

	public String addUploadFileDetails(UploadFileDTO uploadFileDto) {
		UploadFileDAO dao = new UploadFileDAO();
		return dao.addUploadFileDetails(uploadFileDto);
	}
	
	public String deleteImage(String fileId) {
		UploadFileDAO dao = new UploadFileDAO();
		return dao.deleteImage(fileId);
	}
	
	public String updateShowAsPublic(UploadFileDTO uploadFileDTO) {
		UploadFileDAO dao = new UploadFileDAO();
		return dao.updateShowAsPublic(uploadFileDTO);
	}
	public ArrayList<UploadFileDTO> getPublicImagesHome(UploadFileDTO uploadFileDTO) {
		UploadFileDAO dao = new UploadFileDAO();
		return dao.getPublicImagesHome(uploadFileDTO);
	}
	public ArrayList<UploadFileDTO> getPublicVideosHome(UploadFileDTO uploadFileDTO) {
		UploadFileDAO dao = new UploadFileDAO();
		return dao.getPublicVideosHome(uploadFileDTO);
	}
}
