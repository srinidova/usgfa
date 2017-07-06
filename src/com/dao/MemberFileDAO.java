package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.EventFileDTO;
import com.dto.MemberFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberFileDAO {
	public String memberFile(MemberFileDTO memberFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In MemberFileDAO memberFile---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("MemberFile.memberFile", memberFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<UploadFileDTO> getMemberImages(MemberFileDTO memberFileDto) {
		String result = "fail";
		ArrayList<UploadFileDTO> lstUploadFileDTO = null;
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In MemberDAO getMemberImage---------- fileId===" + memberFileDto.getMemberId());
			lstUploadFileDTO = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getMemberImages", memberFileDto.getMemberId());

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lstUploadFileDTO;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getUploadFleByMemberId(MemberFileDTO memberFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getUploadFleByMemberId",
					memberFileDTO.getMemberId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}

	public String deleteMemberFile(MemberFileDTO memberFileDTO) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("MemberFile.deleteMemberFile", memberFileDTO);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UploadFileDTO> getMemberFilesByFileId(MemberFileDTO memberFileDTO) {
		ArrayList<UploadFileDTO> uploadFiledto = new ArrayList<UploadFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("memberFileDto.getFileId =="+memberFileDTO.getFileId());
			uploadFiledto = (ArrayList<UploadFileDTO>) session.queryForList("UploadFile.getMemberFilesByFileId", memberFileDTO.getFileId());
			System.out.println("uploadFiledto.size =="+uploadFiledto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadFiledto;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<MemberFileDTO> getMemberFileByFileId(MemberFileDTO memberFileDTO) {
		ArrayList<MemberFileDTO> memberFileDto = new ArrayList<MemberFileDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			System.out.println("memberFileDTO.getFileId =="+memberFileDTO.getFileId());
			memberFileDto = (ArrayList<MemberFileDTO>) session.queryForList("MemberFile.getMemberFileByFileId", memberFileDTO.getFileId());
			System.out.println("memberFileDTO.size =="+memberFileDto.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberFileDto;
	}
}
