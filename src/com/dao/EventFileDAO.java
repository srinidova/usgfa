package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.EventFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class EventFileDAO {
	public String eventFile(EventFileDTO eventFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("EventFile.eventFile", eventFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<UploadFileDTO> getEventImages(EventFileDTO eventFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getEventImages", eventFileDto.getEventId());

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getUploadFleByEventId(EventFileDTO eventFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByEventId",
					eventFileDTO.getEventId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	public String deleteEventFile(EventFileDTO eventFileDTO) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("EventFile.deleteEventFile", eventFileDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getEventFilesByFileId(EventFileDTO eventFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getEventFilesByFileId", eventFileDTO.getFileId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<EventFileDTO> getEventFileByFileId(EventFileDTO eventFileDTO) {
		ArrayList<EventFileDTO> eventFileDto = new ArrayList<EventFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			eventFileDto = (ArrayList<EventFileDTO>) session.queryForList("EventFile.getEventFileByFileId", eventFileDTO.getFileId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eventFileDto;
	}
}
