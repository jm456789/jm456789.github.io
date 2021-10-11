package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.HolidayVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.HolidayMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements HolidayService 해줘야 함. 
public class HolidayServiceImpl implements HolidayService {

	
	//lombok 이용하여 HolidayMapper 객체 생성----------------------------------------------------------------------------------
	@Setter(onMethod_ = @Autowired)
	private HolidayMapper mapper;
	
	
	//목록--------------------------------------------------------------------------------------------------------------
//	@Override
//	public List<HolidayVO> getList(){		
//		log.info("getList.............");
//		return mapper.getList();
//	}
	//목록 리스트 표출 할 때 값 넘기기
	@Override
	public List<HolidayVO> getList(HolidayVO holidayVO){		
		log.info("getList.............");
		return mapper.getList(holidayVO);
	}
	
	
	//등록--------------------------------------------------------------------------------------------------------------
	@Override
	public void register(HolidayVO board) {		
		log.info("register.........." + board);
		mapper.insertSelectKey(board);  //persistence 영역에서 쓰던걸 Business에서 씀!! persistence와 DB 먼저 연결이 1번임.
	}
	
	//등록시 결재자 셀렉트 리스트 표출
	@Override
	public List<MemberVO> sList(MemberVO list) {	
		return mapper.sList(list);
	}
	
	
	//조회--------------------------------------------------------------------------------------------------------------
	@Override
	public HolidayVO get(Long h_id) {
		log.info("get................." + h_id);
		return mapper.read(h_id);
	}

	
	//수정--------------------------------------------------------------------------------------------------------------
	@Override
	public boolean modify(HolidayVO board) {
		log.info("modify............." + board);
		return mapper.update(board) == 1;
	}
	
	
	//삭제--------------------------------------------------------------------------------------------------------------
//	@Override
//	public boolean remove(Long h_id) {
//		log.info("remove..............." + h_id);
//		return mapper.delete(h_id) == 1;
//	}
	@Override
	public boolean remove(HolidayVO board) {
		return mapper.delete(board) == 1;
	}
	
	
	

	

	
	
	
	//register selectbox db정보 option 출력
//	@Override
//	public List<HolidayVO> getSelectList(){		
//		log.info("getList.............");
//		return mapper.getSelectList();
//	}
	
	
	
	
	
}
