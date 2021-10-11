package org.zerock.service;

import java.util.List;

import org.zerock.domain.HolidayVO;

public interface HolidayOKService {
	
	//용어가 영속계층에 비해 일상적인 용어.. insert대신 register, update대신 modify 등...
	
	
	//목록--------------------------------------------------------------------------------------
	public List<HolidayVO> getList(HolidayVO holidayVO);  //전체 리스트 표출	
	
	
	//조회--------------------------------------------------------------------------------------
	public HolidayVO get(Long h_id);	
	
	
	//조회 후 승인--------------------------------------------------------------------------------------
	public boolean holOK(HolidayVO holidayVO);
	
}
