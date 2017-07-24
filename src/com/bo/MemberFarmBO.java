package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.FarmDAO;
import com.dao.FarmFileDAO;
import com.dao.MemberDAO;
import com.dao.MemberFarmDAO;
import com.dao.NewsDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.FarmDTO;
import com.dto.FarmFileDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;
import com.dto.UploadFileDTO;

public class MemberFarmBO {

	public String addMemberFarm(MemberFarmDTO memberfarmDto) {
		MemberFarmDAO dao = new MemberFarmDAO();
		return dao.addMemberFarm(memberfarmDto);
	}
	public String deleteMemberFarm(String sFarmId){
		MemberFarmDAO dao = new MemberFarmDAO();
		return dao.deleteMemberFarm(sFarmId);
	}
	public  ArrayList<MemberFarmDTO> getMemberFarmByMemberId(String sMemberId){
		ArrayList<MemberFarmDTO> lstMemFarm = null;
		MemberFarmDAO dao = new MemberFarmDAO();
		lstMemFarm = dao.getMemberFarmByMemberId(sMemberId);
		return lstMemFarm;
	}

}
