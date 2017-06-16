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

			session.insert("ProgramFile.programFile", programFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<UploadFileDTO> getProgramImages(ProgramFileDTO programFileDTO) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getProgramImages", programFileDTO.getProgramId());

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getUploadFleByProgramId(ProgramFileDTO programFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByProgramId",
					programFileDTO.getProgramId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}

	public String deleteProgramFile(ProgramFileDTO programFileDTO) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("ProgramFile.deleteProgramFile", programFileDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getProgramFilesByFileId(ProgramFileDTO programFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("programFileDto.getFileId =="+programFileDTO.getFileId());
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getProgramFilesByFileId", programFileDTO.getFileId());
			System.out.println("uploadFiledto.size =="+uploadFiledto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<ProgramFileDTO> getProgramFileByFileId(ProgramFileDTO programFileDTO) {
		ArrayList<ProgramFileDTO> programFileDto = new ArrayList<ProgramFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("programFileDTO.getFileId =="+programFileDTO.getFileId());
			programFileDto = (ArrayList<ProgramFileDTO>) session.queryForList("ProgramFile.getProgramFileByFileId", programFileDTO.getFileId());
			System.out.println("programFileDTO.size =="+programFileDto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return programFileDto;
	}
	
}
