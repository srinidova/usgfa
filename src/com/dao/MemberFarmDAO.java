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
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			//System.out.println("3. In MemberFarmDAO addMemberFarm---------- getMemberName===" +memberfarmDto.getMemberId());
			session.insert("MemberFarm.addMemberFarm", memberfarmDto);
/*			ArrayList skillList = new ArrayList();
			EmployeeDTO skDto = new EmployeeDTO();
			StringTokenizer strtoken = new StringTokenizer(
					empDto.getEmpSkills(), ",");
			while (strtoken.hasMoreTokens()) {
				skillList.add(strtoken.nextToken());
			}
			for (int i = 0; i < skillList.size(); i++) {
				if ((skillList.get(i) == null) || skillList.equals(""))
					continue;
				skDto.setEmpSkills(skillList.get(i).toString());
				skDto.setEmpId(empDto.getEmpId());
				session.insert("Employee.setUserSkills", skDto);
			}*/
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*public String memberFarmUpdate(MemberFarmDTO memberfarmDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In memberFarmDAO memberfarmUpdate---------- getMember===" + memberfarmDto.getMemberId());
			session.insert("Farm.farmUpdate", memberfarmDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}*/
	
}
