package com.dao;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.connection.IbatisFactory;
import com.dto.MemberDTO;
import com.ibatis.sqlmap.client.SqlMapClient;


public class MemberDAO {
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
	public ArrayList<MemberDTO> searchMember(MemberDTO memberDto) {
		ArrayList<MemberDTO> memberdto = new ArrayList<MemberDTO>();
		boolean bAnd = false;
		String sQuery = null;
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sMemName = memberDto.getFirstName();
			String sMemPro = memberDto.getProfession();
			//System.out.println("3.a In MemberDAO searchMember---------- sMemName===" + sMemName);
			//System.out.println("3.b In MemberDAO searchMember---------- sMemPro===" + sMemPro);
/*			StringBuffer objStringBuffer = new StringBuffer("select memberId,title,firstName,middleName,lastName,mobile,email,address,place,mandal,district,state,pincode,profession,updatedBy,updatedOn,haveFarm,memberType,amountPaid,password from member ");
			String sMemName = memberDto.getFirstName();
			String sMemPro = memberDto.getProfession();
			
			if(StringUtils.isNotEmpty(sMemName)){
				if (bAnd) {
					objStringBuffer.append(" and firstName like '" + sMemName + "%'");
				} else {
					objStringBuffer.append(" where firstName like '" + sMemName + "%'");
					bAnd = true;
				}
			}
			if(StringUtils.isNotEmpty(sMemPro)){
				if (bAnd) {
					objStringBuffer.append(" and profession like '" + sMemPro + "%'");
				} else {
					objStringBuffer.append(" where profession like '" + sMemPro + "%'");
					bAnd = true;
				}
			}
			sQuery = objStringBuffer.toString();
			System.out.println("3. In MemberDAO searchMember---------- sQuery===" + sQuery);*/
			memberdto = (ArrayList<MemberDTO>) session.queryForList("Member.memberSearch", memberDto);

		}catch(Exception e){
			
		}
		return memberdto;
	}
}
