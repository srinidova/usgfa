package com.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;

import com.bo.MemberBO;
import com.bo.NewsBO;
import com.bo.NewsFileBO;
import com.bo.UploadFileBO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.BodyPartEntity;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;
import com.sun.jersey.multipart.FormDataParam;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/newsService")
public class NewsService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNews")
	public JSONObject addNews(@Context HttpServletRequest request, @QueryParam("newsId") String newsId,
			@QueryParam("newsTitle") String newsTitle, @QueryParam("date") String date,
			@QueryParam("paper") String paper, @QueryParam("link") String link,
			@QueryParam("moreInfo") String moreInfo) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String resultNewsFile = "fail";
		String sId = null;
		String sUpdtedOn = null;
		String sLoginId = "";

		try {
			if (StringUtils.isNotEmpty(newsTitle)) {

				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				
				NewsDTO newsDto = new NewsDTO();
				sId = CommonUtils.getAutoGenId();
				sUpdtedOn = CommonUtils.getDate();


				newsDto.setNewsId(sId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);
				newsDto.setUpdatedBy(sLoginId);

				NewsBO bo = new NewsBO();
				result = bo.addNewsDetails(newsDto);
			}
			if (!"fail".equals(result)) {
				CommonUtils.saveFileData(request, sId, "NEWS");
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsDetails")
	public JSONObject getNewsDetails() {
		JSONObject jobj1 = new JSONObject();
		JSONObject jobj2 = new JSONObject();
		NewsBO bo = new NewsBO();
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();
		try {
			newsList = bo.getNewsDetails();
			if (!(newsList.size() < 0)) {
				jobj1.put("NewsDetails", newsList);
			} else {
				jobj1.put("NewsDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteNews")
	public JSONObject deleteNews(@QueryParam("newsId") String newsId) {
		JSONObject jobj1 = new JSONObject();
		NewsBO bo = new NewsBO();
		NewsDTO dto = new NewsDTO();
		dto.setNewsId(newsId);
		String result = "fail";
		try {
			result = bo.deleteNews(dto);
			jobj1.put("NewsDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsId")
	public JSONObject getNewsId(@QueryParam("newsId") String newsId, @Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(newsId.length() < 0)) {
				session.setAttribute("NEWSID", newsId);
			} else {
				jobj.put("NewsId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsProfile")
	public JSONObject getNewsProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String newsId = (String) session.getAttribute("NEWSID");
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();
		String resultImage = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			if (StringUtils.isNotEmpty(newsId)) {

				NewsDTO dto = new NewsDTO();
				dto.setNewsId(newsId);

				NewsBO bo = new NewsBO();
				newsList = bo.getNewsProfile(dto);

				if (!(newsList.size() < 0)) {
					jobj.put("NewsProfile", newsList);
				} else {
					jobj.put("NewsProfile", "failed");
				}

				// get news Images

				NewsFileDTO newsFileDto = new NewsFileDTO();

				newsFileDto.setNewsId(newsId);

				NewsFileBO newsFileBo = new NewsFileBO();
				lstUploadFileDTO = newsFileBo.getNewsImages(newsFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jobj.put("NEWSFILES", lstUploadFileDTO);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editNews")
	public JSONObject editNews(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String newsId = (String) session.getAttribute("NEWSID");
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();
		String resultFileEdit = "fail";
		String resultNewsFileEdit = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			if (StringUtils.isNotEmpty(newsId)) {

				NewsDTO dto = new NewsDTO();
				dto.setNewsId(newsId);

				NewsBO bo = new NewsBO();
				newsList = bo.getNewsProfile(dto);

				// get news Images

				NewsFileDTO newsFileDto = new NewsFileDTO();
				newsFileDto.setNewsId(newsId);
				NewsFileBO newsFileBo = new NewsFileBO();
				lstUploadFileDTO = newsFileBo.getNewsImages(newsFileDto);
				if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
					jobj.put("NEWSFILES", lstUploadFileDTO);
				}
				

				if (!(newsList.size() < 0)) {
					jobj.put("EditNews", newsList);
				} else {
					jobj.put("EditNews", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/newsUpdate")
	public JSONObject newsUpdate(@Context HttpServletRequest request, @QueryParam("newsId") String newsId,
			@QueryParam("newsTitle") String newsTitle, @QueryParam("date") String date,
			@QueryParam("paper") String paper, @QueryParam("link") String link,
			@QueryParam("moreInfo") String moreInfo) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sLoginId = "";


		try {
			if (StringUtils.isNotEmpty(newsTitle)) {
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}

				NewsDTO newsDto = new NewsDTO();
				String sUpdtedOn = CommonUtils.getDate();


				newsDto.setNewsId(newsId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);
				newsDto.setUpdatedBy(sLoginId);

				NewsBO bo = new NewsBO();
				result = bo.newsUpdate(newsDto);

				
			}
			if (!"fail".equals(result)) {
				CommonUtils.saveFileData(request, newsId, "NEWS");
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}
	
	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addNewsNew")
	public JSONObject addNewsNew(@Context HttpServletRequest request, @FormDataParam("newsId") String newsId,
			@FormDataParam("newsTitle") String newsTitle, @FormDataParam("date") String date,
			@FormDataParam("paper") String paper, @FormDataParam("link") String link,
			@FormDataParam("moreInfo") String moreInfo,@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info, FormDataMultiPart multiPart) {
		
		
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String resultFile = "fail";
		String resultNewsFile = "fail";
		String sId = null;
		String sUpdtedOn = null;
		String sLoginId = "";
		CommonUtils utils = new CommonUtils();
		System.out.println("newsTitle--------------"+newsTitle);
		try {
			List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
			if (StringUtils.isNotEmpty(newsTitle)) {
				
				
				NewsDTO newsDto = new NewsDTO();
				sId = CommonUtils.getAutoGenId();
				sUpdtedOn = CommonUtils.getDate();


				newsDto.setNewsId(sId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);
				newsDto.setUpdatedBy(sLoginId);

				NewsBO bo = new NewsBO();
				result = bo.addNewsDetails(newsDto);
			}
			if(bodyParts != null && bodyParts.size() > 0 ){
				utils.processFileUpload(bodyParts,request );
				CommonUtils.saveFileData(request, sId, "NEWS");
				}
			if (!"fail".equals(result)) {
				
				
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}
	
	
	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/newsUpdateNew")
	public JSONObject newsUpdateNew(@Context HttpServletRequest request, @FormDataParam("newsId") String newsId,
			@FormDataParam("newsTitle") String newsTitle, @FormDataParam("date") String date,
			@FormDataParam("paper") String paper, @FormDataParam("link") String link,
			@FormDataParam("moreInfo") String moreInfo,@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,FormDataMultiPart multiPart) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sLoginId = "";
		CommonUtils utils = new CommonUtils();

		try {
			List<FormDataBodyPart> bodyParts = multiPart.getFields("file");
			if (StringUtils.isNotEmpty(newsTitle)) {
				
				
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}

				NewsDTO newsDto = new NewsDTO();
				String sUpdtedOn = CommonUtils.getDate();


				newsDto.setNewsId(newsId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);
				newsDto.setUpdatedBy(sLoginId);

				NewsBO bo = new NewsBO();
				result = bo.newsUpdate(newsDto);

				
			}
			if(bodyParts != null && bodyParts.size() > 0 ){
				utils.processFileUpload(bodyParts,request );
				CommonUtils.saveFileData(request, newsId, "NEWS");
				}
			if (!"fail".equals(result)) {
				
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/searchNews")
	public JSONObject searchNews(@QueryParam("nameTitle") String sNameTitle, 
			@QueryParam("paper") String sPaper ,
			 @QueryParam("link") String sLink
			 ) {
		System.out.println("1. *****Called searchNews**********nameTitle==" +sNameTitle+"--------paper=="+sPaper);
		System.out.println("2. *****Called searchNews**********link==" +sLink);
		JSONObject jobj1 = new JSONObject();
		NewsBO bo = new NewsBO();
		NewsDTO dto = new NewsDTO();
		dto.setNewsTitle(sNameTitle);
		dto.setPaper(sPaper);
		dto.setLink(sLink);
		
		
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();
		try {
			newsList = bo.searchNews(dto);
			System.out.println("****newsList.size==" +newsList.size());
			if(newsList != null && newsList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("NewsDetails", newsList);
			}else {
				jobj1.put("NewsDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsDetailsHome")
	public JSONObject getNewsDetailsHome(){
		
		JSONObject jobj1 = new JSONObject();
		NewsDTO dto = new NewsDTO();
		NewsBO bo = new NewsBO();
		
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();
		try{
			newsList = bo.getNewsDetailsHome(dto);
			if(newsList != null && newsList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("NewsDetailsHome", newsList);
			}else {
				jobj1.put("NewsDetailsHome", "failed");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return jobj1;
	}
}


	