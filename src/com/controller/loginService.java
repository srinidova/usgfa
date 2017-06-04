package com.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.MemberBO;
import com.dto.MemberDTO;
import com.util.CommonUtils;
import com.util.Sms;

import net.sf.json.JSONObject;

@Path("/LoginService")
public class LoginService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUser")
	public JSONObject getUser(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile,
			@QueryParam("loginPassword") String loginPassword) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sRole = null;
		String sPwd = null;
		MemberDTO memDto = null;
		HttpSession session = null;
		try {
			if (StringUtils.isNotEmpty(loginMobile)) {
				MemberBO memberBO = new MemberBO();
				memDto = memberBO.getMemberByMobile(loginMobile);

				if (memDto != null) {
					sPwd = memDto.getPassword();
					sRole = memDto.getMemberType();

					if (loginPassword.equals(sPwd)) {
						result = "success";
						session = request.getSession();
						session.setAttribute("LOGINMEMBER", memDto);
						session.setAttribute("LOGINROLE", sRole);

					} else {
						result = "Invalid Password";
					}
				} else {
					result = "Invalid Mobile Number";
				}

			}
			jObj.put("Msg", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/logout")
	public JSONObject logout(@Context HttpServletRequest request, @QueryParam("temp") String temp) {

		JSONObject jObj = new JSONObject();
		HttpSession session = request.getSession();
		session.setAttribute("LOGINROLE", null);
		session.setAttribute("LOGINMEMBER", null);
		jObj.put("Msg", "success");

		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/resetPassword")
	public JSONObject resetPassword(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile)
			throws IOException {
		JSONObject jObj = new JSONObject();
		MemberDTO memDto = null;
		String sRole = null;
		String sPin = null;
		String sMessage = null;
		String sPropertyContent = null;
		boolean bSentSms = false;
		Sms sms = new Sms();
		System.out.println("a. loginMobile==" + loginMobile);

		MemberBO memberBO = new MemberBO();
		memDto = memberBO.getMemberByMobile(loginMobile);
		if (memDto != null) {
			sRole = memDto.getMemberType();
		}

		if (memDto != null && sRole.equals("Life")) {
			sPin = CommonUtils.getPin();
			System.out.println("b. in to sPin==" + sPin);

			memDto.setPassword(sPin);
			String sPwdUpdate = memberBO.passwordUpdate(memDto);
			System.out.println("c. in to sPwdUpdate==" + sPwdUpdate);

			if (sPwdUpdate.equals("success")) {
				sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsOtpText");
				System.out.println("d. sPropertyContent==" + sPropertyContent);
				sMessage = sPin + " " + sPropertyContent;
				System.out.println("e. sMessage==" + sMessage);

				bSentSms = sms.sendMessage(request, loginMobile, sMessage);
				if (bSentSms) {
					jObj.put("Msg", "success");
				} else {
					jObj.put("Msg", "Error while sending SMS");
				}
			} else {
				jObj.put("Msg", "Error while Reset Password");
			}
		} else {
			jObj.put("Msg", "Mobile Number Not Found.");
		}

		return jObj;
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/forgotPassword")
	public JSONObject forgotPassword(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile)
			throws IOException {
		JSONObject jObj = new JSONObject();
		MemberDTO memDto = null;
		String sRole = null;
		String sPwd = null;
		String sMessage = null;
		String sPropertyContent = null;
		boolean bSentSms = false;
		Sms sms = new Sms();
		System.out.println("a. loginMobile==" + loginMobile);

		MemberBO memberBO = new MemberBO();
		memDto = memberBO.getMemberByMobile(loginMobile);

		if (memDto != null) {
			sRole = memDto.getMemberType();
		}
		if (memDto != null && sRole.equals("Life")) {
			sPwd = memDto.getPassword();
			System.out.println("b. in to sPwd==" + sPwd);
			sPropertyContent = CommonUtils.getPropertyContent(request.getServletContext(), "smsPwdText");
			System.out.println("c. sPropertyContent==" + sPropertyContent);
			sMessage = sPwd + " " + sPropertyContent;
			System.out.println("d. sMessage==" + sMessage);

			bSentSms = sms.sendMessage(request, loginMobile, sMessage);
			if (bSentSms) {
				jObj.put("Msg", "success");
			} else {
				jObj.put("Msg", "Error while sending SMS");
			}
		} else {
			jObj.put("Msg", "Mobile Number Not Found.");
		}

		return jObj;
	}

}
