package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.dao.FarmFileDAO;
import com.dao.MemberFileDAO;
import com.dao.NewsFileDAO;
import com.dto.FarmFileDTO;
import com.dto.MemberFileDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;

public class FarmFileBO {

	public String farmFile(FarmFileDTO farmFileDto) {
		FarmFileDAO dao = new FarmFileDAO();
		return dao.farmFile(farmFileDto);
	}
	public ArrayList<UploadFileDTO> getFarmImages(FarmFileDTO farmFileDto){
		System.out.println("2. In farmFileBO---------- farmFile===" + farmFileDto.getFarmId());
		FarmFileDAO farmFileDao = new FarmFileDAO();
		return farmFileDao.getFarmImages(farmFileDto);
		}
	public ArrayList<UploadFileDTO> getUploadFleByFarmId(FarmFileDTO farmFileDTO) {
		FarmFileDAO farmFileDao = new FarmFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = farmFileDao.getUploadFleByFarmId(farmFileDTO);
		return uploadFiledto;
	}

	public String deleteFarmFile(FarmFileDTO farmFileDTO) {
		FarmFileDAO dao = new FarmFileDAO();
		return dao.deleteFarmFile(farmFileDTO);
	}
	
	public ArrayList<UploadFileDTO> getFarmFilesByFileId(FarmFileDTO farmFileDTO) {
		FarmFileDAO farmFileDao = new FarmFileDAO();
		return farmFileDao.getFarmFilesByFileId(farmFileDTO);
	}
	
	public ArrayList<FarmFileDTO> getFarmFileByFileId(FarmFileDTO farmFileDTO) {
		FarmFileDAO farmFileDao = new FarmFileDAO();
		return farmFileDao.getFarmFileByFileId(farmFileDTO);
	}
	public ArrayList<UploadFileDTO> deleteFileFarm(String sFileId, String sPath) {
		System.out.println("a. sFileId ==" + sFileId + "------------sPath ==" + sPath);

		String sFarmId = null;
		String sExstFilePath = null;
		String deleteFilePath = null;
		String sDelFileUpload = null;
		String sDelRef = null;
		boolean bFileDeleted = false;
		FarmFileDTO farmFileDto = null;
		UploadFileBO fileBo = null;
		ArrayList<FarmFileDTO> lstFarmFileDto = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;

		try {
			// ********* getting farm Id **********//
			farmFileDto = new FarmFileDTO();
			farmFileDto.setFileId(sFileId);
			lstFarmFileDto = getFarmFileByFileId(farmFileDto);
			System.out.println("b. lstUploadFileDTO.size ==" + lstFarmFileDto.size());
			if (lstFarmFileDto != null && lstFarmFileDto.size() > 0) {
				for (int i = 0; i < lstFarmFileDto.size(); i++) {
					FarmFileDTO objFarmFileDto = lstFarmFileDto.get(i);
					sFarmId = objFarmFileDto.getFarmId();
				}
			}
			System.out.println("c. sFarmId==" + sFarmId);

			// ********* getting File path **********//
			farmFileDto.setFarmId(sFarmId);
			ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByFarmId(farmFileDto);
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
				sDelRef = deleteFarmFile(farmFileDto);
				System.out.println("j. sDelRef==" + sDelRef);

				// ********* getting updated list**********//
				System.out.println("j. getFileId==" + farmFileDto.getFileId() + "------------- getFarmId=="+ farmFileDto.getFarmId());
				lstLatestUploadFiles = getUploadFleByFarmId(farmFileDto);
				System.out.println("l. lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return lstLatestUploadFiles;
	}
}
