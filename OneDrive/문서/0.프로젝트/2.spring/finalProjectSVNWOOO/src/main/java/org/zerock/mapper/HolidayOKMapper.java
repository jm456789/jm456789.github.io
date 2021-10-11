package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.HolidayVO;

public interface HolidayOKMapper {

	//목록--------------------------------------------------------------------------------------------------------------
	public List<HolidayVO> getList(HolidayVO holidayVO);
	
	
	//조회--------------------------------------------------------------------------------------------------------------
	public HolidayVO read(Long h_id);
	
	
	//조회 후 승인--------------------------------------------------------------------------------------------------------------
	public int updateOK(HolidayVO holidayVO);
	
}
