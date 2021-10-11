package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.HolidayVO;
import org.zerock.mapper.HolidayOKMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements HolidayOKService 해줘야 함. 
public class HolidayOKServiceImpl implements HolidayOKService {

	//lombok 이용하여 HolidayOKMapper 객체 생성
	@Setter(onMethod_ = @Autowired)
	private HolidayOKMapper mapper;
	
	
	//목록--------------------------------------------------------------------------------------------------------------
//	@Override
//	public List<HolidayVO> getList(){		
//		log.info("getList.............");
//		return mapper.getList();
//	}
	@Override
	public List<HolidayVO> getList(HolidayVO holidayVO){		
		log.info("getList.............");
		return mapper.getList(holidayVO);
	}
	
	
	
	//조회--------------------------------------------------------------------------------------------------------------
	@Override
	public HolidayVO get(Long h_id) {
		log.info("get................." + h_id);
		return mapper.read(h_id);
	}

	
	//조회 후 승인--------------------------------------------------------------------------------------------------------------
	@Override
	public boolean holOK(HolidayVO holidayVO) {
		return mapper.updateOK(holidayVO) == 1;
	}
	
	
	
	
	
}
