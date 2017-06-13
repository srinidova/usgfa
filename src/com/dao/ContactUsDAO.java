package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.ContactUsDTO;
import com.dto.NewsDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ContactUsDAO {
	public String addContact(ContactUsDTO contactUsDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("ContactUs.addContact", contactUsDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
