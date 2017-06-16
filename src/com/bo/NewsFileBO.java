package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.NewsFileDAO;
import com.dao.UploadFileDAO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;

public class NewsFileBO {

	public String newsFile(NewsFileDTO newsFileDto) {
		NewsFileDAO dao = new NewsFileDAO();
		return dao.newsFile(newsFileDto);
	}

	public ArrayList<UploadFileDTO> getNewsImages(NewsFileDTO newsFileDto) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsImages(newsFileDto);
	}

	public ArrayList<UploadFileDTO> getUploadFleByNewsId(NewsFileDTO newsFileDTO) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = newsFileDao.getUploadFleByNewsId(newsFileDTO);
		return uploadFiledto;
	}

	public String deleteNewsFile(NewsFileDTO newsFileDto) {
		NewsFileDAO dao = new NewsFileDAO();
		return dao.deleteNewsFile(newsFileDto);
	}
	
	public ArrayList<UploadFileDTO> getNewsFilesByFileId(NewsFileDTO newsFileDto) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsFilesByFileId(newsFileDto);
	}
	
	public ArrayList<NewsFileDTO> getNewsFileByFileId(NewsFileDTO newsFileDto) {
		NewsFileDAO newsFileDao = new NewsFileDAO();
		return newsFileDao.getNewsFileByFileId(newsFileDto);
	}
	
	public ArrayList<UploadFileDTO> deleteFileNews(String sFileId, String sPath) {
		System.out.println("a. sFileId ==" + sFileId + "------------sPath ==" + sPath);

		String sNewsId = null;
		String sExstFilePath = null;
		String deleteFilePath = null;
		String sDelFileUpload = null;
		String sDelRef = null;
		boolean bFileDeleted = false;
		NewsFileDTO newsFileDto = null;
		UploadFileBO fileBo = null;
		ArrayList<NewsFileDTO> lstNewsFileDto = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;

		try {
			// ********* getting news Id **********//
			newsFileDto = new NewsFileDTO();
			newsFileDto.setFileId(sFileId);
			lstNewsFileDto = getNewsFileByFileId(newsFileDto);
			System.out.println("b. lstUploadFileDTO.size ==" + lstNewsFileDto.size());
			if (lstNewsFileDto != null && lstNewsFileDto.size() > 0) {
				for (int i = 0; i < lstNewsFileDto.size(); i++) {
					NewsFileDTO objNewsFileDto = lstNewsFileDto.get(i);
					sNewsId = objNewsFileDto.getNewsId();
				}
			}
			System.out.println("c. sNewsId==" + sNewsId);

			// ********* getting File path **********//
			newsFileDto.setNewsId(sNewsId);
			ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByNewsId(newsFileDto);
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
				sDelRef = deleteNewsFile(newsFileDto);
				System.out.println("j. sDelRef==" + sDelRef);

				// ********* getting updated list**********//
				System.out.println("j. getFileId==" + newsFileDto.getFileId() + "------------- getNewsId=="+ newsFileDto.getNewsId());
				lstLatestUploadFiles = getUploadFleByNewsId(newsFileDto);
				System.out.println("l. lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return lstLatestUploadFiles;
	}
}
