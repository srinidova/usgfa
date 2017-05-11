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

			//System.out.println("3. In NewsDAO eventFile---------- eventFile===" + eventFileDto.getNewsTitle());
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

			System.out.println("3. In EventDAO getEventImage---------- fileId===" + eventFileDto.getEventId());
			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getEventImages", eventFileDto.getEventId());

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
	
	
}
