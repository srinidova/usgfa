package com.dao;

import java.util.ArrayList;
import java.util.StringTokenizer;

import com.connection.IbatisFactory;
import com.dto.BloodGroupDTO;
import com.dto.EmployeeDTO;
import com.dto.EventDTO;
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
			/*
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 */
			////System.out.println("3. In EventDAO addEvent---------- getNewsTitle===" + eventDto.getEventName());
			session.insert("Event.addEvent", eventDto);
/*			ArrayList skillList = new ArrayList();
			EmployeeDTO skDto = new EmployeeDTO();
			StringTokenizer strtoken = new StringTokenizer(
					empDto.getEmpSkills(), ",");
			while (strtoken.hasMoreTokens()) {
				skillList.add(strtoken.nextToken());
			}
			for (int i = 0; i < skillList.size(); i++) {
				if ((skillList.get(i) == null) || skillList.equals(""))
					continue;
				skDto.setEmpSkills(skillList.get(i).toString());
				skDto.setEmpId(empDto.getEmpId());
				session.insert("Employee.setUserSkills", skDto);
			}*/
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/*public ArrayList<NewsDTO> getNewsDetails() {
		ArrayList<NewsDTO> newsdto = new ArrayList<NewsDTO>();
		try {
			////System.out.println("3. In NewsDAO getNewsDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();
			
			 * bgdto = (ArrayList<BloodGroupDTO>)
			 * session.queryForList("getBloodGroup");
			 
			newsdto = (ArrayList<NewsDTO>) session
					.queryForList("News.getNewsDetails");
			//System.out.println("3. In NewsDAO getNewsDetails----------newsdto=="+newsdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!newsdto.equals(null)) {
			return newsdto;
		} else {
			return newsdto;
		}
	}*/
	public ArrayList<EventDTO> getEventDetails() {
		ArrayList<EventDTO> eventdto = new ArrayList<EventDTO>();
		try {
			//System.out.println("3. In EvenetDAO getEventDetails----------");
			SqlMapClient session = new IbatisFactory().getSession();

			eventdto = (ArrayList<EventDTO>) session.queryForList("Event.getEventDetails");
			//System.out.println("3. In EventDAO getEventDetails----------eventdto==" + eventdto);
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
			//System.out.println("3. In EventDAO getEventProfile----------");
			SqlMapClient session = new IbatisFactory().getSession();

			String sEventId = eventDto.getEventId();
			//System.out.println("3b. In EventDAO getEventProfile----------sEventId==" + sEventId);
			eventdto = (ArrayList<EventDTO>) session.queryForList("Event.getEventById", sEventId);

			//System.out.println("3c. In EventDAO getEventProfile----------eventdto1 size==" + eventdto.size());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eventdto;
	}
	public String eventUpdate(EventDTO eventDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In EventDAO eventUpdate---------- getEventName===" + eventDto.getEventName());
			session.insert("Event.eventUpdate", eventDto);
			
			//System.out.println("3. In EventDAO eventUpdate---------- getEventId===" + eventDto.getEventId());
            
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String deleteEvent(EventDTO eventDto) {
		String result = "fail";
		try {
			System.out.println("3. In EventDAO getdeleteEvent----------");
			SqlMapClient session = new IbatisFactory().getSession();
			session.delete("Event.deleteEvent", eventDto);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String getEventImage(UploadFileDTO uploadFileDto) {
		String result = "fail";
		try {
			SqlMapClient session = new IbatisFactory().getSession();

			//System.out.println("3. In NewsDAO newsUpdate---------- getNewsTitle===" + newsDto.getNewsTitle());
			session.insert("News.newsUpdate", uploadFileDto);

			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
