package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dao.EventFileDAO;
import com.dao.NewsFileDAO;
import com.dto.EventFileDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class EventFileBO {

	public String eventFile(EventFileDTO eventFileDto) {
		EventFileDAO dao = new EventFileDAO();
		return dao.eventFile(eventFileDto);
		
	}
	public ArrayList<UploadFileDTO> getEventImages(EventFileDTO eventFileDto){
		EventFileDAO eventFileDao = new EventFileDAO();
		return eventFileDao.getEventImages(eventFileDto);
			
		}
	public ArrayList<UploadFileDTO> getUploadFleByEventId(EventFileDTO eventFileDTO) {
		EventFileDAO eventFileDAO = new EventFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = eventFileDAO.getUploadFleByEventId(eventFileDTO);
		return uploadFiledto;
	}
	public String deleteEventFile(EventFileDTO eventFileDTO){
		EventFileDAO eventFileDAO = new EventFileDAO();
		return eventFileDAO.deleteEventFile(eventFileDTO);
	}
	public ArrayList<UploadFileDTO> getEventFilesByFileId(EventFileDTO eventFileDTO){
		EventFileDAO eventFileDAO = new EventFileDAO();
		return eventFileDAO.getEventFilesByFileId(eventFileDTO);
	}
	public ArrayList<EventFileDTO> getEventFileByFileId(EventFileDTO eventFileDTO){
		EventFileDAO eventFileDAO = new EventFileDAO();
		return eventFileDAO.getEventFileByFileId(eventFileDTO);
	}

	public ArrayList<UploadFileDTO> deleteFileEvent(String sFileId, String sPath) {

		String sEventId = null;
		String sExstFilePath = null;
		String deleteFilePath = null;
		String sDelFileUpload = null;
		String sDelRef = null;
		boolean bFileDeleted = false;
		EventFileDTO eventFileDto = null;
		UploadFileBO fileBo = null;
		ArrayList<EventFileDTO> lstEventFileDto = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;
		
		try {
			// ********* getting event Id **********//
			eventFileDto = new EventFileDTO();
			eventFileDto.setFileId(sFileId);
			lstEventFileDto = getEventFileByFileId(eventFileDto);
			if (lstEventFileDto != null && lstEventFileDto.size() > 0) {
				for (int i = 0; i < lstEventFileDto.size(); i++) {
					EventFileDTO objEventFileDto = lstEventFileDto.get(i);
					sEventId = objEventFileDto.getEventId();
				}
			}

			// ********* getting File path **********//
			eventFileDto.setEventId(sEventId);
			ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByEventId(eventFileDto);
			if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
				for (int j = 0; j < lstUploadFileDTO.size(); j++) {
					UploadFileDTO uploadFileDTO = lstUploadFileDTO.get(j);
					String sExtFileId = uploadFileDTO.getFileId();
					if (sFileId.equals(sExtFileId)) {
						sExstFilePath = uploadFileDTO.getFilePath();
						break;
					}
				}
			}

			// ********* deleting physical file **********//
			deleteFilePath = sPath + sExstFilePath;
			File newFile = new File(deleteFilePath);
			if (newFile.exists()) {
				newFile.delete();
				bFileDeleted = true;
			}


			if (bFileDeleted) {
				// ********* deleting data from tables **********//
				fileBo = new UploadFileBO();
				sDelFileUpload = fileBo.deleteImage(sFileId);
				sDelRef = deleteEventFile(eventFileDto);

				// ********* getting updated list**********//
				lstLatestUploadFiles = getUploadFleByEventId(eventFileDto);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return lstLatestUploadFiles;
	}
	
}
