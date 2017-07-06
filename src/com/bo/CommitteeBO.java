package com.bo;

import java.util.ArrayList;

import com.dao.CommitteeDAO;
import com.dto.CommitteeDTO;
import com.dto.MemberDTO;

public class CommitteeBO {

	public String addCommittee(CommitteeDTO committeeDto) {
		// System.out.println("in to committeeBo");
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
		// System.out.println("b.1 In BO getCommitteeMembers");
		ArrayList<MemberDTO> memberList = null;
		CommitteeBO boComm = new CommitteeBO();
		ArrayList<CommitteeDTO> committeeList = new ArrayList<CommitteeDTO>();

		committeeList = boComm.getCommitteeDetails();
		// System.out.println("b.2 In BO getCommitteeMembers
		// committeeList.size==" + committeeList.size());
		if (committeeList != null && committeeList.size() > 0) {
			memberList = new ArrayList<MemberDTO>();

			for (CommitteeDTO commDto : committeeList) {
				String sCommMemMemId = commDto.getMemberId();
				// System.out.println("b.3 In BO getCommitteeMembers
				// sCommMemMemId=="+sCommMemMemId);
				String sCommMemRole = commDto.getRole();
				String sCommMemDispOrder = commDto.getDisplayOrder();
				String sCommMemComments = commDto.getComments();
				String sCommMemCommId = commDto.getCommitteeId();

				MemberDTO dto = new MemberDTO();
				dto.setMemberId(sCommMemMemId);

				MemberBO bo = new MemberBO();
				ArrayList<MemberDTO> commMemberList = bo.getMemberProfile(dto);
				// System.out.println("b.4 In BO getCommitteeMembers
				// commMemberList.size=="+commMemberList.size());
				for (MemberDTO commMember : commMemberList) {

					commMember.setCommitteRole(sCommMemRole);
					commMember.setCommitteDispayOder(sCommMemDispOrder);
					commMember.setCommitteComments(sCommMemComments);
					commMember.setCommitteId(sCommMemCommId);

					memberList.add(commMember);
				}
			}
		}
		// System.out.println("b.z In BO getCommitteeMembers
		// memberList.size=="+memberList.size());
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
