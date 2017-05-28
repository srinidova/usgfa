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
		//System.out.println("2. In GuestBO---------- addGuest===" + guestDto.getName());
		GuestDAO dao = new GuestDAO();
		//FarmDAO dao = new FarmDAO();
		return dao.addGuest(guestDto);
	}
	public ArrayList<GuestDTO> getGuestDetailsByEventId(EventGuestDTO eventGuestDto) {
		//System.out.println("2. In GuestBO---------- getGuestDetailsByEventId===");
		GuestDAO dao = new GuestDAO();
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		return dao.getGuestDetailsByEventId(eventGuestDto);
		}
	public String deleteGuest(GuestDTO guestDTO){
	     //System.out.println("2. In GuestBO----------- deleteGuest====");
	     GuestDAO  dao = new GuestDAO();
	     return dao.deleteGuest(guestDTO);
	}
	/*public ArrayList<GuestDTO> getGuestDetails() {
		//System.out.println("2. In GuestBO---------- getGuestDetails===");
		GuestDAO dao = new GuestDAO();
		//FarmDAO dao = new FarmDAO();
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		return dao.getGuestDetails();
	}
	public ArrayList<GuestDTO> getGuestDetailsByeventId(EventGuestDTO eventGuestDto) {
		//System.out.println("2. In FarmBO---------- getFarmDetailsByMemberId===");
		GuestDAO dao = new GuestDAO();
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		return dao.getGuestDetailsByEventId(eventGuestDto);
	}
	public String guestUpdate(GuestDTO guestDto) {
		//System.out.println("2. In FarmBO---------- farmUpdate===" + farmDto.getFarmName());
		GuestDAO dao = new GuestDAO();
		return dao.guestUpdate(guestDto);
		
	}*/
}
