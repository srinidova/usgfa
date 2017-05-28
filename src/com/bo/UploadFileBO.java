package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.UploadFileDAO;
import com.dto.NewsDTO;
import com.dto.UploadFileDTO;

public class UploadFileBO {

	public String addUploadFileDetails(UploadFileDTO uploadFileDto) {
		System.out.println("2. In addUploadFileBO---------- addUploadFileDetails===" + uploadFileDto.getFileId());
		UploadFileDAO dao = new UploadFileDAO();
		return dao.addUploadFileDetails(uploadFileDto);
	}
	
	public String deleteImage(String fileId) {
		//System.out.println("2. In deleteUpload---------- fileId===" +fileId);
		UploadFileDAO dao = new UploadFileDAO();
		return dao.deleteImage(fileId);
	}
	
	public String updateShowAsPublic(UploadFileDTO uploadFileDTO) {
		//System.out.println("2. In UploadFileBO---------- updateShowAsPublic===");
		UploadFileDAO dao = new UploadFileDAO();
		return dao.updateShowAsPublic(uploadFileDTO);
	}
}
