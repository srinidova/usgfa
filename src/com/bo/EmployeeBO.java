package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.NewsDTO;
import com.dto.SkillsDTO;

public class EmployeeBO {

	public ArrayList<BloodGroupDTO> getBloodGroups() {
		EmployeeDAO dao = new EmployeeDAO();
		ArrayList<BloodGroupDTO> bgdto = new ArrayList<BloodGroupDTO>();
		return dao.getBloodGroups();
	}

	public ArrayList<SkillsDTO> getSkills() {
		EmployeeDAO dao = new EmployeeDAO();
		ArrayList<SkillsDTO> bgdto = new ArrayList<SkillsDTO>();
		return dao.getSkills();
	}

	public String setUserDetails(EmployeeDTO empDto) {
		EmployeeDAO dao = new EmployeeDAO();
		return dao.setUserDetails(empDto);
	}

	public ArrayList<EmployeeDTO> getEmpDetails() {
		EmployeeDAO dao = new EmployeeDAO();
		ArrayList<EmployeeDTO> empdto = new ArrayList<EmployeeDTO>();
		return dao.getEmpDetails();
	}

	public String deleteEmpDetails(EmployeeDTO dto) {
		EmployeeDAO dao = new EmployeeDAO();
		return dao.deleteEmpDetails(dto);
	}

	public ArrayList<EmployeeDTO> getEmpDetailsById(String empId) {
		EmployeeDAO dao = new EmployeeDAO();
		return dao.getEmpDetailsById(empId);
	}

	public ArrayList<SkillsDTO> getSkillDetailsById(String empId) {
		EmployeeDAO dao = new EmployeeDAO();
		return dao.getSkillDetailsById(empId);
	}

	public String updateUserDetails(EmployeeDTO empDto) {
		EmployeeDAO dao = new EmployeeDAO();
		return dao.updateUserDetails(empDto);
	}
	
	public String addNewsDetails(NewsDTO newsDto) {
		System.out.println("2. In addNewsDetails---------- getNewsTitle===" + newsDto.getNewsTitle());
		EmployeeDAO dao = new EmployeeDAO();
		return dao.setNewsDetails(newsDto);
	}

}
