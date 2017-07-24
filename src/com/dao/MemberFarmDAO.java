package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberFarmDAO {
	public String addMemberFarm(MemberFarmDTO memberfarmDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("MemberFarm.addMemberFarm", memberfarmDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String deleteMemberFarm(String sFarmId) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("MemberFarm.deleteMemberFarm", sFarmId);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<MemberFarmDTO> getMemberFarmByMemberId(String sMemberId) {
		ArrayList<MemberFarmDTO> lstMemFarm = new ArrayList<MemberFarmDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			lstMemFarm = (ArrayList<MemberFarmDTO>) session.queryForList("MemberFarm.getMemberFarmByMemberId",
					sMemberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstMemFarm;
	}
}
