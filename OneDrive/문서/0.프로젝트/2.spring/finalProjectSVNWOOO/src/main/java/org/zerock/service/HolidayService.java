package org.zerock.service;

import java.util.List;

import org.zerock.domain.HolidayVO;
import org.zerock.domain.MemberVO;

public interface HolidayService {
	
	//용어가 영속계층에 비해 일상적인 용어.. insert대신 register, update대신 modify 등...
	
	
	//목록--------------------------------------------------------------------------------------
	public List<HolidayVO> getList(HolidayVO holidayVO);
	
	
	//등록--------------------------------------------------------------------------------------
	public void register(HolidayVO board);
	
	public List<MemberVO> sList(MemberVO list);	 //등록시 결재자 셀렉트 리스트 표출
	
	
	//조회--------------------------------------------------------------------------------------
	public HolidayVO get(Long h_id);
	
	
	//수정--------------------------------------------------------------------------------------
	public boolean modify(HolidayVO board);
	
	
	//삭제--------------------------------------------------------------------------------------
	//public boolean remove(Long h_id);
	public boolean remove(HolidayVO board);
	
	
	
	
	//public List<HolidayVO> getSelectList();  //register selectbox db정보 option 출력
	
}
