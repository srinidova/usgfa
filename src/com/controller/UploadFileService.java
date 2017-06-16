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
import com.bo.ProgramFileBO;
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
		String path = "";
		JSONObject jObj = new JSONObject();
		NewsFileBO newsFileBo = null;
		ProgramFileBO programFileBo = null;
		ArrayList<UploadFileDTO> lstLatestUploadFiles = null;
		System.out.println("a.in upload fileId ==" + fileId + "------------sType ==" + sType);
		System.out.println("a 1.in upload fileId ==" + fileId + "------------sType ==" + sType);
		try {
			path = request.getServletContext().getRealPath("/");
			System.out.println("e. path==" + path);
			newsFileBo = new NewsFileBO();
			programFileBo = new ProgramFileBO();
			if (StringUtils.isNotEmpty(sType) && sType.equals("NEWS")) {
				lstLatestUploadFiles = newsFileBo.deleteFileNews(fileId, path);
				System.out.println("l.in upload lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
				jObj.put("NEWSFILES", lstLatestUploadFiles);
				result = "success";
			}if(sType.equals("PROGRAM")){
				if(StringUtils.isNotEmpty(sType) && sType.equals("PROGRAM")){
					lstLatestUploadFiles = programFileBo.deleteFileProgram(fileId, path);
					System.out.println("l.in upload program lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
					jObj.put("PROGRAMFILES",lstLatestUploadFiles);
					result = "success";
				}
			}
			/*else if(StringUtils.isNotEmpty(sType) && sType.equals("PROGRAM")){
				lstLatestUploadFiles = programFileBo.deleteFileProgram(fileId, path);
				System.out.println("l.in upload program lstLatestUploadFiles.size ==" + lstLatestUploadFiles.size());
				jobj1.put("PROGRAMFILE",lstLatestUploadFiles);
				result = "success";
			}*/

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
