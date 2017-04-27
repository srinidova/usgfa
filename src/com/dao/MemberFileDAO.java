package com.dao;

import java.util.ArrayList;

import com.connection.IbatisFactory;
import com.dto.MemberFileDTO;
import com.dto.NewsDTO;
import com.dto.NewsFileDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberFileDAO {
	public String memberFile(MemberFileDTO memberFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In NewsDAO setNewsDetails---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("MemberFile.memberFile", memberFileDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}
