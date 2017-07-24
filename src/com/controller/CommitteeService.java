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

import com.bo.CommitteeBO;
import com.dto.CommitteeDTO;
import com.dto.MemberDTO;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/CommitteeService")
public class CommitteeService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addCommittee")
	public JSONObject addCommittee(@Context HttpServletRequest request, @QueryParam("committeeId") String committeeId,
			@QueryParam("member") String member, @QueryParam("role") String role,
			@QueryParam("displayOrder") String displayOrder, @QueryParam("comments") String comments) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sId = null;
		String sUpdtedOn = null;
		String sLoginId = "";
		CommitteeBO bo = null;
		try {
			if (StringUtils.isNotEmpty(member)) {

				if (request.getSession().getAttribute("LOGINID") != null) {
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}

				CommitteeDTO committeeDto = new CommitteeDTO();
				sId = CommonUtils.getAutoGenId();
				sUpdtedOn = CommonUtils.getDate();
				sUpdtedOn = CommonUtils.getDate();

				committeeDto.setCommitteeId(sId);
				committeeDto.setMemberId(member);
				committeeDto.setRole(role);
				committeeDto.setDisplayOrder(displayOrder);
				committeeDto.setComments(comments);
				committeeDto.setUpdatedOn(sUpdtedOn);
				committeeDto.setUpdatedBy(sLoginId);

				bo = new CommitteeBO();
				result = bo.addCommittee(committeeDto);
			}
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
				ArrayList<MemberDTO> commMemberList = bo.getCommitteeMembers();
				if (commMemberList != null && commMemberList.size() > 0) {
					jObj.put("COMMITTEEMEMBERLIST", commMemberList);
				}
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
	@Path("/getCommitteeList")
	public JSONObject getCommitteeDetails() {
		JSONObject jobj1 = new JSONObject();
		CommitteeBO bo = new CommitteeBO();
		ArrayList<MemberDTO> commMemList = null;
		try {
			commMemList = bo.getCommitteeMembers();

			if (commMemList != null && commMemList.size() > 0) {
				jobj1.put("Msg", "success");
				jobj1.put("COMMITTEEMEMBERLIST", commMemList);
			} else {
				jobj1.put("Msg", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteCommittee")
	public JSONObject deleteCommittee(@QueryParam("committeeId") String committeeId) {
		JSONObject jObj = new JSONObject();

		String result = "failed";
		try {
			CommitteeBO bo = new CommitteeBO();
			CommitteeDTO dto = new CommitteeDTO();
			dto.setCommitteeId(committeeId);
			result = bo.deleteCommittee(dto);

			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
				ArrayList<MemberDTO> commMemberList = bo.getCommitteeMembers();
				if (commMemberList != null && commMemberList.size() > 0) {
					jObj.put("COMMITTEEMEMBERLIST", commMemberList);
				}
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
	@Path("/getCommitteeProfile")
	public JSONObject getCommitteeProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String committeeId = (String) session.getAttribute("COMMITTEEID");
		ArrayList<CommitteeDTO> committeeList = new ArrayList<CommitteeDTO>();
		try {
			if (StringUtils.isNotEmpty(committeeId)) {

				CommitteeDTO dto = new CommitteeDTO();
				dto.setCommitteeId(committeeId);

				CommitteeBO bo = new CommitteeBO();
				committeeList = bo.getCommitteeProfile(dto);

				if (!(committeeList.size() < 0)) {
					jobj.put("CommitteeProfile", committeeList);
				} else {
					jobj.put("CommitteeProfile", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getCommitteeId")
	public JSONObject getCommitteeId(@QueryParam("committeeId") String committeeId,
			@Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();
			if (StringUtils.isNotEmpty(committeeId)) {
				session.setAttribute("COMMITTEEID", committeeId);
			} else {
				jobj.put("COMMITTEEID", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editCommittee")
	public JSONObject editCommittee(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String committeeId = (String) session.getAttribute("COMMITTEEID");
		ArrayList<CommitteeDTO> committeeList = new ArrayList<CommitteeDTO>();
		try {
			if (StringUtils.isNotEmpty(committeeId)) {

				CommitteeDTO dto = new CommitteeDTO();
				dto.setCommitteeId(committeeId);

				CommitteeBO bo = new CommitteeBO();
				committeeList = bo.getCommitteeProfile(dto);

				if (committeeList != null && committeeList.size() > 0) {
					jobj.put("EditCommittee", committeeList);
				} else {
					jobj.put("EditCommittee", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/updateCommittee")
	public JSONObject updateCommittee(@Context HttpServletRequest request,
			@QueryParam("committeeId") String committeeId, @QueryParam("member") String member,
			@QueryParam("role") String role, @QueryParam("displayOrder") String displayOrder,
			@QueryParam("comments") String comments) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		// String sId = null;
		String sUpdtedOn = null;
		String sLoginId = "";
		CommitteeBO bo = null;
		try {
			if (StringUtils.isNotEmpty(member)) {

				if (request.getSession().getAttribute("LOGINID") != null) {
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}

				CommitteeDTO committeeDto = new CommitteeDTO();
				sUpdtedOn = CommonUtils.getDate();
				sUpdtedOn = CommonUtils.getDate();

				committeeDto.setCommitteeId(committeeId);
				committeeDto.setRole(role);
				committeeDto.setDisplayOrder(displayOrder);
				committeeDto.setComments(comments);
				committeeDto.setUpdatedOn(sUpdtedOn);
				committeeDto.setUpdatedBy(sLoginId);

				bo = new CommitteeBO();
				result = bo.updateCommittee(committeeDto);
			}
			if (!"fail".equals(result)) {
				jObj.put("Msg", "success");
				ArrayList<MemberDTO> commMemberList = bo.getCommitteeMembers();
				jObj.put("COMMITTEEMEMBERLIST", commMemberList);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}
}
