package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.FarmDAO;
import com.dao.GuestDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.EventGuestDTO;
import com.dto.FarmDTO;
import com.dto.GuestDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;

public class GuestBO {

	public String addGuest(GuestDTO guestDto) {
		GuestDAO dao = new GuestDAO();
		return dao.addGuest(guestDto);
	}
	public ArrayList<GuestDTO> getGuestDetailsByEventId(EventGuestDTO eventGuestDto) {
		GuestDAO dao = new GuestDAO();
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		return dao.getGuestDetailsByEventId(eventGuestDto);
		}
	public String deleteGuest(GuestDTO guestDTO){
	     GuestDAO  dao = new GuestDAO();
	     return dao.deleteGuest(guestDTO);
	}
	public String updateGuest(GuestDTO guestDto) {
		GuestDAO dao = new GuestDAO();
		return dao.updateGuest(guestDto);
	}
	
}
