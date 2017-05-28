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
			//System.out.println("3. In FarmDAO addFarm---------- getFarmName===" +farmDto.getFarmName());
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
	/*public ArrayList<GuestDTO> getGuestDetails() {
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		try {
			//System.out.println("3. In FarmDAO getFarmDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();

			guestdto = (ArrayList<GuestDTO>) session.queryForList("Guest.getGuestDetails");
			//System.out.println("3. In FarmDAO getFarmDetails----------farrmdto==" + farmdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!guestdto.equals(null)) {
			return guestdto;
		} else {
			return guestdto;
		}
	}*/
	/*public ArrayList<GuestDTO> getGuestDetailsByEventId(EventGuestDTO eventGuestDto) {
		ArrayList<GuestDTO> guestdto = new ArrayList<GuestDTO>();
		try {
			//System.out.println("3. In FarmDAO getFarmDetailsByMemberId----------");
			SqlMapClient session = new IbatisFactory().getSession();
			String sEventId = eventGuestDto.getEventId();
            //String sMemberId = memberFarmDto.getMemberId();
            //System.out.println("3.1 In FarmDAO getFarmDetailsByMemberId----------sMemberId==="+sMemberId);
			guestdto = (ArrayList<GuestDTO>) session.queryForList("Guest.getGuestDetailsByEventId", sEventId);
			//System.out.println("3.2 In FarmDAO getFarmDetailsByMemberId----------farmdto size==" + farmdto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!guestdto.equals(null)) {
			return guestdto;
		} else {
			return guestdto;
		}
	}*/
	/*public String guestUpdate(GuestDTO guestDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In FarmDAO farmUpdate---------- getFarmName===" + farmDto.getFarmName());
			//System.out.println("3.1. In FarmDAO getFarmId---------- getFarmId===" + farmDto.getFarmId());
			session.insert("Guest.Update", guestDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/
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
