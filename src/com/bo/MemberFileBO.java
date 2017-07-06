package com.bo;

import java.io.File;
import java.util.ArrayList;

import com.dao.MemberFileDAO;
import com.dto.MemberFileDTO;
import com.dto.UploadFileDTO;

public class MemberFileBO {

	public String memberFile(MemberFileDTO memberFileDto) {
		//System.out.println("2. In memberFile---------- memberFile===" + memberFileDto.getFileId());
		MemberFileDAO dao = new MemberFileDAO();
		return dao.memberFile(memberFileDto);
	}
	public ArrayList<UploadFileDTO> getMemberImages(MemberFileDTO memberFileDto){
		//System.out.println("2. In memberFile---------- memberFile===" + memberFileDto.getMemberId());
		MemberFileDAO memberFileDao = new MemberFileDAO();
		return memberFileDao.getMemberImages(memberFileDto);
		}
	public ArrayList<UploadFileDTO> getUploadFleByMemberId(MemberFileDTO memberFileDTO) {
		MemberFileDAO memberFileDao = new MemberFileDAO();
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		uploadFiledto = memberFileDao.getUploadFleByMemberId(memberFileDTO);
		//uploadFiledto = memberFileDao.getMemberFilesByFileId(memberFileDTO);
		return uploadFiledto;
	}

	public String deleteMemberFile(MemberFileDTO memberFileDTO) {
		MemberFileDAO dao = new MemberFileDAO();
		return dao.deleteMemberFile(memberFileDTO);
	}
	
	public ArrayList<UploadFileDTO> getMemberFilesByFileId(MemberFileDTO memberFileDTO) {
		System.out.println("in to memberFileBo showAsPublic");
		MemberFileDAO memberFileDao = new MemberFileDAO();
		return memberFileDao.getMemberFilesByFileId(memberFileDTO);
	}
	
	public ArrayList<MemberFileDTO> getMemberFileByFileId(MemberFileDTO memberFileDTO) {
		MemberFileDAO memberFileDao = new MemberFileDAO();
		return memberFileDao.getMemberFileByFileId(memberFileDTO);
	}
	
	public ArrayList<UploadFileDTO> deleteFileMember(String sFileId ,String sPath){
		System.out.println("a. sFileId ==" + sFileId + "------------sPath ==" + sPath);
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
		//lstMemberFileDto = null;
		try{
			// ********* getting member Id **********//
			memberFileDto = new MemberFileDTO();
			memberFileDto.setFileId(sFileId);
			lstMemberFileDto = getMemberFileByFileId(memberFileDto);
			System.out.println("b. lstUploadFileDTO.size ==" + lstMemberFileDto.size());
			if(lstMemberFileDto != null && lstMemberFileDto.size()>0){
				for(int i=0; i < lstMemberFileDto.size(); i++){
					MemberFileDTO objMemberFileDto = lstMemberFileDto.get(i);
					sMemberId = objMemberFileDto.getMemberId();
				}
			}
			System.out.println("c. sMemberId==" + sMemberId);
			
			// ********* getting File path **********//
						memberFileDto.setMemberId(sMemberId);
						ArrayList<UploadFileDTO> lstUploadFileDTO = getUploadFleByMemberId(memberFileDto);
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
							sDelRef = deleteMemberFile(memberFileDto);
							System.out.println("j. sDelRef==" + sDelRef);

							// ********* getting updated list**********//
							System.out.println("j. getFileId==" + memberFileDto.getFileId() + "------------- getMemberId=="+ memberFileDto.getMemberId());
							lstLatestUploadFiles = getMemberImages(memberFileDto);
							System.out.println("l. lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
						}

		}catch(Exception e){
			
		}
		return lstLatestUploadFiles;
	}
}
