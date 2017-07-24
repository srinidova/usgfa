package com.bo;

import java.util.ArrayList;

import org.apache.commons.lang.StringUtils;

import com.dao.FarmDAO;
import com.dao.MemberDAO;
import com.dto.FarmDTO;
import com.dto.FarmFileDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.UploadFileDTO;

public class FarmBO {

	public String addFarm(FarmDTO farmDto) {
		FarmDAO dao = new FarmDAO();
		return dao.addFarm(farmDto);
	}

	public ArrayList<FarmDTO> getFarmDetails() {
		FarmDAO dao = new FarmDAO();
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		return dao.getFarmDetails();
	}

	public ArrayList<FarmDTO> getFarmDetailsByMemberId(MemberFarmDTO memberFarmDto) {
		FarmDAO dao = new FarmDAO();
		ArrayList<FarmDTO> farmdto = new ArrayList<FarmDTO>();
		return dao.getFarmDetailsByMemberId(memberFarmDto);
	}

	public String farmUpdate(FarmDTO farmDto) {
		FarmDAO dao = new FarmDAO();
		return dao.farmUpdate(farmDto);
	}

	public String deleteFarm(String sFarmId, String sPath) {
		String result = "fail";
		String sFileId = null;
		FarmFileBO farmFileBO = new FarmFileBO();
		try {
			// **** getting farmFile **** //
			ArrayList<FarmFileDTO> lstFarmFileDTO = farmFileBO.getFarmFileByFarmId(sFarmId);

			if (lstFarmFileDTO != null && lstFarmFileDTO.size() > 0) {
				for (int i = 0; i < lstFarmFileDTO.size(); i++) {
					FarmFileDTO farmFileDTO = lstFarmFileDTO.get(i);

					sFileId = farmFileDTO.getFileId();
					System.out.println("in farmbo fileid " + sFileId);

					if (StringUtils.isNotEmpty(sFileId)) {
						// **** delete farmFiles **** //
						ArrayList<UploadFileDTO> lstLatestUploadFiles = farmFileBO.deleteFileFarm(sFileId, sPath);
					}
				}
			}

			// **** delete memberFarm **** //
			MemberFarmBO memberFarmBO = new MemberFarmBO();
			memberFarmBO.deleteMemberFarm(sFarmId);

			// **** delete farm **** //
			FarmDAO dao = new FarmDAO();
			result = dao.deleteFarm(sFarmId);

		} catch (Exception e) {
			System.out.println("in to farmbo deleteFarm");
			e.printStackTrace();
		}
		return result;
	}
}
