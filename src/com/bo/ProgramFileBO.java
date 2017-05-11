package com.bo;

import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.NewsFileDAO;
import com.dao.ProgramFileDAO;
import com.dao.UploadFileDAO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.UploadFileDTO;

public class ProgramFileBO {

	public String programFile(ProgramFileDTO programFileDto) {
		System.out.println("2. In programFile---------- programFile===" + programFileDto.getFileId());
		ProgramFileDAO dao = new ProgramFileDAO();
		return dao.programFile(programFileDto);
	}
	public ArrayList<UploadFileDTO> getProgramImages(ProgramFileDTO programFileDto){
		System.out.println("2. In programFile---------- programFile===" + programFileDto.getProgramId());
		//System.out.println("2. In newsFile---------- newsFile===" + uploadFileDto.);
		ProgramFileDAO programFileDao = new ProgramFileDAO();
			NewsFileDAO newsFileDao = new NewsFileDAO();
			return programFileDao.getProgramImages(programFileDto);
			//return newsFileDao.getNewsImages(newsFileDto);
		}
}
