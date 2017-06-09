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
		MemberFarmDAO dao = new MemberFarmDAO();
		return dao.addMemberFarm(memberfarmDto);
	}
	
}
