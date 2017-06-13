package com.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.NewsBO;
import com.bo.NewsFileBO;
import com.bo.UploadFileBO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.sun.security.ntlm.Server;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/uploadService")
public class UploadFileService {

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteImage")
	public JSONObject deleteImage(@QueryParam("fileId") String fileId, @QueryParam("type") String sType,
			@Context HttpServletRequest request) {
		String result = "fail";
		String deleteFilePath = null;
		String sExstFilePath = null;
		String path = "";
		JSONObject jObj = new JSONObject();
		NewsFileDTO newsFileDto = null;
		NewsFileBO newsFileBo = null;
		ArrayList<NewsFileDTO> lstNewsFileDto = null;
		String sNewsId = null;
		boolean bFileDeleted = false;
		UploadFileBO fileBo = null;
		String sDelFileUpload = null;
		String sDelRef = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;
		System.out.println("a. fileId ==" + fileId + "------------sType ==" + sType);
		try {
			if (StringUtils.isNotEmpty(sType) && sType.equals("NEWS")) {
				newsFileDto = new NewsFileDTO();
				
				//********* getting news Id **********//
				newsFileDto.setFileId(fileId);
				newsFileBo = new NewsFileBO();
				lstNewsFileDto = newsFileBo.getNewsFileByFileId(newsFileDto);
				System.out.println("b. lstUploadFileDTO.size ==" + lstNewsFileDto.size());
				if (lstNewsFileDto != null && lstNewsFileDto.size() > 0) {
					for (int i = 0; i < lstNewsFileDto.size(); i++) {
						NewsFileDTO objNewsFileDto = lstNewsFileDto.get(i);
						sNewsId = objNewsFileDto.getNewsId();
					}
				}
				System.out.println("c. sNewsId==" + sNewsId);

				//********* getting File path **********//
				newsFileDto.setNewsId(sNewsId);
				NewsFileBO boNewsFile = new NewsFileBO();
				ArrayList<UploadFileDTO> lstUploadFileDTO = boNewsFile.getUploadFleByNewsId(newsFileDto);
				System.out.println("c1. lstUploadFileDTO.size ==" + lstUploadFileDTO.size());
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					for (int j = 0; j < lstUploadFileDTO.size(); j++) {
						UploadFileDTO uploadFileDTO = lstUploadFileDTO.get(j);
						String sExtFileId = uploadFileDTO.getFileId();
						System.out.println("c2. fileId ==" + fileId + "------------sExtFileId ==" + sExtFileId);
						if(fileId.equals(sExtFileId)){
							sExstFilePath = uploadFileDTO.getFilePath();
							break;
						}
					}
				}
				System.out.println("d. sExstFilePath==" + sExstFilePath);

				//********* deleting physical file **********//
				path = request.getServletContext().getRealPath("/");
				System.out.println("e. path==" + path);
				deleteFilePath = path + sExstFilePath;
				System.out.println("f. deleteFilePath==" + deleteFilePath);
				File newFile = new File(deleteFilePath);
				if (newFile.exists()) {
					System.out.println("g. ==deleteFile Exists==");
					newFile.delete();
					bFileDeleted = true;
				}
				System.out.println("h.bFileDeleted==" + bFileDeleted);
				
				//********* deleting data from tables **********//
				if (bFileDeleted) {
					fileBo = new UploadFileBO();
					sDelFileUpload = fileBo.deleteImage(fileId);
					System.out.println("i. sDelFileUpload==" + sDelFileUpload);

					sDelRef = boNewsFile.deleteNewsFile(newsFileDto);
					System.out.println("j. sDelRef==" + sDelRef);

					//********* getting updated list**********//
					System.out.println("j. getFileId==" + newsFileDto.getFileId()+"------------- getNewsId==" + newsFileDto.getNewsId());
					lstLatestUploadFiles = newsFileBo.getUploadFleByNewsId(newsFileDto);
					System.out.println("l. lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
					if (lstLatestUploadFiles != null && lstLatestUploadFiles.size() > 0) {
						jObj.put("NEWSFILES", lstLatestUploadFiles);
					}
					result = "success";
				}

			}

			jObj.put("Msg", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;

	}

	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateShowAsPublic")
	public JSONObject updateShowAsPublic(@QueryParam("fileId") String fileId,
			@QueryParam("showAsPublic") String showAsPublic, @QueryParam("type") String sType) {

		JSONObject jObj = new JSONObject();
		NewsFileDTO newsFileDto = null;
		NewsFileBO newsFileBo = null;
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		String result = "fail";
		//System.out.println("a. fileId =="+fileId+"------------sType =="+sType);
		try {
			UploadFileDTO uploadFileDTO = new UploadFileDTO();
			uploadFileDTO.setFileId(fileId);
			uploadFileDTO.setShowPublic(showAsPublic);

			UploadFileBO fileBo = new UploadFileBO();
			fileBo.updateShowAsPublic(uploadFileDTO);

			if (StringUtils.isNotEmpty(sType) && sType.equals("NEWS")) {
				newsFileDto = new NewsFileDTO();
				newsFileDto.setFileId(fileId);

				newsFileBo = new NewsFileBO();
				lstUploadFileDTO = newsFileBo.getNewsFilesByFileId(newsFileDto);
				//System.out.println("lstUploadFileDTO.size ==" + lstUploadFileDTO.size());
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jObj.put("NEWSFILES", lstUploadFileDTO);
					result = "success";
				}
			}
			jObj.put("Msg", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;

	}
}
