package com.controller;

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
	public JSONObject deleteImage(@QueryParam("newsId") String newsId, @Context HttpServletRequest request) {
		//System.out.println("1. *****Called deleteImage**********newsId==" + newsId);
		String result = "fail";
		String deleteFilePath = null;
		String fileId = null;
		JSONObject jobj1 = new JSONObject();

		try {
			NewsFileDTO newsFileDTO = new NewsFileDTO();
			newsFileDTO.setNewsId(newsId);
			NewsFileBO boNewsFile = new NewsFileBO();
			ArrayList<UploadFileDTO> lstUploadFileDTO = boNewsFile.getUploadFleByNewsId(newsFileDTO);
			//System.out.println("1.a. In NewsFileBO ---------- lstUploadFileDTO.size===" + lstUploadFileDTO.size());
			if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
				for (int i = 0; i < lstUploadFileDTO.size(); i++) {
					UploadFileDTO uploadFileDTO = lstUploadFileDTO.get(i);
					deleteFilePath = uploadFileDTO.getFilePath();
					fileId = uploadFileDTO.getFileId();

				}
			}
			if (StringUtils.isNotEmpty(deleteFilePath)) {
				//System.out.println("1.b *****Called deleteImage**********getFilePath==" + deleteFilePath);
				//System.out.println("1.c *****Called deleteImage**********fileId==" + fileId);
				UploadFileBO fileBo = new UploadFileBO();
				fileBo.deleteImage(fileId);
				//System.out.println("1.d *****Called deleted fileUpload*********");

				newsFileDTO.setFileId(fileId);
				boNewsFile.deleteNewsFile(newsFileDTO);
				//System.out.println("1.e *****Called deleted newsFile*********");

				result = "success";
			}

			jobj1.put("DeleteImage", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("deleteImage jobj-->" + jobj1);
		return jobj1;

	}

	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateShowAsPublic")
	public JSONObject updateShowAsPublic(@QueryParam("fileId") String fileId, @QueryParam("showAsPublic") String showAsPublic, @Context HttpServletRequest request) {
		//System.out.println("1. *****Called deleteImage**********fileId==" + fileId);
		//System.out.println("1. *****Called deleteImage**********showAsPublic==" + showAsPublic);
		String result = "fail";
		String deleteFilePath = null;
		//String fileId = null;
		JSONObject jobj1 = new JSONObject();

		try {
			UploadFileDTO uploadFileDTO = new UploadFileDTO();
			uploadFileDTO.setFileId(fileId);
			uploadFileDTO.setShowPublic(showAsPublic);
			
			UploadFileBO fileBo = new UploadFileBO();
			fileBo.updateShowAsPublic(uploadFileDTO);


			result = "success";
			jobj1.put("updateShowAsPublic", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("updateShowAsPublic jobj-->" + jobj1);
		return jobj1;

	}
}
