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

import com.bo.FarmBO;
import com.bo.MemberBO;
import com.bo.MemberFarmBO;
import com.bo.MemberFileBO;
import com.bo.NewsBO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.MemberFileDTO;
import com.dto.UploadFileDTO;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/memberService")
public class MemberService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addMember")
	public JSONObject addMember(@Context HttpServletRequest request, @QueryParam("memberId") String memberId,
			@QueryParam("title") String title, @QueryParam("firstName") String firstName,
			@QueryParam("middleName") String middleName, @QueryParam("lastName") String lastName,
			@QueryParam("mobile") String mobile, @QueryParam("email") String email,
			@QueryParam("address") String address, @QueryParam("place") String place,
			@QueryParam("mandal") String mandal, @QueryParam("district") String district,
			@QueryParam("state") String state, @QueryParam("pincode") String pincode,
			@QueryParam("profession") String profession, @QueryParam("haveFarm") String haveFarm,
			@QueryParam("memberType") String memberType,@QueryParam("amount") String amount, 
			@QueryParam("farmId") String farmId,
			@QueryParam("farmName") String farmName, @QueryParam("farmPlace") String farmPlace,
			@QueryParam("farmAddress") String farmAddress, @QueryParam("farmMandal") String farmMandal,
			@QueryParam("farmDistrict") String farmDistrict, @QueryParam("aboutFarm") String aboutFarm,
			@QueryParam("farmState") String farmState, @QueryParam("farmPincode") String farmPincode) {
		// System.out.println("in to controller");
		JSONObject jObj = new JSONObject();
		String memberResult = "fail";
		String farmResult = "fail";
		String memberfarmResult = "fail";
		String resultFileBo = "fail";
		String resultFile = "fail";
		String sId = null;
		try {
			System.out.println("haveFarm........." + haveFarm);
			if (StringUtils.isNotEmpty(title)) {
				MemberDTO memberDto = new MemberDTO();
				sId = CommonUtils.getAutoGenId();
				memberDto.setMemberId(sId);
				memberDto.setTitle(title);
				memberDto.setFirstName(firstName);
				memberDto.setMiddleName(middleName);
				memberDto.setLastName(lastName);
				memberDto.setMobile(mobile);
				memberDto.setEmail(email);
				memberDto.setAddress(address);
				memberDto.setPlace(place);
				memberDto.setMandal(mandal);
				memberDto.setDistrict(district);
				memberDto.setState(state);
				memberDto.setPincode(pincode);
				memberDto.setProfession(profession);
				memberDto.setUpdatedOn(CommonUtils.getDate());
				memberDto.setHaveFarm(haveFarm);
				memberDto.setMemberType(memberType);
				memberDto.setAmountPaid(amount);
                System.out.println("amoutnt---"+amount);
				MemberBO bo = new MemberBO();
				memberResult = bo.addMember(memberDto);
				
				System.out.println("memberResult........." + memberResult);
				if (memberResult.equals("success")) {

					FarmDTO farmDto = new FarmDTO();
					String sFarmId = CommonUtils.getAutoGenId();
					farmDto.setFarmId(sFarmId);
					farmDto.setFarmName(farmName);
					farmDto.setFarmPlace(farmPlace);
					farmDto.setFarmAddress(farmAddress);
					farmDto.setFarmMandal(farmMandal);
					farmDto.setFarmDistrict(farmDistrict);
					farmDto.setAboutFarm(aboutFarm);
					farmDto.setFarmState(farmState);
					farmDto.setFarmPincode(farmPincode);

					FarmBO farmBo = new FarmBO();
					farmResult = farmBo.addFarm(farmDto);
					// CommonUtils.saveFileData(request, sFarmId, "FARM");
					System.out.println("farmResult........." + farmResult);
					if (farmResult.equals("success")) {
						MemberFarmDTO memberFarmDto = new MemberFarmDTO();
						memberFarmDto.setFarmId(sFarmId);
						memberFarmDto.setMemberId(sId);
						MemberFarmBO memberfarmBo = new MemberFarmBO();
						memberfarmResult = memberfarmBo.addMemberFarm(memberFarmDto);
					}
				}

			}
			System.out.println("memberfarmResult........." + memberfarmResult);
			if (!"fail".equals(memberfarmResult)) {
				CommonUtils.saveFileData(request, sId, "MEMBER");

				jObj.put("Msg", memberResult);
			} else {
				jObj.put("Msg", memberResult);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("jobj-->" + jObj);
		return jObj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMemberDetails")
	public JSONObject getMemberDetails() {
		JSONObject jobj1 = new JSONObject();
		MemberBO bo = new MemberBO();
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			// System.out.println("1. *****Called getMemberDetails**********");
			memberList = bo.getMemberDetails();
			// System.out.println("****memberList.size==" + memberList.size());
			// System.out.println("arraylist--->" + memberList.toString());
			if (!(memberList.size() < 0)) {
				jobj1.put("MemberDetails", memberList);
			} else {
				jobj1.put("MemberDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("jobj-->" + jobj1);
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMemberId")
	public JSONObject getMemberId(@QueryParam("memberId") String memberId, @Context HttpServletRequest request) {
		// System.out.println("1. *****Called getMemberId**********memberId==" +
		// memberId);
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(memberId.length() < 0)) {
				session.setAttribute("MEMBERID", memberId);
			} else {
				jobj.put("MemberId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMemberProfile")
	public JSONObject getMemberProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		// System.out.println("1a. *****Called
		// getMemberProfile**********memberId==" + memberId);
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(memberId)) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberId(memberId);

				MemberBO bo = new MemberBO();
				memberList = bo.getMemberProfile(dto);

				// System.out.println("****memberList.size==" +
				// memberList.size());
				// System.out.println("arraylist--->" + memberList.toString());
				if (!(memberList.size() < 0)) {
					jobj.put("MemberProfile", memberList);
				} else {
					jobj.put("MemberProfile", "failed");
				}

				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);

				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);

				// System.out.println("****farmList.size==" + farmList.size());
				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmProfile", farmList);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// get member images
		MemberFileDTO memberFileDto = new MemberFileDTO();
		memberFileDto.setMemberId(memberId);
		// System.out.println("****memberImages==" +
		// memberFileDto.getMemberId());
		MemberFileBO memberFileBo = new MemberFileBO();
		lstUploadFileDTO = memberFileBo.getMemberImages(memberFileDto);
		if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
			// System.out.println("****lstUploadFileDTO.size==" +
			// lstUploadFileDTO.size());
			jobj.put("MEMBERFILES", lstUploadFileDTO);
		}
		// System.out.println("Profile jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editMember")
	public JSONObject editMember(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		// System.out.println("1a. *****Called editMember**********memberId==" +
		// memberId);
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();

		try {
			if (StringUtils.isNotEmpty(memberId)) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setMemberId(memberId);

				MemberBO bo = new MemberBO();
				// memberList = bo.getMemberDetails();
				memberList = bo.getMemberProfile(memberDto);

				// System.out.println("****memberList.size==" +
				// memberList.size());
				 System.out.println("getHaveFarm--->" + memberList.get(0).getHaveFarm());
				if (!(memberList.size() < 0)) {
					jobj.put("EditMember", memberList);
				} else {
					jobj.put("EditMember", "failed");
				}
				// System.out.println("1b. *****Called
				// MemberFarmEdit**********memberId==" + memberId);
				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);

				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);

				// System.out.println("****farmList.size==" + farmList.size());
				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmEdit", farmList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("editMember jobj-->" + jobj);
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/memberUpdate")
	public JSONObject memberUpdate(@Context HttpServletRequest request, @QueryParam("memberId") String memberId,
			@QueryParam("title") String title, @QueryParam("firstName") String firstName,
			@QueryParam("middleName") String middleName, @QueryParam("lastName") String lastName,
			@QueryParam("mobile") String mobile, @QueryParam("email") String email,
			@QueryParam("address") String address, @QueryParam("place") String place,
			@QueryParam("mandal") String mandal, @QueryParam("district") String district,
			@QueryParam("state") String state, @QueryParam("pincode") String pincode,
			@QueryParam("profession") String profession, @QueryParam("haveFarm") String haveFarm,
			@QueryParam("memberType") String memberType, @QueryParam("farmId") String farmId,
			@QueryParam("farmName") String farmName, @QueryParam("farmPlace") String farmPlace,
			@QueryParam("farmAddress") String farmAddress, @QueryParam("farmMandal") String farmMandal,
			@QueryParam("farmDistrict") String farmDistrict, @QueryParam("aboutFarm") String aboutFarm,
			@QueryParam("farmState") String farmState, @QueryParam("farmPincode") String farmPincode) {
		// System.out.println("in to memberUpdate controller");
		JSONObject jObj = new JSONObject();
		String memberResult = "fail";
		String farmResult = "fail";
		// String memberfarmResult = "fail";

		// System.out.println("1.a In memberUpdate---------- title===" + title);
		// System.out.println("1.b In memberUpdate---------- firstName===" +
		// firstName);
		// System.out.println("1.d In memberUpdate---------- middleName===" +
		// middleName);
		// System.out.println("1.d In memberUpdate---------- profession===" +
		// profession);
		// System.out.println("1.d In memberUpdate---------- state===" + state);
		// System.out.println("1.d In memberUpdate---------- farmName===" +
		// farmName);
		// System.out.println("1.d In memberUpdate---------- farmPlace===" +
		// farmPlace);
		// System.out.println("1.d In memberUpdate---------- farmAddress===" +
		// farmAddress);

		try {
			if (StringUtils.isNotEmpty(title)) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setMemberId(memberId);
				memberDto.setTitle(title);
				memberDto.setFirstName(firstName);
				memberDto.setMiddleName(middleName);
				memberDto.setLastName(lastName);
				memberDto.setMobile(mobile);
				memberDto.setEmail(email);
				memberDto.setAddress(address);
				memberDto.setPlace(place);
				memberDto.setMandal(mandal);
				memberDto.setDistrict(district);
				memberDto.setState(state);
				memberDto.setPincode(pincode);
				memberDto.setProfession(profession);
				memberDto.setUpdatedOn(CommonUtils.getDate());
				memberDto.setHaveFarm(haveFarm);
				memberDto.setMemberType(memberType);

				MemberBO bo = new MemberBO();
				memberResult = bo.memberUpdate(memberDto);

				FarmDTO farmDto = new FarmDTO();
				farmDto.setFarmId(farmId);
				// String sId = CommonUtils.getAutoGenId();
				// farmDto.setFarmId(sId);
				farmDto.setFarmName(farmName);
				farmDto.setFarmPlace(farmPlace);
				farmDto.setFarmAddress(farmAddress);
				farmDto.setFarmMandal(farmMandal);
				farmDto.setFarmDistrict(farmDistrict);
				farmDto.setAboutFarm(aboutFarm);
				farmDto.setFarmState(farmState);
				farmDto.setFarmPincode(farmPincode);

				FarmBO farmBo = new FarmBO();
				farmResult = farmBo.farmUpdate(farmDto);

				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setFarmId(farmId);
				memberFarmDto.setMemberId(memberId);
				MemberFarmBO memberfarmBo = new MemberFarmBO();
				// CommonUtils.saveFileData(request, memberId, "MEMBER");
				// CommonUtils.saveFileData(request, farmId, "Farm");

			}
			// System.out.println("result........." + memberResult);
			// System.out.println("result........." + farmResult);
			// System.out.println("result........." + memberfarmResult);
			if (!"fail".equals(memberResult)) {
				jObj.put("Msg", memberResult);
			} else {
				jObj.put("Msg", memberResult);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("jobj-->" + jObj);
		return jObj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteMember")
	public JSONObject deleteMember(@QueryParam("memberId") String memberId) {
		// System.out.println("1. *****Called deleteEvent**********eventId==" +
		// eventId);
		JSONObject jobj1 = new JSONObject();
		MemberBO bo = new MemberBO();
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(memberId);
		String result = "fail";
		try {
			result = bo.deleteMember(dto);
			jobj1.put("MemberDelete", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("delete jobj-->" + jobj1);
		return jobj1;

	}
}
