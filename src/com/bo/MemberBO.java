package com.bo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.controller.LoginService;
import com.dao.MemberDAO;
import com.dto.MemberDTO;
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
		
		if (StringUtils.isNotEmpty(sMemType) && sMemType.equals("Life")) {
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsWelcomeLifeText");
		}else{
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsWelcomeOrdinaryText");
		}
		sMessage = sPropertyContent;
		boolean bSmsWelcome = sms.sendMessage(request, sMobile, sMessage);
		if(bSmsWelcome){
			bNotiSent = true;			
		}
		
		if (StringUtils.isNotEmpty(sMemType) && sMemType.equals("Life")) {
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsOtpText");
			sMessage = sOtp + " " + sPropertyContent;
			boolean bSmsOtp = sms.sendMessage(request, sMobile, sMessage);
		}

		return bNotiSent;
	}
	
	public ArrayList<MemberDTO> searchMember(MemberDTO memberDto){
	     MemberDAO dao= new MemberDAO();
	     return dao.searchMember(memberDto);
	}
	
}
