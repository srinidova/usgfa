package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.bo.NewsBO;
import com.bo.NewsFileBO;
import com.bo.UploadFileBO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.SmsDTO;
import com.dto.UploadFileDTO;
import com.util.CommonUtils;
import com.util.Sms;

import net.sf.json.JSONObject;

@Path("/loginService")
public class loginService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getUser")
	public JSONObject getUser(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile,
			@QueryParam("loginPassword") String loginPassword) {
		JSONObject jObj = new JSONObject();
		String result = "fail";
		String sRole = null;
		String resultNewsFile = "fail";
		String sPwd = null;
		String sUpdtedOn = null;
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		MemberDTO memDto = null;
		HttpSession session = null;
		
		System.out.println("in to login page loginMobile=="+loginMobile);
		System.out.println("in to login Password=="+loginPassword);
		

		try {
			if (StringUtils.isNotEmpty(loginMobile)) {
				MemberDTO dto = new MemberDTO();
				dto.setMobile(loginMobile);

				MemberBO bo = new MemberBO();
				memberList = bo.getMemberByMobile(dto);
				System.out.println("memberList size=="+memberList.size());
				if (memberList != null && memberList.size() > 0) {
					for (int i = 0; i < memberList.size(); i++) {
						memDto = memberList.get(i);
						sPwd = memDto.getPassword();
						sRole = memDto.getMemberType();
					}

					if (loginPassword.equals(sPwd)) {
						System.out.println("....vaild cred.....");
						result = "success";
						session = request.getSession();
						session.setAttribute("LOGINMEMBER", memDto);
						session.setAttribute("LOGINROLE", sRole);
						
					} else {
						System.out.println("....Invaild pwd.....");
						result = "Invalid Password";
					}
				} else {
					System.out.println("....Invaild phone.....");
					result = "Invalid Mobile Number";
				}

			}
			System.out.println("result........." + result);
			jObj.put("Msg", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("In getUser jobj-->" + jObj);
		return jObj;
	}

	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/logout")
	public JSONObject logout(@Context HttpServletRequest request, @QueryParam("temp") String temp
		) {
		JSONObject jObj = new JSONObject();
		
		System.out.println("in to logout page temp=="+temp);
		HttpSession session = request.getSession();
		
		String sRole=(String)session.getAttribute("LOGINROLE"); 
		//System.out.println("sRole--------" +sRole);
		session.setAttribute("LOGINROLE", null);
		session.setAttribute("LOGINMEMBER", null);
		jObj.put("Msg", "success");
		
		return jObj;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/resetPassword")
	public JSONObject resetPassword(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile
		) throws IOException {
		JSONObject jObj = new JSONObject();
		String sMessage = null;
		System.out.println("in to loginMobile=="+loginMobile);
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		MemberDTO memDto = null;
		MemberDTO dto = new MemberDTO();
		dto.setMobile(loginMobile);

		MemberBO bo = new MemberBO();
		memberList = bo.getMemberByMobile(dto);
		System.out.println("memberList size=="+memberList.size());
		if (memberList != null && memberList.size() > 0) {

		Sms sms = new Sms();

		SmsDTO smsDTO = CommonUtils.getSmsProperties(request.getServletContext(),"smsOtpText");
		smsDTO.setSendTo("91"+loginMobile);
		sMessage = CommonUtils.getPin()+" "+smsDTO.getMessage();
		System.out.println("in to sMessage=="+sMessage);
		smsDTO.setMessage(sMessage);
		
		sms.sendMessage(request.getServletContext(), smsDTO);
		jObj.put("Msg", "success");
		}else{
			jObj.put("Msg", "Mobile Number Not Found.");
		}
		
		
		return jObj;
	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/forgotPassword")
	public JSONObject forgotPassword(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile
		) throws IOException {
		JSONObject jObj = new JSONObject();
		String sMessage = null;
		String sPwd = null;
		System.out.println("in to loginMobile=="+loginMobile);
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		MemberDTO memDto = null;
		MemberDTO dto = new MemberDTO();
		dto.setMobile(loginMobile);

		MemberBO bo = new MemberBO();
		memberList = bo.getMemberByMobile(dto);
		System.out.println("memberList size=="+memberList.size());
		if (memberList != null && memberList.size() > 0) {
			for (int i = 0; i < memberList.size(); i++) {
				memDto = memberList.get(i);
				sPwd = memDto.getPassword();
			}
		
		Sms sms = new Sms();

		SmsDTO smsDTO = CommonUtils.getSmsProperties(request.getServletContext(),"smsPwdText");
		smsDTO.setSendTo("91"+loginMobile);
		sMessage = sPwd +" "+smsDTO.getMessage();
		System.out.println("in to sMessage=="+sMessage);
		smsDTO.setMessage(sMessage);
		
		sms.sendMessage(request.getServletContext(), smsDTO);
		jObj.put("Msg", "success");
		}else{
			jObj.put("Msg", "Mobile Number Not Found.");
		}
		
		
		return jObj;
	}
}
