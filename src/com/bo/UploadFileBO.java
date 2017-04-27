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
	
}
