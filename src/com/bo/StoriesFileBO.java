package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.dao.NewsFileDAO;
import com.dao.StoriesFileDAO;
import com.dto.NewsFileDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;

public class StoriesFileBO {

	public String storiesFile(StoriesFileDTO storiesFileDto) {
		StoriesFileDAO dao = new StoriesFileDAO();
		return dao.storiesFile(storiesFileDto);
	}
	public ArrayList<UploadFileDTO> getStoriesImages(StoriesFileDTO storiesFileDto){
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		return storiesFileDao.getStoriesImages(storiesFileDto);
		}
	public ArrayList<UploadFileDTO> getUploadFleByStoriesId(StoriesFileDTO storiesFileDTO) {
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = storiesFileDao.getUploadFleByStoriesId(storiesFileDTO);
		return uploadFiledto;
	}
	public String deleteStoriesFile(StoriesFileDTO storiesFileDTO) {
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		return storiesFileDao.deleteStoriesFile(storiesFileDTO);
	}
	public ArrayList<UploadFileDTO> getStoriesFilesByFileId(StoriesFileDTO storiesFileDTO) {
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		return storiesFileDao.getStoriesFilesByFileId(storiesFileDTO);
	}
	public ArrayList<StoriesFileDTO> getStoriesFileByFileId(StoriesFileDTO storiesFileDTO) {
		StoriesFileDAO storiesFileDao = new StoriesFileDAO();
		return storiesFileDao.getStoriesFileByFileId(storiesFileDTO);
	}
	public ArrayList<UploadFileDTO> deleteFileStories(String sFileId, String sPath) {

		String sStoriesId = null;
		String sExstFilePath = null;
		String deleteFilePath = null;
		String sDelFileUpload = null;
		String sDelRef = null;
		boolean bFileDeleted = false;
		StoriesFileDTO storiesFileDto = null;
		UploadFileBO fileBo = null;
		ArrayList<StoriesFileDTO> lstStoriesFileDto = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;

		try {
			// ********* getting stroies Id **********//
			storiesFileDto = new StoriesFileDTO();
			storiesFileDto.setFileId(sFileId);
			lstStoriesFileDto = getStoriesFileByFileId(storiesFileDto);
			if (lstStoriesFileDto != null && lstStoriesFileDto.size() > 0) {
				for (int i = 0; i < lstStoriesFileDto.size(); i++) {
					StoriesFileDTO objStoriesFileDto = lstStoriesFileDto.get(i);
					sStoriesId = objStoriesFileDto.getStoriesId();
				}
			}

			// ********* getting File path **********//
			storiesFileDto.setStoriesId(sStoriesId);
			ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByStoriesId(storiesFileDto);
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
				System.out.println("g. ==deleteFile Exists==");
				newFile.delete();
				bFileDeleted = true;
			}


			if (bFileDeleted) {
				// ********* deleting data from tables **********//
				fileBo = new UploadFileBO();
				sDelFileUpload = fileBo.deleteImage(sFileId);
				sDelRef = deleteStoriesFile(storiesFileDto);

				// ********* getting updated list**********//
				lstLatestUploadFiles = getStoriesImages(storiesFileDto);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return lstLatestUploadFiles;
	}
}
