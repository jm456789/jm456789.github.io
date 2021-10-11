package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.HolidayVO;
import org.zerock.service.CalendarService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CalendarController {

	@Autowired(required = false)
	private CalendarService service;
	
	@GetMapping("/calendar/calendar")
	public void calendar() {
		
	}
	
//	@GetMapping(params="method=list")
//	public String list() {
//		ArrayList<String> list = new ArrayList<String>();
//		
//		return "/calendar/calendar";
//	}
//
//	@GetMapping("/calendar/data")
//	public String data(HolidayVO holidayVO, Model model) {
//		model.addAttribute("list", "[{\r\n" + 
//				"  \"id\":1,\r\n" + 
//				"  \"groupId\":null,\r\n" + 
//				"  \"title\":\"할일title\",\r\n" + 
//				"  \"writer\":null,\r\n" + 
//				"  \"content\":null,\r\n" + 
//				"  \"start\":\"2021-09-01T00:00:00\",\r\n" + 
//				"  \"end\":\"2021-09-03T00:00:00\",\r\n" + 
//				"  \"allday\":true,\"textColor\":\"yellow\",\r\n" + 
//				"  \"backgroundColor\":\"navy\",\r\n" + 
//				"  \"borderColor\":\"navy\"\r\n" + 
//				" }]");
//		return "/calendar/calendar";
//		
//	}
	
	@RequestMapping(value = "/calendar/calendar")
	@ResponseBody
	//@GetMapping("/calendar/calendar")
	public Map<String, Object> selectEventList(HolidayVO holidayVO, Model model) {
//		model.addAttribute("list", service.getCalendar(holidayVO));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		List<HolidayVO> calendarList = service.getCalendar(holidayVO);
		
		for (int i = 0; i < calendarList.size(); i++) {
			calendarList.get(i).setStart(calendarList.get(i).getStart2());
		}
		
		returnMap.put("calendarList", calendarList);
		
		return returnMap;
	}
	
}
