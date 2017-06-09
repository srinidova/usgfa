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
		JSONObject jObj = new JSONObject();
		String memberResult = "fail";
		String farmResult = "fail";
		String memberfarmResult = "fail";
		String resultFileBo = "fail";
		String resultFile = "fail";
		String sId = null;
		String sLoginId = "";
		MemberBO bo = new MemberBO();
		String sOtp = CommonUtils.getPin();
		try {
			if (StringUtils.isNotEmpty(mobile)) {
				
				boolean bMemberExists = bo.isMemberExists(mobile);
				if(bMemberExists){
					jObj.put("Msg", "Mobile No already exists.");
					return jObj;
				}
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
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
				memberDto.setPassword(sOtp);
				memberDto.setUpdatedBy(sLoginId);

				memberResult = bo.addMember(memberDto);
				
				if (memberResult.equals("success") && haveFarm.equals("yes")) {

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
					
					if (farmResult.equals("success")) {
						MemberFarmDTO memberFarmDto = new MemberFarmDTO();
						memberFarmDto.setFarmId(sFarmId);
						memberFarmDto.setMemberId(sId);
						MemberFarmBO memberfarmBo = new MemberFarmBO();
						memberfarmResult = memberfarmBo.addMemberFarm(memberFarmDto);
					}
				}

			}
			if (!"fail".equals(memberResult)) {
				CommonUtils.saveFileData(request, sId, "MEMBER");

				//********** send SMS start ************//
				boolean bNotifi = bo.sendNotifications(request, mobile, sOtp, memberType);
				//********** send SMS end ************//

				jObj.put("Msg", memberResult);
			} else {
				jObj.put("Msg", memberResult);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jObj.put("Msg", "Member Registration Failed");
			return jObj;
		}
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
			memberList = bo.getMemberDetails();
			if (!(memberList.size() < 0)) {
				jobj1.put("MemberDetails", memberList);
			} else {
				jobj1.put("MemberDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMemberId")
	public JSONObject getMemberId(@QueryParam("memberId") String memberId, @Context HttpServletRequest request) {
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
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMemberProfile")
	public JSONObject getMemberProfile(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(memberId)) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberId(memberId);

				MemberBO bo = new MemberBO();
				memberList = bo.getMemberProfile(dto);

				if (!(memberList.size() < 0)) {
					jobj.put("MemberProfile", memberList);
				} else {
					jobj.put("MemberProfile", "failed");
				}

				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);

				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);

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
		MemberFileBO memberFileBo = new MemberFileBO();
		lstUploadFileDTO = memberFileBo.getMemberImages(memberFileDto);
		if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
			jobj.put("MEMBERFILES", lstUploadFileDTO);
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editMember")
	public JSONObject editMember(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();

		try {
			if (StringUtils.isNotEmpty(memberId)) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setMemberId(memberId);

				MemberBO bo = new MemberBO();
				memberList = bo.getMemberProfile(memberDto);

				if (!(memberList.size() < 0)) {
					jobj.put("EditMember", memberList);
				} else {
					jobj.put("EditMember", "failed");
				}
				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);

				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);

				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmEdit", farmList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			@QueryParam("memberType") String memberType,@QueryParam("amount") String amount, 
			@QueryParam("farmId") String farmId,
			@QueryParam("farmName") String farmName, @QueryParam("farmPlace") String farmPlace,
			@QueryParam("farmAddress") String farmAddress, @QueryParam("farmMandal") String farmMandal,
			@QueryParam("farmDistrict") String farmDistrict, @QueryParam("aboutFarm") String aboutFarm,
			@QueryParam("farmState") String farmState, @QueryParam("farmPincode") String farmPincode) {
		JSONObject jObj = new JSONObject();
		String memberResult = "fail";
		String farmResult = "fail";
		String sLoginId = "";
		boolean bFarmNew = false;
		String memberfarmResult = "fail";

		try {
			if (StringUtils.isNotEmpty(title)) {
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				
				
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
				memberDto.setAmountPaid(amount);
				memberDto.setUpdatedBy(sLoginId);

				MemberBO bo = new MemberBO();
				memberResult = bo.memberUpdate(memberDto);
				if (memberResult.equals("success") && haveFarm.equals("yes")) {
					if(StringUtils.isEmpty(farmId)){
						farmId = CommonUtils.getAutoGenId();
						bFarmNew = true;
					}
				FarmDTO farmDto = new FarmDTO();
				farmDto.setFarmId(farmId);
				farmDto.setFarmName(farmName);
				farmDto.setFarmPlace(farmPlace);
				farmDto.setFarmAddress(farmAddress);
				farmDto.setFarmMandal(farmMandal);
				farmDto.setFarmDistrict(farmDistrict);
				farmDto.setAboutFarm(aboutFarm);
				farmDto.setFarmState(farmState);
				farmDto.setFarmPincode(farmPincode);
				

				FarmBO farmBo = new FarmBO();
				if(bFarmNew){
					farmResult = farmBo.addFarm(farmDto);
				}else{
					farmResult = farmBo.farmUpdate(farmDto);
				}
				
				
				if(bFarmNew){
				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setFarmId(farmId);
				memberFarmDto.setMemberId(memberId);
				MemberFarmBO memberfarmBo = new MemberFarmBO();
				memberfarmResult = memberfarmBo.addMemberFarm(memberFarmDto);
				}

			}
			if (!"fail".equals(memberResult)) {
				jObj.put("Msg", memberResult);
			} else {
				jObj.put("Msg", memberResult);
			}
		} }catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteMember")
	public JSONObject deleteMember(@QueryParam("memberId") String memberId) {
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
		return jobj1;

	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/searchMember")
	public JSONObject searchMember(@QueryParam("firstName") String sFirstName, @QueryParam("profession") String sProfession) {
		//System.out.println("1. *****Called searchMember**********firstName==" +sFirstName+"--------profession=="+sProfession);
		JSONObject jobj1 = new JSONObject();
		MemberBO bo = new MemberBO();
		MemberDTO dto = new MemberDTO();
		dto.setFirstName("'%"+sFirstName+"'");
		dto.setProfession("'%"+sProfession+"'");
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			memberList = bo.searchMember(dto);
			//System.out.println("****memberList.size==" +memberList.size());
			if(memberList != null && memberList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("MemberSearch", memberList);
			}else {
				jobj1.put("Msg", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("searchMember jobj-->" + jobj1);
		return jobj1;

	}
}
