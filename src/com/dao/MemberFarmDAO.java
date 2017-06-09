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
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
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
	
}
