package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProgramDAO {
	public String addProgram(ProgramDTO programDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			////System.out.println("3. In ProgramDAO addProgram---------- getProgramName===" + programDto.getProgramName());
			session.insert("Program.addProgram", programDto);
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
	
	public ArrayList<ProgramDTO> getProgramDetails() {
		ArrayList<ProgramDTO> programdto = new ArrayList<ProgramDTO>();
		try {
			////System.out.println("3. In ProgramDAO getNewsDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			programdto = (ArrayList<ProgramDTO>) session
					.queryForList("Program.getProgramDetails");
			////System.out.println("3. In ProgramDAO getProgramDetails----------programdto=="+programdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!programdto.equals(null)) {
			return programdto;
		} else {
			return programdto;
		}
	}
	
	
	public ArrayList<ProgramDTO> getProgramProfile(ProgramDTO programDto) {
		ArrayList<ProgramDTO> programdto = new ArrayList<ProgramDTO>();
		try {
			//System.out.println("3. In programDAO getProgramProfile----------");
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sProgramId = programDto.getProgramId();

			//String sNewsId = newsDto.getNewsId();
			//System.out.println("3b. In ProgramDAO getProgramProfile----------sProgramId==" + sProgramId);
			programdto = (ArrayList<ProgramDTO>) session.queryForList("Program.getProgramById", sProgramId);

			//System.out.println("3c. In ProgramDAO getProgramProfile----------programdto size==" + programdto.size());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return programdto;
	}
	
	
	public String deleteProgram(ProgramDTO programDto){
		String result = "fail";
		
		try{
			//System.out.println("3. In NewsDAO getdeleteNews----------");
			SqlMapClient session = new IbatisFactory().getSession();
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			session.delete("Program.deleteProgram",programDto);
		}catch(Exception e){
			e.printStackTrace();
		}
       		
		return result;
	}
	
	public String programUpdate(ProgramDTO programDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In ProgramDAO programUpdate---------- getProgramName===" + programDto.getProgramName());
			session.insert("Program.programUpdate", programDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
