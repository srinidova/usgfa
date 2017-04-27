package com.bo;

import java.util.ArrayList;

import com.dao.MemberDAO;
import com.dao.MemberFileDAO;
import com.dao.NewsDAO;
import com.dao.NewsFileDAO;
import com.dao.UploadFileDAO;
import com.dto.MemberFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;

public class MemberFileBO {

	public String memberFile(MemberFileDTO memberFileDto) {
		System.out.println("2. In memberFile---------- memberFile===" + memberFileDto.getFileId());
		MemberFileDAO dao = new MemberFileDAO();
		return dao.memberFile(memberFileDto);
	}
	
}
