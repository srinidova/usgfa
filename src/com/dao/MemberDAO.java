package com.dao;

import java.io.Reader;
import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.connection.IbatisFactory;
import com.dto.MemberDTO;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;


public class MemberDAO {
	//static Logger log = Logger.getLogger(MemberDAO.class.getName());

	public String addMember(MemberDTO memberDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
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
			SqlMapClient session = new IbatisFactory().getSession();

			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.getMemberDetails");
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
			SqlMapClient session = new IbatisFactory().getSession();

			String sMemberId = memberDto.getMemberId();
			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.getMemberById", sMemberId);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberdto;
	}
	public String memberUpdate(MemberDTO memberDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

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
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Member.deleteMember", memberDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<MemberDTO> getMemberByMobile(MemberDTO memberDto) {
		ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			String sMobile = memberDto.getMobile();
			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.getMemberByMobile", sMobile);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberdto;
	}
	
	public String passwordUpdate(MemberDTO memberDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("Member.passwordUpdate", memberDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}	
	@SuppressWarnings("unchecked")
	public ArrayList<MemberDTO> searchMember(MemberDTO memberDto) {
		ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		boolean bAnd = false;
		String sQuery = null;
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sMemName = memberDto.getFirstName();
			String sMemPro = memberDto.getProfession();
			String sMemship = memberDto.getMemberType();
			String sMemPlace = memberDto.getPlace();
			String sMemHaveFarm = memberDto.getHaveFarm();
			

			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.memberSearch", memberDto);
	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return memberdto;
	}
}
