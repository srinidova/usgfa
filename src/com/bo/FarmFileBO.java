package com.bo;

import com.dao.FarmFileDAO;
import com.dto.FarmFileDTO;

public class FarmFileBO {

	public String farmFile(FarmFileDTO farmFileDto) {
		System.out.println("2. In farmFile---------- farmFile===" + farmFileDto.getFarmId());
		FarmFileDAO dao = new FarmFileDAO();
		return dao.farmFile(farmFileDto);
	}
	
}
