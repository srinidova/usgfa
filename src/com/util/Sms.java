/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import com.dto.SmsDTO;


/**
 *
 * @author srinivasa.dova
 */
public class Sms {
	@SuppressWarnings("unused")
	public static boolean sendMessage(ServletContext objContext,SmsDTO ObjsmsDto){
		boolean bSentSms = false;
		String postData="";
		String retval = "";
		String Username ="";
		String Password = "";
		String MobileNo = ObjsmsDto.getSendTo();
		String Message = ObjsmsDto.getMessage();
		String SenderID = "";
		InputStream input = null;
		String mailContent = null;
		String smsUrl = null;
		String smsOtpText = null;
		try{
			Username =ObjsmsDto.getUserName();
			Password =ObjsmsDto.getPassword();
			SenderID =ObjsmsDto.getSenderId();
			smsUrl =ObjsmsDto.getUrl();
			Message = ObjsmsDto.getMessage();
			MobileNo = ObjsmsDto.getSendTo();
			
			// //System.out.println("Username = " + Username);
			// //System.out.println("Password = " + Password);
			// //System.out.println("SenderID = " + SenderID);
			// //System.out.println("smsUrl = " + smsUrl);
			
			postData += "user=" + Username + "&password=" + Password + "&GSM=" +
					MobileNo +"&sender=" + SenderID + "&SMSText=" + Message;
			//System.out.println("postData============"+postData);
			
			URL url = new URL(smsUrl);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("POST");
			urlconnection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			urlconnection.setDoOutput(true);

			OutputStreamWriter out = new OutputStreamWriter(urlconnection.getOutputStream());
			out.write(postData);
			out.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
			String decodedString;
			while ((decodedString = in.readLine()) != null) {
				retval += decodedString;
			}
			in.close();
			//System.out.println("retval==="+retval);
			
			bSentSms = true;
			
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println("Error While sending............."+e);
		}
		return bSentSms;
	}
	
	public boolean sendMessage(@Context HttpServletRequest request, @QueryParam("loginMobile") String loginMobile,
			String sMessage) throws IOException {
		boolean bSentSms = false;
		//Sms sms = new Sms();

		SmsDTO smsDTO = CommonUtils.getSmsProperties(request.getServletContext());
		smsDTO.setSendTo("91" + loginMobile);
		smsDTO.setMessage(sMessage);

		bSentSms = sendMessage(request.getServletContext(), smsDTO);

		return bSentSms;
	}
    
}
