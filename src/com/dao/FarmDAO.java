package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class FarmDAO {
	public String addFarm(FarmDTO farmDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Farm.addFarm", farmDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<FarmDTO> getFarmDetails() {
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			farmdto = (ArrayList<FarmDTO>) session.queryForList("Farm.getFarmDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!farmdto.equals(null)) {
			return farmdto;
		} else {
			return farmdto;
		}
	}
	public ArrayList<FarmDTO> getFarmDetailsByMemberId(MemberFarmDTO memberFarmDto) {
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
            String sMemberId = memberFarmDto.getMemberId();
			farmdto = (ArrayList<FarmDTO>) session.queryForList("Farm.getFarmDetailsByMemberId", sMemberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!farmdto.equals(null)) {
			return farmdto;
		} else {
			return farmdto;
		}
	}
	public String farmUpdate(FarmDTO farmDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("Farm.farmUpdate", farmDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String deleteFarm(String sFarmId) {
		String result = "fail";
		System.out.println("in to delete farm DAO");
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Farm.deleteFarm", sFarmId);
			result = "success";
			System.out.println("after delete farm dao ");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
