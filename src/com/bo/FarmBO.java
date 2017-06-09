package com.bo;

import java.util.ArrayList;

import com.dao.FarmDAO;
import com.dto.FarmDTO;
import com.dto.MemberFarmDTO;

public class FarmBO {

	public String addFarm(FarmDTO farmDto) {
		FarmDAO dao = new FarmDAO();
		return dao.addFarm(farmDto);
	}
	public ArrayList<FarmDTO> getFarmDetails() {
		FarmDAO dao = new FarmDAO();
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		return dao.getFarmDetails();
	}
	public ArrayList<FarmDTO> getFarmDetailsByMemberId(MemberFarmDTO memberFarmDto) {
		FarmDAO dao = new FarmDAO();
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		return dao.getFarmDetailsByMemberId(memberFarmDto);
	}
	public String farmUpdate(FarmDTO farmDto) {
		FarmDAO dao = new FarmDAO();
		return dao.farmUpdate(farmDto);
		
	}
}
