package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.EventGuestDAO;
import com.dao.FarmDAO;
import com.dao.MemberDAO;
import com.dao.MemberFarmDAO;
import com.dao.NewsDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.EventGuestDTO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;

public class EventGuestBO {

	public String addEventGuest(EventGuestDTO eventGuestDto) {
		//System.out.println("2. In MemberBO---------- addNewsDetails===" +memberfarmDto.getFarmId());
		EventGuestDAO dao = new EventGuestDAO();
		//MemberDAO dao = new MemberDAO();	
		return dao.addEventGuest(eventGuestDto);
		//return dao.addMember(memberDto);
	}
	
}
