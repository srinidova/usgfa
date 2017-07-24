package com.bo;

import java.util.ArrayList;

import com.dao.CommitteeDAO;
import com.dto.CommitteeDTO;
import com.dto.MemberDTO;

public class CommitteeBO {

	public String addCommittee(CommitteeDTO committeeDto) {
		CommitteeDAO dao = new CommitteeDAO();
		return dao.addCommittee(committeeDto);
	}

	public ArrayList<CommitteeDTO> getCommitteeDetails() {
		CommitteeDAO dao = new CommitteeDAO();
		return dao.getCommitteeDetails();
	}

	public ArrayList<CommitteeDTO> getCommitteeProfile(CommitteeDTO committeeDto) {
		CommitteeDAO dao = new CommitteeDAO();
		return dao.getCommitteeProfile(committeeDto);
	}

	public ArrayList<MemberDTO> getCommitteeMembers() {
		ArrayList<MemberDTO> memberList = null;
		CommitteeBO boComm = new CommitteeBO();
		ArrayList<CommitteeDTO> committeeList = new ArrayList<CommitteeDTO>();
		MemberBO bo = new MemberBO();
		
		committeeList = boComm.getCommitteeDetails();
		if (committeeList != null && committeeList.size() > 0) {
			memberList = new ArrayList<MemberDTO>();

			for (CommitteeDTO commDto : committeeList) {
				String sCommMemMemId = commDto.getMemberId();
				String sCommMemRole = commDto.getRole();
				String sCommMemDispOrder = commDto.getDisplayOrder();
				String sCommMemComments = commDto.getComments();
				String sCommMemCommId = commDto.getCommitteeId();

				MemberDTO dto = new MemberDTO();
				dto.setMemberId(sCommMemMemId);


				ArrayList<MemberDTO> commMemberList = bo.getMemberProfile(dto);
				for (MemberDTO commMember : commMemberList) {

					commMember.setCommitteRole(sCommMemRole);
					commMember.setCommitteDispayOder(sCommMemDispOrder);
					commMember.setCommitteComments(sCommMemComments);
					commMember.setCommitteId(sCommMemCommId);

					memberList.add(commMember);
				}
			}
			if (memberList != null && memberList.size() > 0) {
				memberList = bo.updatedMembers(memberList);
			}
		}
		return memberList;
	}

	public String deleteCommittee(CommitteeDTO committeeDto) {
		CommitteeDAO dao = new CommitteeDAO();
		return dao.deleteCommittee(committeeDto);
	}

	public String updateCommittee(CommitteeDTO committeeDto) {
		CommitteeDAO dao = new CommitteeDAO();
		return dao.updateCommittee(committeeDto);
	}
}
