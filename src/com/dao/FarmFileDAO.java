package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.FarmFileDTO;
import com.dto.MemberFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class FarmFileDAO {
	public String farmFile(FarmFileDTO farmFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("FarmFile.farmFile", farmFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<UploadFileDTO> getFarmImages(FarmFileDTO farmFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			System.out.println("3.a In FarmDAO getFarmImages---------- fileId===" + farmFileDto.getFarmId());
			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getFarmImages", farmFileDto.getFarmId());
			System.out.println("3.b lstUploadFileDTO.size===="+lstUploadFileDTO.size());
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getUploadFleByFarmId(FarmFileDTO farmFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByFarmId",
					farmFileDTO.getFarmId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}

	public String deleteFarmFile(FarmFileDTO farmFileDTO) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("FarmFile.deleteFarmFile", farmFileDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getFarmFilesByFileId(FarmFileDTO farmFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("farmFileDTO.getFileId =="+farmFileDTO.getFileId());
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getFarmFilesByFileId", farmFileDTO.getFileId());
			System.out.println("uploadFiledto.size =="+uploadFiledto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<FarmFileDTO> getFarmFileByFileId(FarmFileDTO farmFileDTO) {
		ArrayList<FarmFileDTO> farmFileDto = new ArrayList<FarmFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("farmFileDTO.getFileId =="+farmFileDTO.getFileId());
			farmFileDto = (ArrayList<FarmFileDTO>) session.queryForList("FarmFile.getFarmFileByFileId", farmFileDTO.getFileId());
			System.out.println("farmFileDto.size =="+farmFileDto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return farmFileDto;
	}
}
