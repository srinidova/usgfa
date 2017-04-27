package com.bo;

import java.util.ArrayList;

import com.dao.EmployeeDAO;
import com.dao.EventDAO;
import com.dao.MemberDAO;
import com.dao.NewsDAO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;

public class MemberBO {

	public String addMember(MemberDTO memberDto) {
		//System.out.println("2. In MemberBO---------- addNewsDetails===" + memberDto.getFirstName());
		MemberDAO dao = new MemberDAO();		
		return dao.addMember(memberDto);
	}
	/*public ArrayList<NewsDTO> getNewsDetails() {
		//System.out.println("2. In NewsBO---------- getNewsDetails===");
		NewsDAO dao = new NewsDAO();
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		return dao.getNewsDetails();
	}*/
	
	
	public ArrayList<MemberDTO> getMemberDetails() {
		//System.out.println("2. In MemberBO---------- getMemberDetails===");
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		return dao.getMemberDetails();
	}
	public ArrayList<MemberDTO> getMemberProfile(MemberDTO memberDto){
	     //System.out.println("2. In MemberBO----------- getMemberProfile====");
	     MemberDAO dao= new MemberDAO();
	     return dao.getMemberProfile(memberDto);
	}
	public String memberUpdate(MemberDTO memberDto) {
		//System.out.println("2. In MemberBO---------- memberUpdate===" + memberDto.getFirstName());
		MemberDAO dao = new MemberDAO();
		return dao.memberUpdate(memberDto);
		
	}
	public String deleteMember(MemberDTO memberDto){
	     //System.out.println("2. In EventBO----------- getEventDelete====");
		MemberDAO dao = new MemberDAO();
	    // EventDAO  dao = new EventDAO();
		return dao.deleteMember(memberDto);
	     //return dao.addMember(memberDto);
	     //return dao.addEvent(eventDto);
		/*NewsDAO dao = new NewsDAO();
		return dao.deleteNews(newsDto);*/
	}
}
