package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dao.ProgramDAO;
import com.dto.EmployeeDTO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.UploadFileDTO;
import com.ibatis.dao.client.Dao;

public class ProgramBO {

	public String addProgram(ProgramDTO programDto) {
		ProgramDAO dao = new ProgramDAO();
		return dao.addProgram(programDto);
	}
	public ArrayList<ProgramDTO> getProgramDetails ()
	{
		ProgramDAO dao = new ProgramDAO();
		ArrayList<ProgramDTO> programdto = new ArrayList<ProgramDTO>();
		return dao.getProgramDetails();
	}
	public ArrayList<ProgramDTO> getProgramProfile(ProgramDTO programDto){
	     ProgramDAO dao = new ProgramDAO();
	     return dao.getProgramProfile(programDto);
	}
	public String deleteProgram(ProgramDTO programDto)
	{
		ProgramDAO dao = new ProgramDAO();
		return dao.deleteProgram(programDto);
		
	}
	public String programUpdate(ProgramDTO programDto) {
		ProgramDAO dao = new ProgramDAO();
		return dao.programUpdate(programDto);
	}
	public ArrayList<ProgramDTO> searchProgram(ProgramDTO programDto){
		ProgramDAO dao = new ProgramDAO();
	     return dao.searchProgram(programDto);
	}
	public ArrayList<ProgramDTO> getProgramDetailsHome(ProgramDTO programDto) {
		ProgramDAO dao = new ProgramDAO();
		return dao.getProgramDetailsHome(programDto);
	}
}

