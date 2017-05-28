package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.EventGuestDTO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class EventGuestDAO {
	public String addEventGuest(EventGuestDTO eventGuestDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			
			//System.out.println("3. In EventGuestDAO addEventGuest---------- getGuestName===" +guestDto.getMemberId());
			session.insert("EventGuest.addEventGuest", eventGuestDto);


			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String deleteEventGuest(EventGuestDTO eventGuestDTO) {
		String result = "fail";
		try {
			//System.out.println("3. In GuestDAO deleteGuest----------");
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("EventGuest.deleteGuest", eventGuestDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<EventGuestDTO> getEventGuestByGuestId(EventGuestDTO eventGuestDTO) {
		String result = "fail";
		ArrayList<EventGuestDTO> lstEventGuestDTO = new ArrayList<EventGuestDTO>();
		try {
			//System.out.println("3. In GuestDAO getEventGuestByGuestId----------");
			SqlMapClient session = new IbatisFactory().getSession();
			lstEventGuestDTO = (ArrayList<EventGuestDTO>)session.queryForList("EventGuest.getEventGuestByGuestId", eventGuestDTO.getGuestId());
			
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstEventGuestDTO;
	}
}
