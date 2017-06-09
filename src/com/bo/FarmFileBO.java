package com.bo;

import com.dao.FarmFileDAO;
import com.dto.FarmFileDTO;

public class FarmFileBO {

	public String farmFile(FarmFileDTO farmFileDto) {
		FarmFileDAO dao = new FarmFileDAO();
		return dao.farmFile(farmFileDto);
	}
	
}
