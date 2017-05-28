package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.NewsDAO;
import com.dao.ProgramDAO;
import com.dto.EmployeeDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.UploadFileDTO;
import com.ibatis.dao.client.Dao;

public class ProgramBO {

	public String addProgram(ProgramDTO programDto) {
		//System.out.println("2. In programBO---------- addProgram===" + programDto.getProgramName());
		ProgramDAO dao = new ProgramDAO();
		return dao.addProgram(programDto);
	}
	public ArrayList<ProgramDTO> getProgramDetails ()
	{
		//System.out.println("2. In ProgramBO --------------- getProgamDetails=== ");
		ProgramDAO dao = new ProgramDAO();
		ArrayList<ProgramDTO> programdto = new ArrayList<ProgramDTO>();
		return dao.getProgramDetails();
	}
	public ArrayList<ProgramDTO> getProgramProfile(ProgramDTO programDto){
	     //System.out.println("2. In ProgramBO----------- getProgramProfile====");
	     ProgramDAO dao = new ProgramDAO();
	     return dao.getProgramProfile(programDto);
	}
	public String deleteProgram(ProgramDTO programDto)
	{
		//System.out.println("2. In ProgramBO --------------- deleteProgram=== ");
		ProgramDAO dao = new ProgramDAO();
		return dao.deleteProgram(programDto);
		
	}
	public String programUpdate(ProgramDTO programDto) {
		//System.out.println("2. In ProgramBO---------- programUpdate===" + programDto.getProgramName());
		ProgramDAO dao = new ProgramDAO();
		return dao.programUpdate(programDto);
	}
    
}

