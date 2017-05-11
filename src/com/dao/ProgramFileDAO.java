package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProgramFileDAO {
	public String programFile(ProgramFileDTO programFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In NewsDAO setNewsDetails---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("ProgramFile.programFile", programFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<UploadFileDTO> getProgramImages(ProgramFileDTO programFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			System.out.println("3. In ProgramDAO getProgramImage---------- fileId===" + programFileDto.getProgramId());
			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getProgramImages", programFileDto.getProgramId());

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
	

	
}
