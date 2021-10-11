package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.HolidayVO;

@Service
public interface CalendarService {
	
	//용어가 영속계층에 비해 일상적인 용어.. insert대신 register, update대신 modify 등...
	
	public List<HolidayVO> getCalendar(HolidayVO holidayVO);
	
	
}
