package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.ProgramDTO;
import com.dto.SkillsDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberDAO {
	public String addMember(MemberDTO memberDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			//System.out.println("3. In MemberDAO addMember---------- getMemberName===" +memberDto.getFirstName());
			session.insert("Member.addMember", memberDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public ArrayList<MemberDTO> getMemberDetails() {
		ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		try {
			//System.out.println("3. In MemberDAO getNewsDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();

			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.getMemberDetails");
			//System.out.println("3. In MemberDAO getMemberDetails----------memberdto==" + memberdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!memberdto.equals(null)) {
			return memberdto;
		} else {
			return memberdto;
		}
	}
	public ArrayList<MemberDTO> getMemberProfile(MemberDTO memberDto) {
		ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		try {
			//System.out.println("3. In MemberDAO getMemberProfile----------");
			SqlMapClient session = new IbatisFactory().getSession();

			String sMemberId = memberDto.getMemberId();
			//System.out.println("3b. In MemberDAO getMemberProfile----------sMemberId==" + sMemberId);
			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.getMemberById", sMemberId);

			//System.out.println("3c. In MemberDAO getMemberProfile----------memberdto size==" + memberdto.size());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberdto;
	}
	public String memberUpdate(MemberDTO memberDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In MemberDAO memberUpdate---------- getFirstName===" + memberDto.getFirstName());
			session.insert("Member.memberUpdate", memberDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String deleteMember(MemberDTO memberDto) {
		String result = "fail";
		try {
			//System.out.println("3. In EventDAO getdeleteEvent----------");
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Member.deleteMember", memberDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String getMemberImage(UploadFileDTO uploadFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In NewsDAO newsUpdate---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("News.newsUpdate", uploadFileDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
