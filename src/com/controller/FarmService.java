package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.lang.StringUtils;

import com.bo.FarmBO;
import com.bo.MemberBO;
import com.dto.FarmDTO;
import com.dto.MemberDTO;
import com.dto.MemberFarmDTO;

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
		//System.out.println("1a. *****Called editFarm**********farmId==" + memberId);
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		ArrayList<FarmDTO> farmList = new ArrayList<FarmDTO>();

		try {
			if (StringUtils.isNotEmpty(memberId)) {

				//System.out.println("1b. *****Called FarmEdit**********memberId==" + memberId);
				MemberFarmDTO memberFarmDto = new MemberFarmDTO();
				memberFarmDto.setMemberId(memberId);
				
				FarmBO fbo  = new FarmBO();
				farmList = fbo.getFarmDetailsByMemberId(memberFarmDto);
				
				//System.out.println("****farmList.size==" + farmList.size());
				if (!(farmList.size() < 0)) {
					jobj.put("MemberFarmEdit", farmList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("editMember jobj-->" + jobj);
		return jobj;

	}
	
	
	
	
	
}
