package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
import com.dto.MemberDTO;
import com.dto.NewsDTO;
import com.dto.SkillsDTO;
import com.dto.StoriesDTO;
import com.dto.UploadFileDTO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class EventDAO {
	public String addEvent(EventDTO eventDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.insert("Event.addEvent", eventDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public ArrayList<EventDTO> getEventDetails() {
		ArrayList<EventDTO> eventdto = new ArrayList<EventDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			eventdto = (ArrayList<EventDTO>) session.queryForList("Event.getEventDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!eventdto.equals(null)) {
			return eventdto;
		} else {
			return eventdto;
		}
	}
	public ArrayList<EventDTO> getEventProfile(EventDTO eventDto) {
		ArrayList<EventDTO> eventdto = new ArrayList<EventDTO>();
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			String sEventId = eventDto.getEventId();
			eventdto = (ArrayList<EventDTO>) session.queryForList("Event.getEventById", sEventId);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return eventdto;
	}
	public String eventUpdate(EventDTO eventDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			session.insert("Event.eventUpdate", eventDto);
			
            
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String deleteEvent(EventDTO eventDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Event.deleteEvent", eventDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<EventDTO> searchEvent(EventDTO eventDto) {
		ArrayList<EventDTO> eventdto = new ArrayList<EventDTO>();
		boolean bAnd = false;
		String sQuery = null;
		try{
			SqlMapClient session = new IbatisFactory().getSession();
			
			String sEventName = eventDto.getEventName();
			String sEventDays = eventDto.getNoOfDays();
			String sEventDate = eventDto.getTimeFrom();
			String sEventAddress = eventDto.getAddress();
			
			System.out.println("3.a In EventDAO searchEvent---------- sEventName===" + sEventName);
			System.out.println("3.a In EventDAO searchEvent---------- sEventDays===" + sEventDays);
			System.out.println("3.a In EventDAO searchEvent---------- sEventDate===" + sEventDate);
			System.out.println("3.a In EventDAO searchEvent---------- sEventAddress===" + sEventAddress);

			eventdto = (ArrayList<EventDTO>) session.queryForList("Event.eventSearch", eventDto);
			
			
			System.out.println("in to event search eventsize"+eventdto.size());

		}catch(Exception e){
			
		}
		return eventdto;
	}
	
}
