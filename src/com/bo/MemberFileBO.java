package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.dao.MemberFileDAO;
import com.dto.MemberFileDTO;
import com.dto.UploadFileDTO;

public class MemberFileBO {

	public String memberFile(MemberFileDTO memberFileDto) {
		MemberFileDAO dao = new MemberFileDAO();
		return dao.memberFile(memberFileDto);
	}
	public ArrayList<UploadFileDTO> getMemberImages(MemberFileDTO memberFileDto){
		MemberFileDAO memberFileDao = new MemberFileDAO();
		return memberFileDao.getMemberImages(memberFileDto);
		}
	public ArrayList<UploadFileDTO> getUploadFleByMemberId(MemberFileDTO memberFileDTO) {
		MemberFileDAO memberFileDao = new MemberFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = memberFileDao.getUploadFleByMemberId(memberFileDTO);
		return uploadFiledto;
	}

	public String deleteMemberFile(MemberFileDTO memberFileDTO) {
		MemberFileDAO dao = new MemberFileDAO();
		return dao.deleteMemberFile(memberFileDTO);
	}
	
	public ArrayList<UploadFileDTO> getMemberFilesByFileId(MemberFileDTO memberFileDTO) {
		MemberFileDAO memberFileDao = new MemberFileDAO();
		return memberFileDao.getMemberFilesByFileId(memberFileDTO);
	}
	
	public ArrayList<MemberFileDTO> getMemberFileByFileId(MemberFileDTO memberFileDTO) {
		MemberFileDAO memberFileDao = new MemberFileDAO();
		return memberFileDao.getMemberFileByFileId(memberFileDTO);
	}
	
	public ArrayList<UploadFileDTO> deleteFileMember(String sFileId ,String sPath){
        String sMemberId = null;
        String sExstFilePath = null;
        String deleteFilePath = null;
        boolean bFileDeleted = false;
        String sDelFileUpload = null;
        String sDelRef = null;
		ArrayList<UploadFileDTO> lstUpload = null;
		UploadFileBO fileBo = null;
		MemberFileDTO memberFileDto = null;
		ArrayList<MemberFileDTO> lstMemberFileDto = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;
		try{
			// ********* getting member Id **********//
			memberFileDto = new MemberFileDTO();
			memberFileDto.setFileId(sFileId);
			lstMemberFileDto = getMemberFileByFileId(memberFileDto);
			if(lstMemberFileDto != null && lstMemberFileDto.size()>0){
				for(int i=0; i < lstMemberFileDto.size(); i++){
					MemberFileDTO objMemberFileDto = lstMemberFileDto.get(i);
					sMemberId = objMemberFileDto.getMemberId();
				}
			}
			
			// ********* getting File path **********//
						memberFileDto.setMemberId(sMemberId);
						ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByMemberId(memberFileDto);
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
							sDelRef = deleteMemberFile(memberFileDto);

							// ********* getting updated list**********//
							lstLatestUploadFiles = getMemberImages(memberFileDto);
						}

		}catch(Exception e){
			
		}
		return lstLatestUploadFiles;
	}
}
