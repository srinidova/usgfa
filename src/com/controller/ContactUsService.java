package com.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.ContactUsBO;
import com.dto.ContactUsDTO;
import com.dto.EmailDTO;
import com.dto.MailDTO;
import com.util.CommonUtils;
import com.util.EmailUtil;

import net.sf.json.JSONObject;

@Path("/contactService")
public class ContactUsService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/addContact")
	public JSONObject addContact(@Context HttpServletRequest request, @QueryParam("contactId") String contactId,
			@QueryParam("name") String name, @QueryParam("email") String email,
			@QueryParam("subject") String subject, @QueryParam("message") String message) {
		JSONObject jObj = new JSONObject();
		String result = "fail";

		System.out.println("1.a In addContact---------- name===" + name);
		System.out.println("1.b In addContact---------- email===" + email);
		//System.out.println("1.d In addNews---------- date===" + date);
		


		try {
			if (StringUtils.isNotEmpty(name)) {

				ContactUsDTO contactUsDto = new ContactUsDTO();
				String sId = CommonUtils.getAutoGenId();
				String sUpdtedOn = CommonUtils.getDate();
				contactUsDto.setContactId(sId);
				contactUsDto.setName(name);
				contactUsDto.setEmail(email);
				contactUsDto.setSubject(subject);
				contactUsDto.setMessage(message);
				contactUsDto.setUpdatedOn(sUpdtedOn);
				
				ContactUsBO contactUsBo = new ContactUsBO();
				
				result = contactUsBo.addContact(contactUsDto);
				
				ServletContext objContext = request.getServletContext();
				MailDTO mailDto = new MailDTO();
				//mailDto.setEmail(email);
				mailDto.setEmail("medasanipurushotham@gmail.com");
				
				EmailUtil emailUtils = new EmailUtil();
				 System.out.println("1.a in contactUs  emailUtils Page");
				 
				 EmailDTO emailDTO = CommonUtils.getMailProperties(objContext);
				 emailDTO.setToAddress(email);
				 emailDTO.setSubject(subject);
				 emailDTO.setHtmlBody(message);
				 //emailDTO.setBccAddress(email);
				// emailDTO.setCcAddress(email);
				 
				 
				 emailUtils.send(emailDTO);

				 //emailUtils.send("mail.dovasofttech.com", "587", "srinivas.dova@dovasofttech.com", "P@ssw0rd123", "cnudova@gmail.com", "srinidova@gmail.com", "cnudova@gmail.com", "TestMail", "TestMail.............", null);
				//emailUtils.sendEmail(emailDTO);
				 System.out.println("1.b in to emailUtils Page");
					}
				
			System.out.println("result........." + result);
			if (!"fail".equals(result)) {
				jObj.put("Msg", result);
			} else {
				jObj.put("Msg", result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("jobj-->" + jObj);
		return jObj;
	}

	}
