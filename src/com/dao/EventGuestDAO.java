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
import com.ibatis.sqlmap.client.SqlMapClient;

public class EventGuestDAO {
	public String addEventGuest(EventGuestDTO eventGuestDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			//System.out.println("3. In MemberFarmDAO addMemberFarm---------- getMemberName===" +memberfarmDto.getMemberId());
			session.insert("EventGuest.addEventGuest", eventGuestDto);


			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
