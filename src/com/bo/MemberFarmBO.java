package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.FarmDAO;
import com.dao.MemberDAO;
import com.dao.MemberFarmDAO;
import com.dao.NewsDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;

public class MemberFarmBO {

	public String addMemberFarm(MemberFarmDTO memberfarmDto) {
		//System.out.println("2. In MemberBO---------- addNewsDetails===" +memberfarmDto.getFarmId());
		MemberFarmDAO dao = new MemberFarmDAO();
		//MemberDAO dao = new MemberDAO();	
		return dao.addMemberFarm(memberfarmDto);
		//return dao.addMember(memberDto);
	}
	/*public ArrayList<NewsDTO> getNewsDetails() {
		//System.out.println("2. In NewsBO---------- getNewsDetails===");
		NewsDAO dao = new NewsDAO();
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		return dao.getNewsDetails();
	}*/
	/*public String memberFarmUpdate(MemberFarmDTO memberfarmDto) {
		//System.out.println("2. In memberFarmBO---------- memberfarmUpdate===" + memberfarmDto.getMemberId());
		MemberFarmDAO dao = new MemberFarmDAO();
		return dao.memberFarmUpdate(memberfarmDto);
		//return dao.addMemberFarm(memberfarmDto);
		
	}*/
}
