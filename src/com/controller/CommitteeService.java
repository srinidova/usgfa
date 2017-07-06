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
		//System.out.println("in to committee service member" + member);
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
				//System.out.println("result==" + result);
			}
			if (!"fail".equals(result)) {
				jObj.put("Msg", "success");
				ArrayList<MemberDTO> commMemberList = bo.getCommitteeMembers();
				//System.out.println("From Serviece commMemberList.size==" + commMemberList.size());
				jObj.put("COMMITTEEMEMBERLIST", commMemberList);
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
		//System.out.println("a. In Service getCommitteeList");
		try {
			commMemList = bo.getCommitteeMembers();

			if (commMemList != null && commMemList.size() > 0) {
				System.out.println("From Serviece getCommitteeList commMemList.size==" + commMemList.size());
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
			//System.out.println("committeeId==" + committeeId);
			CommitteeBO bo = new CommitteeBO();
			CommitteeDTO dto = new CommitteeDTO();
			dto.setCommitteeId(committeeId);
			result = bo.deleteCommittee(dto);

			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
				ArrayList<MemberDTO> commMemberList = bo.getCommitteeMembers();
				if (commMemberList != null && commMemberList.size() > 0) {
					//System.out.println("From Serviece commMemberList.size==" + commMemberList.size());
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
		//System.out.println("in to get commitee Profile");

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String committeeId = (String) session.getAttribute("COMMITTEEID");
		ArrayList<CommitteeDTO> committeeList = new ArrayList<CommitteeDTO>();
		try {
			if (StringUtils.isNotEmpty(committeeId)) {
				//System.out.println("in to committee profile committeeId" + committeeId);

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
			//System.out.println("In Service getCommitteeId----------committeeId==" + committeeId);
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
		//System.out.println("in to committee edit page");

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String committeeId = (String) session.getAttribute("COMMITTEEID");
		ArrayList<CommitteeDTO> committeeList = new ArrayList<CommitteeDTO>();
		try {
			//System.out.println("In Service editCommittee----------committeeId==" + committeeId);
			if (StringUtils.isNotEmpty(committeeId)) {
				// System.out.println("in to committee edit "+committeeId);

				CommitteeDTO dto = new CommitteeDTO();
				dto.setCommitteeId(committeeId);

				CommitteeBO bo = new CommitteeBO();
				committeeList = bo.getCommitteeProfile(dto);

				if (committeeList != null && committeeList.size() > 0) {
					//System.out.println("in to committeeEdit  committeeList" + committeeList.size());
					/*
					 * for(CommitteeDTO commDto : committeeList){ String
					 * sExsCommId = commDto.getCommitteeId();
					 * System.out.println("sExsCommId=="+sExsCommId+
					 * "-------------committeeId=="+committeeId);
					 * //System.out.println("commDto.getRole "
					 * +commDto.getRole()); }
					 */
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
		//System.out.println("In committee service  updateCommittee committeeId" + committeeId);
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
				//System.out.println("result==" + result);
			}
			if (!"fail".equals(result)) {
				jObj.put("Msg", "success");
				ArrayList<MemberDTO> commMemberList = bo.getCommitteeMembers();
				//System.out.println("From Serviece commMemberList.size==" + commMemberList.size());
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
