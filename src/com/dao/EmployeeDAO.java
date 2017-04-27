package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.NewsDTO;
import com.dto.SkillsDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class EmployeeDAO {

	public ArrayList<BloodGroupDTO> getBloodGroups() {
		ArrayList<BloodGroupDTO> bgdto = new ArrayList<BloodGroupDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			bgdto = (ArrayList<BloodGroupDTO>) session
					.queryForList("Employee.getBloodGroup");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!bgdto.equals(null)) {
			return bgdto;
		} else {
			return bgdto;
		}
	}

	public ArrayList<SkillsDTO> getSkills() {
		ArrayList<SkillsDTO> skilldto = new ArrayList<SkillsDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			skilldto = (ArrayList<SkillsDTO>) session
					.queryForList("Employee.getSkillDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!skilldto.equals(null)) {
			return skilldto;
		} else {
			return skilldto;
		}
	}

	public String setUserDetails(EmployeeDTO empDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			session.insert("Employee.setUserDetails", empDto);
			ArrayList skillList = new ArrayList();
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
			}
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<EmployeeDTO> getEmpDetails() {
		ArrayList<EmployeeDTO> empdto = new ArrayList<EmployeeDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			empdto = (ArrayList<EmployeeDTO>) session
					.queryForList("Employee.getEmpDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!empdto.equals(null)) {
			return empdto;
		} else {
			return empdto;
		}
	}

	public String deleteEmpDetails(EmployeeDTO dto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			session.delete("Employee.deleteEmpDetails", dto);
			session.delete("Employee.deleteEmpSkills", dto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<EmployeeDTO> getEmpDetailsById(String empId) {
		ArrayList<EmployeeDTO> empdto = new ArrayList<EmployeeDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			empdto = (ArrayList<EmployeeDTO>) session.queryForList(
					"Employee.getEmpDetailsById", empId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!empdto.equals(null)) {
			return empdto;
		} else {
			return empdto;
		}
	}

	public ArrayList<SkillsDTO> getSkillDetailsById(String empId) {
		ArrayList<SkillsDTO> skilldto = new ArrayList<SkillsDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			skilldto = (ArrayList<SkillsDTO>) session.queryForList(
					"Employee.getSkillDetailsById", empId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!skilldto.equals(null)) {
			return skilldto;
		} else {
			return skilldto;
		}
	}

	public String updateUserDetails(EmployeeDTO empDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			session.delete("Employee.deleteEmpSkills", empDto);
			session.insert("Employee.updateUserDetails", empDto);
			ArrayList skillList = new ArrayList();
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
			}
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String setNewsDetails(NewsDTO newsDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			System.out.println("3. In EmployeeDAO setNewsDetails---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("News.setNewsDetails", newsDto);
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
	
	
	
}
