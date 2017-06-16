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
		System.out.println("a. sFileId ==" + sFileId + "------------sPath ==" + sPath);

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
			// ********* getting news Id **********//
			eventFileDto = new EventFileDTO();
			eventFileDto.setFileId(sFileId);
			lstEventFileDto = getEventFileByFileId(eventFileDto);
			System.out.println("b. lstUploadFileDTO.size ==" + lstEventFileDto.size());
			if (lstEventFileDto != null && lstEventFileDto.size() > 0) {
				for (int i = 0; i < lstEventFileDto.size(); i++) {
					EventFileDTO objEventFileDto = lstEventFileDto.get(i);
					sEventId = objEventFileDto.getEventId();
				}
			}
			System.out.println("c. sEventId==" + sEventId);

			// ********* getting File path **********//
			eventFileDto.setEventId(sEventId);
			ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByEventId(eventFileDto);
			System.out.println("c1. lstUploadFileDTO.size ==" + lstUploadFileDTO.size());
			if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
				for (int j = 0; j < lstUploadFileDTO.size(); j++) {
					UploadFileDTO uploadFileDTO = lstUploadFileDTO.get(j);
					String sExtFileId = uploadFileDTO.getFileId();
					System.out.println("c2. fileId ==" + sFileId + "------------sExtFileId ==" + sExtFileId);
					if (sFileId.equals(sExtFileId)) {
						sExstFilePath = uploadFileDTO.getFilePath();
						break;
					}
				}
			}
			System.out.println("d. sExstFilePath==" + sExstFilePath);

			// ********* deleting physical file **********//
			System.out.println("e. path==" + sPath);
			deleteFilePath = sPath + sExstFilePath;
			System.out.println("f. deleteFilePath==" + deleteFilePath);
			File newFile = new File(deleteFilePath);
			if (newFile.exists()) {
				System.out.println("g. ==deleteFile Exists==");
				newFile.delete();
				bFileDeleted = true;
			}
			System.out.println("h.bFileDeleted==" + bFileDeleted);


			if (bFileDeleted) {
				// ********* deleting data from tables **********//
				fileBo = new UploadFileBO();
				sDelFileUpload = fileBo.deleteImage(sFileId);
				System.out.println("i. sDelFileUpload==" + sDelFileUpload);
				sDelRef = deleteEventFile(eventFileDto);
				System.out.println("j. sDelRef==" + sDelRef);

				// ********* getting updated list**********//
				System.out.println("j. getFileId==" + eventFileDto.getFileId() + "------------- getNewsId=="+ eventFileDto.getEventId());
				lstLatestUploadFiles = getUploadFleByEventId(eventFileDto);
				System.out.println("l. lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return lstLatestUploadFiles;
	}
	
}
