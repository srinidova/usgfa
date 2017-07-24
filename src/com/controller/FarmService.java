package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.FarmBO;
import com.bo.FarmFileBO;
import com.bo.MemberBO;
import com.dto.FarmDTO;
import com.dto.FarmFileDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;
import com.dto.UploadFileDTO;

import net.sf.json.JSONObject;

@Path("/farmService")
public class FarmService {

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getFarm")
	public JSONObject getFarm(@Context HttpServletRequest request) {

		JSONObject jobj = new JSONObject();
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("MEMBERID");
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();
		String farmId = null;
		ArrayList<UploadFileDTO> lstUploadFarmFileDTO = null;

		try {
			if (StringUtils.isNotEmpty(memberId)) {

				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);
				
				FarmBO fbo  = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);
				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmEdit", farmList);
					for(int i=0; i < farmList.size(); i++){
						FarmDTO farmDTO = farmList.get(i);
						if(farmDTO != null){
							farmId = farmDTO.getFarmId();
						}
					}
				}
				
				//get farm images		
				System.out.println("4. farmId==="+farmId);		
				if (StringUtils.isNotEmpty(farmId)) {		
					System.out.println("in to farm images");		
					FarmFileDTO farmFileDto = new FarmFileDTO();		
					farmFileDto.setFarmId(farmId);		
					FarmFileBO farmFileBo = new FarmFileBO();		
					lstUploadFarmFileDTO = farmFileBo.getFarmImages(farmFileDto);		
					System.out.println("lstUploadFarmFileDTO.size===="+lstUploadFarmFileDTO.size());		
					if(lstUploadFarmFileDTO != null && lstUploadFarmFileDTO.size()>0){			
						jobj.put("FARMFILES", lstUploadFarmFileDTO);					
						
						
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj;

	}
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/deleteFarm")
	public JSONObject deleteFarm(@QueryParam("farmId") String farmId, @Context HttpServletRequest request) {
		System.out.println("in to farm delete==farmId=="+farmId);
		JSONObject jobj1 = new JSONObject();
		FarmBO bo = new FarmBO();
		String path = "";
		
		String result = "fail";
		try {
			path = request.getServletContext().getRealPath("/");
			result = bo.deleteFarm(farmId, path);
			if(!"fail".equals(result)){
			jobj1.put("FarmDelete", result);
			}else{
				jobj1.put("FarmDelete", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jobj1;

	}
	
	
	
}

