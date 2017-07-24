package com.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataMultiPart;
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
            @FormDataParam("fileFarm") FormDataContentDisposition info1,
            FormDataMultiPart multiPart
            
            ) {
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
				utils.uploadFileToLocation(info, in, request, path);
				CommonUtils.saveFileData(request, sId, "MEMBER");
				if (memberResult.equals("success") && haveFarm.equals("Yes")) {

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
					
					List<FormDataBodyPart> bodyParts = multiPart.getFields("fileFarm");
					
					if(bodyParts != null && bodyParts.size() > 0 ){
					utils.processFileUpload(bodyParts,request );
					CommonUtils.saveFileData(request, sFarmId, "FARM");
					}
					
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
				memberList = bo.updatedMembers(memberList);
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
				FarmBO fbo = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);
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
		if (StringUtils.isNotEmpty(farmId)) {
		FarmFileDTO farmFileDto = new FarmFileDTO();
		farmFileDto.setFarmId(farmId);
		FarmFileBO farmFileBo = new FarmFileBO();
		lstUploadFarmFileDTO = farmFileBo.getFarmImages(farmFileDto);
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
				MemberBO bo = new MemberBO();
				memberList = bo.getMemberProfile(memberDto);

				if (!(memberList.size() < 0)) {
					memberList = bo.updatedMembers(memberList);
					jobj.put("EditMember", memberList);
				} else {
					jobj.put("EditMember", "failed");
				}
			}
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
            @FormDataParam("editfileFarm") FormDataContentDisposition info1,FormDataMultiPart multiPart) {
		JSONObject jObj = new JSONObject();
		String memberResult = "fail";
		String farmResult = "fail";
		String sLoginId = "";
		boolean bFarmNew = false;
		String memberfarmResult = "fail";
		CommonUtils utils = new CommonUtils();
		try {
			System.out.println("farmId--------"+farmId);
			List<FormDataBodyPart> bodyParts = multiPart.getFields("editfileFarm");
			if (StringUtils.isNotEmpty(title)) {
				//utils.processFileUpload(bodyParts,request );
				//CommonUtils utils = new CommonUtils();
				String path = "";
				path = request.getServletContext().getRealPath("/") + "images/uploads/";
				
				FarmBO farmBo = new FarmBO();
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
				
				utils.uploadFileToLocation(info, in, request, path);
				CommonUtils.saveFileData(request, memberId, "MEMBER");
				//utils.processFileUpload(bodyParts,request );
				System.out.println("have farm--------"+haveFarm);
				System.out.println("farmId--------"+farmId);
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
				
				if(bodyParts != null && bodyParts.size() > 0){
					utils.processFileUpload(bodyParts,request );
					CommonUtils.saveFileData(request, farmId, "FARM");
				}

			}else if( haveFarm.equals("No")){
				System.out.println("qqqqqqqqqqqqq");
				
				MemberFarmBO memFarmBo = new MemberFarmBO();
				ArrayList<MemberFarmDTO> lstMemFarm = memFarmBo.getMemberFarmByMemberId(memberId);
				System.out.println("lstMemFarm.size()====" + lstMemFarm.size());
				String sFarmId = null;
				if (lstMemFarm != null && lstMemFarm.size() > 0) {
					for (int i = 0; i < lstMemFarm.size(); i++) {
						MemberFarmDTO memberFarmDTO = lstMemFarm.get(i);
						sFarmId = memberFarmDTO.getFarmId();
					}
				}
				System.out.println("sFarmId====" + sFarmId);
				path = request.getServletContext().getRealPath("/");
				farmResult = farmBo.deleteFarm(sFarmId, path);
				
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
	public JSONObject deleteMember(@QueryParam("memberId") String memberId, @Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		MemberBO bo = null;
		MemberDTO dto = null;
		String result = "fail";
		String sPath = null;
		MemberFarmBO memFarmBo = null;
		ArrayList<MemberFarmDTO> lstMemFarm = null;
		MemberFarmDTO memberFarmDTO = null;
		String sFarmId = null;
		String resDelFarm = "fail";
		FarmBO frmBo = null;
		try {
			System.out.println("memberId====" + memberId);
			if (StringUtils.isNotEmpty(memberId)) {
				dto = new MemberDTO();
				dto.setMemberId(memberId);

				memFarmBo = new MemberFarmBO();
				lstMemFarm = memFarmBo.getMemberFarmByMemberId(memberId);
				System.out.println("lstMemFarm.size()====" + lstMemFarm.size());

				if (lstMemFarm != null && lstMemFarm.size() > 0) {
					for (int i = 0; i < lstMemFarm.size(); i++) {
						memberFarmDTO = lstMemFarm.get(i);
						sFarmId = memberFarmDTO.getFarmId();
					}
				}
				System.out.println("sFarmId====" + sFarmId);

				if (StringUtils.isNotEmpty(sFarmId)) {
					frmBo = new FarmBO();
					sPath = request.getServletContext().getRealPath("/");
					resDelFarm = frmBo.deleteFarm(sFarmId, sPath);
				}
				System.out.println("resDelFarm====" + resDelFarm);

				bo = new MemberBO();
				result = bo.deleteMember(dto);
				jobj.put("MemberDelete", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}
	
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/searchMember")
	public JSONObject searchMember(@QueryParam("firstName") String sFirstName, 
			@QueryParam("profession") String sProfession ,
			 @QueryParam("place") String sPlace,
			 @QueryParam("hadFarm") String sHadFarm,
			 @QueryParam("memberShip") String sMemberShip) {
		JSONObject jobj1 = new JSONObject();
		MemberBO bo = new MemberBO();
		MemberDTO dto = new MemberDTO();
		dto.setFirstName(sFirstName);
		dto.setPlace(sPlace);
		
		if(sProfession.equals("null")){
			dto.setProfession(null);
		}else{
			dto.setProfession(sProfession);
		}
		
		if(sMemberShip.equals("null")){
			dto.setMemberType(null);
		}else{
			dto.setMemberType(sMemberShip);
		}
		
		if(sHadFarm.equals("null")){
			dto.setHaveFarm(null);
		}else{
			dto.setHaveFarm(sHadFarm);
		}
		
		
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			memberList = bo.searchMember(dto);
			memberList = bo.updatedMembers(memberList);
			if(memberList != null && memberList.size() > 0){
				jobj1.put("Msg", "success");
				jobj1.put("MemberDetails", memberList);
			}else {
				jobj1.put("MemberDetails", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
}
