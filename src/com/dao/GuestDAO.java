package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.EventGuestDTO;
import com.dto.FarmDTO;
import com.dto.GuestDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class GuestDAO {
	public String addGuest(GuestDTO guestDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("3. In GuestDAO addFarm---------- getGuestName===" +guestDto.getName());
			session.insert("Guest.addGuest", guestDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<GuestDTO> getGuestDetailsByEventId(EventGuestDTO eventGuestDto) {
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		try {
			//System.out.println("3. In GuestDAO getGuestDetailsByEventId----------");
			SqlMapClient session = new IbatisFactory().getSession();
			String sEventId = eventGuestDto.getEventId();
            //System.out.println("3.1 In GuestDAO getGuestDetailsByEventId----------sEventId==="+sEventId);
			guestdto = (ArrayList<GuestDTO>) session.queryForList("Guest.getGuestDetailsByEventId", sEventId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!guestdto.equals(null)) {
			return guestdto;
		} else {
			return guestdto;
		}
	}
	public String updateGuest(GuestDTO guestDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("3. In GuestDAO updateGuest---------- updateGuest===" +guestDto.getName());
			session.insert("Guest.updateGuest", guestDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String deleteGuest(GuestDTO guestDTO) {
		String result = "fail";
		try {
			//System.out.println("3. In GuestDAO deleteGuest----------");
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Guest.deleteGuest", guestDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
