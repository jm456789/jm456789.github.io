package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.HolidayVO;
import org.zerock.mapper.CalendarMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements HolidayOKService 해줘야 함. 
public class CalendarServiceImpl implements CalendarService {

	//lombok 이용하여 HolidayOKMapper 객체 생성
	@Setter(onMethod_ = @Autowired)
	private CalendarMapper mapper;
	
	
	@Override
	public List<HolidayVO> getCalendar(HolidayVO holidayVO){		
		return mapper.calendarList(holidayVO);
	}
	
	
	
}
