package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.dao.NewsDAO;
import com.dao.NewsFileDAO;
import com.dao.ProgramFileDAO;
import com.dao.UploadFileDAO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.UploadFileDTO;

public class ProgramFileBO {

	public String programFile(ProgramFileDTO programFileDTO) {
		ProgramFileDAO dao = new ProgramFileDAO();
		return dao.programFile(programFileDTO);
	}
	public ArrayList<UploadFileDTO> getProgramImages(ProgramFileDTO programFileDTO){
		ProgramFileDAO programFileDao = new ProgramFileDAO();
			NewsFileDAO newsFileDao = new NewsFileDAO();
			return programFileDao.getProgramImages(programFileDTO);
		}
	public ArrayList<UploadFileDTO> getUploadFleByProgramId(ProgramFileDTO programFileDTO) {
		ProgramFileDAO programFileDao = new ProgramFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = programFileDao.getProgramFilesByFileId(programFileDTO);
		return uploadFiledto;
	}

	public String deleteProgramFile(ProgramFileDTO programFileDTO) {
		ProgramFileDAO dao = new ProgramFileDAO();
		return dao.deleteProgramFile(programFileDTO);
	}
	
	public ArrayList<UploadFileDTO> getProgramFilesByFileId(ProgramFileDTO programFileDTO) {
		ProgramFileDAO programFileDao = new ProgramFileDAO();
		return programFileDao.getProgramFilesByFileId(programFileDTO);
	}
	
	public ArrayList<ProgramFileDTO> getProgramFileByFileId(ProgramFileDTO programFileDTO) {
		ProgramFileDAO programFileDao = new ProgramFileDAO();
		return programFileDao.getProgramFileByFileId(programFileDTO);
	}
	
	public ArrayList<UploadFileDTO> deleteFileProgram(String sFileId ,String sPath){
		System.out.println("a. sFileId ==" + sFileId + "------------sPath ==" + sPath);
        String sProgramId = null;
        String sExstFilePath = null;
        String deleteFilePath = null;
        boolean bFileDeleted = false;
        String sDelFileUpload = null;
        String sDelRef = null;
		ArrayList<UploadFileDTO> lstUpload = null;
		UploadFileBO fileBo = null;
		ProgramFileDTO programFileDto = null;
		ArrayList<ProgramFileDTO> lstProgramFileDto = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;
		//lstProgramFileDto = null;
		try{
			// ********* getting program Id **********//
			programFileDto = new ProgramFileDTO();
			programFileDto.setFileId(sFileId);
			lstProgramFileDto = getProgramFileByFileId(programFileDto);
			if(lstProgramFileDto != null && lstProgramFileDto.size()>0){
				for(int i=0; i < lstProgramFileDto.size(); i++){
					ProgramFileDTO objProgramFileDto = lstProgramFileDto.get(i);
					sProgramId = objProgramFileDto.getProgramId();
				}
			}
			
			// ********* getting File path **********//
						programFileDto.setProgramId(sProgramId);
						ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByProgramId(programFileDto);
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
							sDelRef = deleteProgramFile(programFileDto);

							// ********* getting updated list**********//
							lstLatestUploadFiles = getProgramImages(programFileDto);
						}

		}catch(Exception e){
			
		}
		return lstLatestUploadFiles;
	}
}
