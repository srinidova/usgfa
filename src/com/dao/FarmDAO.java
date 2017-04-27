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
			//System.out.println("3. In FarmDAO addFarm---------- getFarmName===" +farmDto.getFarmName());
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
			//System.out.println("3. In FarmDAO getFarmDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();

			farmdto = (ArrayList<FarmDTO>) session.queryForList("Farm.getFarmDetails");
			//System.out.println("3. In FarmDAO getFarmDetails----------farrmdto==" + farmdto);
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
			//System.out.println("3. In FarmDAO getFarmDetailsByMemberId----------");
			SqlMapClient session = new IbatisFactory().getSession();
            String sMemberId = memberFarmDto.getMemberId();
            //System.out.println("3.1 In FarmDAO getFarmDetailsByMemberId----------sMemberId==="+sMemberId);
			farmdto = (ArrayList<FarmDTO>) session.queryForList("Farm.getFarmDetailsByMemberId", sMemberId);
			//System.out.println("3.2 In FarmDAO getFarmDetailsByMemberId----------farmdto size==" + farmdto.size());
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

			//System.out.println("3. In FarmDAO farmUpdate---------- getFarmName===" + farmDto.getFarmName());
			//System.out.println("3.1. In FarmDAO getFarmId---------- getFarmId===" + farmDto.getFarmId());
			session.insert("Farm.farmUpdate", farmDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
