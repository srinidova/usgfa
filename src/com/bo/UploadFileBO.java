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
}
