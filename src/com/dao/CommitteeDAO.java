package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.CommitteeDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class CommitteeDAO {
	public String addCommittee(CommitteeDTO committeeDto) {
		String result = "fail";
		try {
			System.out.println("1. in to committeeDao");
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("2. in to committeeDao");
			session.insert("Committee.addCommittee", committeeDto);
			result = "success";
			System.out.println("after committeeDao result" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<CommitteeDTO> getCommitteeDetails() {
		ArrayList<CommitteeDTO> committeedto = new ArrayList<CommitteeDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			committeedto = (ArrayList<CommitteeDTO>) session.queryForList("Committee.getCommitteeDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!committeedto.equals(null)) {
			return committeedto;
		} else {
			return committeedto;
		}
	}

	@SuppressWarnings("unchecked")
	public ArrayList<CommitteeDTO> getCommitteeProfile(CommitteeDTO committeeDto) {
		ArrayList<CommitteeDTO> committeedto = new ArrayList<CommitteeDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			String sCommitteeId = committeeDto.getCommitteeId();
			committeedto = (ArrayList<CommitteeDTO>) session.queryForList("Committee.getCommitteeById", sCommitteeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return committeedto;
	}

	public String deleteCommittee(CommitteeDTO committeeDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Committee.deleteCommittee", committeeDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String updateCommittee(CommitteeDTO committeeDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Committee.updateCommittee", committeeDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
