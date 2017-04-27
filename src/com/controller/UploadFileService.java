package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.NewsBO;
import com.dto.NewsDTO;
import com.dto.UploadFileDTO;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/uploadService")
public class UploadFileService {

	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addUpload")
	public JSONObject addUpload(@Context HttpServletRequest request, @QueryParam("fileId") String fileId,
			@QueryParam("filePath") String filePath, @QueryParam("showPublic") String showPublic) {
		JSONObject jObj = new JSONObject();
		String result = "fail";

		System.out.println("1.a In addUpload---------- fileId===" + fileId);
		System.out.println("1.b In addUpload---------- filePath===" + filePath);
		System.out.println("1.d In addUpload---------- showPublic===" + showPublic);

		try {
			if (StringUtils.isNotEmpty(fileId)) {
				UploadFileDTO uploadfiledto = new UploadFileDTO();
				
				String sId = CommonUtils.getAutoGenId();
				String supdateOn = CommonUtils.getDate();
				uploadfiledto.setFileId(sId);
				uploadfiledto.setFilePath(filePath);
				uploadfiledto.setShowPublic(showPublic);

				NewsDTO newsDto = new NewsDTO();
				//String sId = CommonUtils.getAutoGenId();
				String sUpdtedOn = CommonUtils.getDate();

				System.out.println("1.e In addNews---------- sId===" + sId);
				System.out.println("1.f In addNews---------- sUpdtedOn===" + sUpdtedOn);

				newsDto.setNewsId(sId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);

				NewsBO bo = new NewsBO();
				result = bo.addNewsDetails(newsDto);
			}
			System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jObj);
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
			System.out.println("1. *****Called getNewsDetails**********");
			newsList = bo.getNewsDetails();
			System.out.println("****newsList.size==" + newsList.size());
			System.out.println("arraylist--->" + newsList.toString());
			if (!(newsList.size() < 0)) {
				jobj1.put("NewsDetails", newsList);
			} else {
				jobj1.put("NewsDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jobj1);
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteNews")
	public JSONObject deleteNews(@QueryParam("newsId") String newsId) {
		System.out.println("1. *****Called deleteNews**********newsId==" + newsId);
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
		System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsId")
	public JSONObject getNewsId(@QueryParam("newsId") String newsId, @Context HttpServletRequest request) {
		System.out.println("1. *****Called getNewsId**********newsId==" + newsId);
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
		System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsProfile")
	public JSONObject getNewsProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String newsId = (String) session.getAttribute("NEWSID");
		System.out.println("1a. *****Called getNewsProfile**********newsId==" + newsId);
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();

		try {
			if (StringUtils.isNotEmpty(newsId)) {

				NewsDTO dto = new NewsDTO();
				dto.setNewsId(newsId);

				NewsBO bo = new NewsBO();
				newsList = bo.getNewsProfile(dto);

				System.out.println("****newsList.size==" + newsList.size());
				System.out.println("arraylist--->" + newsList.toString());
				if (!(newsList.size() < 0)) {
					jobj.put("NewsProfile", newsList);
				} else {
					jobj.put("NewsProfile", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editNews")
	public JSONObject editNews(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String newsId = (String) session.getAttribute("NEWSID");
		System.out.println("1a. *****Called editNews**********newsId==" + newsId);
		ArrayList<NewsDTO> newsList = new ArrayList<NewsDTO>();

		try {
			if (StringUtils.isNotEmpty(newsId)) {

				NewsDTO dto = new NewsDTO();
				dto.setNewsId(newsId);

				NewsBO bo = new NewsBO();
				newsList = bo.getNewsProfile(dto);

				System.out.println("****newsList.size==" + newsList.size());
				System.out.println("arraylist--->" + newsList.toString());
				if (!(newsList.size() < 0)) {
					jobj.put("EditNews", newsList);
				} else {
					jobj.put("EditNews", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("editNews jobj-->" + jobj);
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

		System.out.println("1.a In newsUpdate---------- newsTitle===" + newsTitle);
		System.out.println("1.b In newsUpdate---------- paper===" + paper);
		System.out.println("1.d In newsUpdate---------- date===" + date);
		System.out.println("1.d In newsUpdate---------- newsId===" + newsId);

		try {
			if (StringUtils.isNotEmpty(newsTitle)) {

				NewsDTO newsDto = new NewsDTO();
				// String sId = CommonUtils.getAutoGenId();
				String sUpdtedOn = CommonUtils.getDate();

				// System.out.println("1.e In addNews---------- sId===" + sId);
				System.out.println("1.f In addNews---------- sUpdtedOn===" + sUpdtedOn);

				newsDto.setNewsId(newsId);
				newsDto.setNewsTitle(newsTitle);
				newsDto.setDate(date);
				newsDto.setPaper(paper);
				newsDto.setLink(link);
				newsDto.setMoreInfo(moreInfo);
				newsDto.setUpdatedOn(sUpdtedOn);

				NewsBO bo = new NewsBO();
				result = bo.newsUpdate(newsDto);
			}
			System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("jobj-->" + jObj);
		return jObj;
	}*/
}
