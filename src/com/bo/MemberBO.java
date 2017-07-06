package com.bo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.controller.LoginService;
import com.dao.MemberDAO;
import com.dto.MemberDTO;
import com.dto.MemberFileDTO;
import com.dto.UploadFileDTO;
import com.util.CommonUtils;
import com.util.Sms;

public class MemberBO {

	public String addMember(MemberDTO memberDto) {
		MemberDAO dao = new MemberDAO();		
		return dao.addMember(memberDto);
	}
	
	public ArrayList<MemberDTO> getMemberDetails() {
		MemberDAO dao = new MemberDAO();
		return dao.getMemberDetails();
	}
	public ArrayList<MemberDTO> getMemberProfile(MemberDTO memberDto){
	     MemberDAO dao= new MemberDAO();
	     return dao.getMemberProfile(memberDto);
	}
	public String memberUpdate(MemberDTO memberDto) {
		MemberDAO dao = new MemberDAO();
		return dao.memberUpdate(memberDto);
	}
	public String deleteMember(MemberDTO memberDto){
		MemberDAO dao = new MemberDAO();
		return dao.deleteMember(memberDto);
	}
	public ArrayList<MemberDTO> getMemberByMobile(MemberDTO memberDto){
	     MemberDAO dao= new MemberDAO();
	     return dao.getMemberByMobile(memberDto);
	}
	
	public MemberDTO getMemberByMobile(String sMobileNo) {
		MemberDTO memDto = null;
		MemberDTO memberDto = new MemberDTO();
		memberDto.setMobile(sMobileNo);
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> lstMembers = dao.getMemberByMobile(memberDto);
		if (lstMembers != null && lstMembers.size() > 0) {
			for (int i = 0; i < lstMembers.size(); i++) {
				memDto = lstMembers.get(i);
			}
		}

		return memDto;
	}
	
	public boolean isMemberExists(String sMobileNo) {
		boolean bMemberExists = false;
		MemberDTO memberDto = new MemberDTO();
		memberDto.setMobile(sMobileNo);
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> lstMembers = dao.getMemberByMobile(memberDto);
		if (lstMembers != null && lstMembers.size() > 0) {
			bMemberExists = true;
		}

		return bMemberExists;
	}
	
	public String passwordUpdate(MemberDTO memberDto) {
		MemberDAO dao = new MemberDAO();
		return dao.passwordUpdate(memberDto);
	}
	
	public boolean sendNotifications(HttpServletRequest request, String sMobile, String sOtp, String sMemType) throws IOException{
		boolean bNotiSent = false;
		String sPropertyContent = null;
		String sMessage = null;
		Sms sms = new Sms();
		
		if (StringUtils.isNotEmpty(sMemType) && (sMemType.equals("Life") || sMemType.equals("Admin"))) {
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsWelcomeLifeText");
		}else{
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsWelcomeOrdinaryText");
		}
		sMessage = sPropertyContent;
		boolean bSmsWelcome = sms.sendMessage(request, sMobile, sMessage);
		if(bSmsWelcome){
			bNotiSent = true;			
		}
		
		if (StringUtils.isNotEmpty(sMemType) && (sMemType.equals("Life") || sMemType.equals("Admin") )) {
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsOtpText");
			sMessage = sOtp + " " + sPropertyContent;
			boolean bSmsOtp = sms.sendMessage(request, sMobile, sMessage);
		}

		return bNotiSent;
	}
	
	public ArrayList<MemberDTO> searchMember(MemberDTO memberDto){
		//System.out.println("in to memberBO ");
	     MemberDAO dao= new MemberDAO();
	     return dao.searchMember(memberDto);
	}
	
	public ArrayList<MemberDTO> updatedMembers(ArrayList<MemberDTO> memberList){
	     MemberDAO dao= new MemberDAO();
	     String sFilePath = null;
			try {
				if(memberList != null && memberList.size() > 0){
					for (MemberDTO memberDTO : memberList) {
						String sMemberId = memberDTO.getMemberId();
						//System.out.println("sMemberId==="+sMemberId);
						
						MemberFileDTO memberFileDTO = new MemberFileDTO();
						memberFileDTO.setMemberId(sMemberId);
						
						MemberFileBO memberFileBO = new MemberFileBO();
						ArrayList<UploadFileDTO> lstUploadFiledto = memberFileBO.getUploadFleByMemberId(memberFileDTO);
						//System.out.println("lstUploadFiledto.size==="+lstUploadFiledto.size());
						
						if(lstUploadFiledto != null && lstUploadFiledto.size() > 0){
							for(UploadFileDTO uploadFileDTO : lstUploadFiledto){
								String  sFilePathExt = uploadFileDTO.getFilePath();
								sFilePath = sFilePathExt;
							}
						}else{
							String sDefaultPath = "images/uploads/blankMale.jpg";
							sFilePath = sDefaultPath;
						}
						System.out.println("sMemberId===="+sMemberId+"========sFilePath==="+sFilePath);
						memberDTO.setFilePath(sFilePath);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	     return memberList;
	}
	
	
}
