package com.controller;

import java.io.InputStream;
import java.util.ArrayList;

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

import org.apache.commons.lang.StringUtils;

import com.bo.FarmBO;
import com.bo.FarmFileBO;
import com.bo.MemberBO;
import com.bo.MemberFarmBO;
import com.bo.MemberFileBO;
import com.dto.FarmDTO;
import com.dto.FarmFileDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.MemberFileDTO;
import com.dto.UploadFileDTO;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;
import com.util.CommonUtils;

import net.sf.json.JSONObject;

@Path("/memberService")
public class MemberService {

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addMember")
	public JSONObject addMember(@Context HttpServletRequest request, @FormDataParam("memberId") String memberId,
			@FormDataParam("title") String title, @FormDataParam("firstName") String firstName,
			@FormDataParam("middleName") String middleName, @FormDataParam("lastName") String lastName,
			@FormDataParam("mobile") String mobile, @FormDataParam("email") String email,
			@FormDataParam("address") String address, @FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal, @FormDataParam("district") String district,
			@FormDataParam("state") String state, @FormDataParam("pincode") String pincode,
			@FormDataParam("profession") String profession, @FormDataParam("haveFarm") String haveFarm,
			@FormDataParam("memberType") String memberType,@FormDataParam("amount") String amount, 
			@FormDataParam("farmId") String farmId,
			@FormDataParam("farmName") String farmName, @FormDataParam("farmPlace") String farmPlace,
			@FormDataParam("farmAddress") String farmAddress, @FormDataParam("farmMandal") String farmMandal,
			@FormDataParam("farmDistrict") String farmDistrict, @FormDataParam("aboutFarm") String aboutFarm,
			@FormDataParam("farmState") String farmState, @FormDataParam("farmPincode") String farmPincode,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,
            @FormDataParam("fileFarm") InputStream in1,
            @FormDataParam("fileFarm") FormDataContentDisposition info1
            
            ) {
		System.out.println("in to member "+in1);
		System.out.println("in to member add"+info1);
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
				
				CommonUtils utils = new CommonUtils();
				String path = "";
				System.out.println( request.getServletContext().getRealPath("/"));
				path = request.getServletContext().getRealPath("/") + "images/uploads/";


				
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
				//System.out.println(" in to member add memberResult "+memberResult);
				utils.uploadFileToLocation(info, in, request, path);
				CommonUtils.saveFileData(request, sId, "MEMBER");
				//System.out.println(" in to member add memberResult "+memberResult);
				if (memberResult.equals("success") && haveFarm.equals("Yes")) {
					/*CommonUtils utils1 = new CommonUtils();
					String path1 = "";
					//System.out.println( request.getServletContext().getRealPath("/"));
					path1 = request.getServletContext().getRealPath("/") + "images/uploads/";
					utils1.uploadFileToLocation(info, in, request, path1);*/

					//CommonUtils.saveFileData(request, sId, "FARM");
					System.out.println("in to path"+path);
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
					
					utils.uploadFileToLocation(info1, in1, request, path);
					System.out.println("aaaaaaa sFarmId"+sFarmId);
					CommonUtils.saveFileData(request, sFarmId, "FARM");
					
					FarmBO farmBo = new FarmBO();
					farmResult = farmBo.addFarm(farmDto);
					//CommonUtils.saveFileData(request, sId, "FARM");
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
				//CommonUtils.saveFileData(request, sId, "MEMBER");

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
		//System.out.println("in to memberDetails");
		JSONObject jobj1 = new JSONObject();
		MemberBO bo = new MemberBO();
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			memberList = bo.getMemberDetails();
			if (!(memberList.size() < 0)) {
				System.out.println("in to member update");
				memberList = bo.updatedMembers(memberList);
				System.out.println("after member update");
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
/*	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFarmId")
	public JSONObject getFarmId(@QueryParam("farmId") String farmId, @Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(farmId.length() < 0)) {
				session.setAttribute("FARMID", farmId);
			} else {
				jobj.put("FarmId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}*/

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getMemberProfile")
	public JSONObject getMemberProfile(@Context HttpServletRequest request) {
    System.out.println("in to member profile");
		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		String farmId = null;
		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		ArrayList<UploadFileDTO> lstUploadFarmFileDTO = null;

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
				System.out.println("1. memberId==="+memberId);
				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);
				System.out.println("2. farmList.size()==="+farmList.size());
				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmProfile", farmList);
					
					for(int i=0; i < farmList.size(); i++){
						FarmDTO farmDTO = farmList.get(i);
						if(farmDTO != null){
							farmId = farmDTO.getFarmId();
						}
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// get member images
		System.out.println("3. memberId==="+memberId);
		if (StringUtils.isNotEmpty(memberId)) {
		MemberFileDTO memberFileDto = new MemberFileDTO();
		memberFileDto.setMemberId(memberId);
		MemberFileBO memberFileBo = new MemberFileBO();
		lstUploadFileDTO = memberFileBo.getMemberImages(memberFileDto);
		if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
			jobj.put("MEMBERFILES", lstUploadFileDTO);
		}
		}
		
		//get farm images
		System.out.println("4. farmId==="+farmId);
		if (StringUtils.isNotEmpty(farmId)) {
		System.out.println("in to farm images");
		FarmFileDTO farmFileDto = new FarmFileDTO();
		farmFileDto.setFarmId(farmId);
		FarmFileBO farmFileBo = new FarmFileBO();
		lstUploadFarmFileDTO = farmFileBo.getFarmImages(farmFileDto);
		System.out.println("lstUploadFarmFileDTO.size===="+lstUploadFarmFileDTO.size());
		if(lstUploadFarmFileDTO != null && lstUploadFarmFileDTO.size()>0){
			jobj.put("FARMFILES", lstUploadFarmFileDTO);
			
		}
		}
		return jobj;

	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/editMember")
	public JSONObject editMember(@Context HttpServletRequest request) {
        System.out.println("in to member edit");
		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		String farmId = null;
		try {
			if (StringUtils.isNotEmpty(memberId)) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setMemberId(memberId);
                System.out.println("in to member edit"+memberId);
				MemberBO bo = new MemberBO();
				memberList = bo.getMemberProfile(memberDto);

				if (!(memberList.size() < 0)) {
					memberList = bo.updatedMembers(memberList);
					jobj.put("EditMember", memberList);
				} else {
					jobj.put("EditMember", "failed");
				}
/*				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);

				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);

				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmEdit", farmList);
					for(int i=0; i < farmList.size(); i++){
						FarmDTO farmDTO = farmList.get(i);
						if(farmDTO != null){
							farmId = farmDTO.getFarmId();
						}
					}
					// get member images
					MemberFileDTO memberFileDto = new MemberFileDTO();
					memberFileDto.setMemberId(memberId);
					MemberFileBO memberFileBo = new MemberFileBO();
					lstUploadFileDTO = memberFileBo.getMemberImages(memberFileDto);
					if (lstUploadFileDTO != null && lstUploadFileDTO.size() > 0) {
						jobj.put("MEMBERFILES", lstUploadFileDTO);
					}
				}*/
			}
			System.out.println("in member edit jobj"+jobj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}

	@POST
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/memberUpdate")
	public JSONObject memberUpdate(@Context HttpServletRequest request, @FormDataParam("memberId") String memberId,
			@FormDataParam("title") String title, @FormDataParam("firstName") String firstName,
			@FormDataParam("middleName") String middleName, @FormDataParam("lastName") String lastName,
			@FormDataParam("mobile") String mobile, @FormDataParam("email") String email,
			@FormDataParam("address") String address, @FormDataParam("place") String place,
			@FormDataParam("mandal") String mandal, @FormDataParam("district") String district,
			@FormDataParam("state") String state, @FormDataParam("pincode") String pincode,
			@FormDataParam("profession") String profession, @FormDataParam("haveFarm") String haveFarm,
			@FormDataParam("memberType") String memberType,@FormDataParam("amount") String amount, 
			@FormDataParam("farmId") String farmId,
			@FormDataParam("farmName") String farmName, @FormDataParam("farmPlace") String farmPlace,
			@FormDataParam("farmAddress") String farmAddress, @FormDataParam("farmMandal") String farmMandal,
			@FormDataParam("farmDistrict") String farmDistrict, @FormDataParam("aboutFarm") String aboutFarm,
			@FormDataParam("farmState") String farmState, @FormDataParam("farmPincode") String farmPincode,
			@FormDataParam("file") InputStream in,
            @FormDataParam("file") FormDataContentDisposition info,
            @FormDataParam("editfileFarm") InputStream in1,
            @FormDataParam("editfileFarm") FormDataContentDisposition info1) {
		JSONObject jObj = new JSONObject();
		String memberResult = "fail";
		String farmResult = "fail";
		String sLoginId = "";
		boolean bFarmNew = false;
		String memberfarmResult = "fail";
        System.out.println("in to member update");
		try {
			if (StringUtils.isNotEmpty(title)) {
				
				CommonUtils utils = new CommonUtils();
				String path = "";
				//System.out.println( request.getServletContext().getRealPath("/"));
				path = request.getServletContext().getRealPath("/") + "images/uploads/";
				/*utils.uploadFileToLocation(info, in, request, path);
				CommonUtils.saveFileData(request, memberId, "MEMBER");*/
				
				if(request.getSession().getAttribute("LOGINID") != null){
					sLoginId = (String) request.getSession().getAttribute("LOGINID");
				}
				
				System.out.println("in to member update");
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
				
				utils.uploadFileToLocation(info, in, request, path);
				CommonUtils.saveFileData(request, memberId, "MEMBER");
				
				if (memberResult.equals("success") && haveFarm.equals("Yes")) {
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
				
				//utils.uploadFileToLocation(info1, in1, request, path);
				
				//System.out.println("in to farm info1----"+info1);
				//System.out.println("in to farm in1----"+in1);
				//System.out.println("in to farm request----"+request);
				//System.out.println("in to farm path----"+path);
				
				//CommonUtils.saveFileData(request, farmId, "FARM");
				//System.out.println("in to farm update "+path);
				//System.out.println("in to farm Update info1"+info1);
				//System.out.println("in to farm Update in1"+in1);
				//System.out.println("in to farm Update farmId---"+in1);
				//System.out.println("lstUploadFarmFileDTO.size===="+lstUploadFarmFileDTO.size());
				//System.out.println("in member update "+memberResult);
				utils.uploadFileToLocation(info1, in1, request, path);
				CommonUtils.saveFileData(request, farmId, "FARM");
				System.out.println("after farm update");
				//System.out.println("in to farm Update farmId---"+farmDto.size());
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
				//System.out.println("in memberfarm update "+memberfarmResult);
				System.out.println("in to farmResult"+farmResult);
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
	public JSONObject searchMember(@QueryParam("firstName") String sFirstName, 
			@QueryParam("profession") String sProfession ,
			 @QueryParam("place") String sPlace,
			 @QueryParam("hadFarm") String sHadFarm,
			 @QueryParam("memberShip") String sMemberShip) {
	//	System.out.println("1. *****Called searchMember**********firstName==" +sFirstName+"--------profession=="+sProfession);
		//System.out.println("2. *****Called searchMember**********place==" +sPlace+"--------memberShip=="+sMemberShip);
		JSONObject jobj1 = new JSONObject();
		MemberBO bo = new MemberBO();
		MemberDTO dto = new MemberDTO();
		dto.setFirstName(sFirstName);
		dto.setPlace(sPlace);
		
		if(sProfession.equals("null")){
			//System.out.println("1.null");
			dto.setProfession(null);
		}else{
			//System.out.println("1.not null");
			dto.setProfession(sProfession);
		}
		
		if(sMemberShip.equals("null")){
			//System.out.println("2.null");
			dto.setMemberType(null);
		}else{
			//System.out.println("2.not null");
			dto.setMemberType(sMemberShip);
		}
		
		if(sHadFarm.equals("null")){
			//System.out.println("3.null");
			dto.setHaveFarm(null);
		}else{
			//System.out.println("3.not null");
			dto.setHaveFarm(sHadFarm);
		}
		
		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			memberList = bo.searchMember(dto);
			//System.out.println("****memberList.size==" +memberList.size());
			if(memberList != null && memberList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("MemberDetails", memberList);
			}else {
				jobj1.put("MemberDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("searchMember jobj-->" + jobj1);
		return jobj1;

	}
}
