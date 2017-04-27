package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.FarmDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;

public class FarmBO {

	public String addFarm(FarmDTO farmDto) {
		//System.out.println("2. In MemberBO---------- addFarm===" + farmDto.getFarmName());
		FarmDAO dao = new FarmDAO();
		return dao.addFarm(farmDto);
	}
	public ArrayList<FarmDTO> getFarmDetails() {
		//System.out.println("2. In FarmBO---------- getFarmDetails===");
		FarmDAO dao = new FarmDAO();
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		return dao.getFarmDetails();
	}
	public ArrayList<FarmDTO> getFarmDetailsByMemberId(MemberFarmDTO memberFarmDto) {
		//System.out.println("2. In FarmBO---------- getFarmDetailsByMemberId===");
		FarmDAO dao = new FarmDAO();
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		return dao.getFarmDetailsByMemberId(memberFarmDto);
	}
	public String farmUpdate(FarmDTO farmDto) {
		//System.out.println("2. In FarmBO---------- farmUpdate===" + farmDto.getFarmName());
		FarmDAO dao = new FarmDAO();
		return dao.farmUpdate(farmDto);
		
	}
}
