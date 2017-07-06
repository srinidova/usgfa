package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProgramDAO {
	public String addProgram(ProgramDTO programDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Program.addProgram", programDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<ProgramDTO> getProgramDetails() {
		ArrayList<ProgramDTO> programdto = new ArrayList<ProgramDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			programdto = (ArrayList<ProgramDTO>) session .queryForList("Program.getProgramDetails");
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
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sProgramId = programDto.getProgramId();

			programdto = (ArrayList<ProgramDTO>) session.queryForList("Program.getProgramById", sProgramId);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return programdto;
	}
	
	
	public String deleteProgram(ProgramDTO programDto){
		String result = "fail";
		
		try{
			SqlMapClient session = new IbatisFactory().getSession();
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

			session.insert("Program.programUpdate", programDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ProgramDTO> searchProgram(ProgramDTO programDto) {
		ArrayList<ProgramDTO> programdto = new ArrayList<ProgramDTO>();
		boolean bAnd = false;
		String sQuery = null;
		//System.out.println("in to memberDAO");
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sProgramName = programDto.getProgramName();
			String sChannel = programDto.getChannel();
			String sGuest = programDto.getGuest();
			
			System.out.println("3.a In ProgramDAO searchProgram---------- sProgramName===" + sProgramName);
			System.out.println("3.b In ProgramDAO searchProgram---------- sChannel===" + sChannel);
			System.out.println("3.c In ProgramDAO searchProgram---------- sGuest===" + sGuest);

			programdto = (ArrayList<ProgramDTO>) session.queryForList("Program.programSearch", programDto);
			System.out.println("in to program Update size"+programdto.size());
	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return programdto;
	}
}
