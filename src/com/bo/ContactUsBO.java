package com.bo;

import java.util.ArrayList;

import com.dao.ContactUsDAO;
import com.dao.NewsDAO;
import com.dto.ContactUsDTO;
import com.dto.NewsDTO;

public class ContactUsBO {

	public String addContact(ContactUsDTO contactUsDto) {
		System.out.println("2. In ContactBO---------- addContact===" + contactUsDto.getName());
		ContactUsDAO dao = new ContactUsDAO();
		return dao.addContact(contactUsDto);
	}
	
}
