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
		//System.out.println("2. In MemberBO---------- addNewsDetails===" + memberDto.getFirstName());
		MemberDAO dao = new MemberDAO();		
		return dao.addMember(memberDto);
	}
	
	public ArrayList<MemberDTO> getMemberDetails() {
		//System.out.println("2. In MemberBO---------- getMemberDetails===");
		MemberDAO dao = new MemberDAO();
		//ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		return dao.getMemberDetails();
	}
	public ArrayList<MemberDTO> getMemberProfile(MemberDTO memberDto){
	     //System.out.println("2. In MemberBO----------- getMemberProfile====");
	     MemberDAO dao= new MemberDAO();
	     return dao.getMemberProfile(memberDto);
	}
	public String memberUpdate(MemberDTO memberDto) {
		//System.out.println("2. In MemberBO---------- memberUpdate===" + memberDto.getFirstName());
		MemberDAO dao = new MemberDAO();
		return dao.memberUpdate(memberDto);
	}
	public String deleteMember(MemberDTO memberDto){
	     //System.out.println("2. In EventBO----------- getEventDelete====");
		MemberDAO dao = new MemberDAO();
		return dao.deleteMember(memberDto);
	}
	public ArrayList<MemberDTO> getMemberByMobile(MemberDTO memberDto){
	     //System.out.println("2. In MemberBO----------- getMemberProfile====");
	     MemberDAO dao= new MemberDAO();
	     return dao.getMemberByMobile(memberDto);
	}
	
	public MemberDTO getMemberByMobile(String sMobileNo) {
		MemberDTO memDto = null;
		//System.out.println("2.a In MemberBO------getMemberByMobile-----sMobileNo===="+sMobileNo);
		MemberDTO memberDto = new MemberDTO();
		memberDto.setMobile(sMobileNo);
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> lstMembers = dao.getMemberByMobile(memberDto);
		//System.out.println("2.b In MemberBO------getMemberByMobile-----lstMembers size===="+lstMembers.size());
		if (lstMembers != null && lstMembers.size() > 0) {
			for (int i = 0; i < lstMembers.size(); i++) {
				memDto = lstMembers.get(i);
			}
		}

		return memDto;
	}
	
	public boolean isMemberExists(String sMobileNo) {
		boolean bMemberExists = false;
		// System.out.println("2. In MemberBO----isMemberExists-------sMobileNo===="+sMobileNo);
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
		//System.out.println("2. In MemberBO---------- memberUpdate===" + memberDto.getFirstName());
		MemberDAO dao = new MemberDAO();
		return dao.passwordUpdate(memberDto);
	}
	
	public boolean sendNotifications(HttpServletRequest request, String sMobile, String sOtp, String sMemType) throws IOException{
		boolean bNotiSent = false;
		String sPropertyContent = null;
		String sMessage = null;
		//LoginService loginService = new LoginService();
		Sms sms = new Sms();
		System.out.println("a. sendNotifications --------- sMobile==" + sMobile+"--------sOtp=="+sOtp+"--------sMemType=="+sMemType);
		
		if (StringUtils.isNotEmpty(sMemType) && sMemType.equals("Life")) {
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsWelcomeLifeText");
		}else{
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsWelcomeOrdinaryText");
		}
		System.out.println("b. sendNotifications --------- sPropertyContent==" + sPropertyContent);
		sMessage = sPropertyContent;
		System.out.println("c. sendNotifications --------- sMessage==" + sMessage);
		boolean bSmsWelcome = sms.sendMessage(request, sMobile, sMessage);
		System.out.println("d. sendNotifications --------- bSmsWelcome==" + bSmsWelcome);
		if(bSmsWelcome){
			bNotiSent = true;			
		}
		
		if (StringUtils.isNotEmpty(sMemType) && sMemType.equals("Life")) {
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsOtpText");
			System.out.println("e. sendNotifications OTP--------- sPropertyContent==" + sPropertyContent);
			sMessage = sOtp + " " + sPropertyContent;
			System.out.println("f. sendNotifications  OTP--------- sMessage==" + sMessage);
			boolean bSmsOtp = sms.sendMessage(request, sMobile, sMessage);
			System.out.println("g. sendNotifications  OTP--------- bSmsOtp==" + bSmsOtp);
		}

		return bNotiSent;
	}
	
}
