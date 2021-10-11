package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.HolidayVO;
import org.zerock.domain.MemberVO;

public interface HolidayMapper {

	//목록--------------------------------------------------------------------------------------------------------------
	//public List<HolidayVO> getList();
	public List<HolidayVO> getList(HolidayVO holidayVO);
	
	
	//등록--------------------------------------------------------------------------------------------------------------
	public void insert(HolidayVO board);
	public void insertSelectKey(HolidayVO board);
	
	public List<MemberVO> sList(MemberVO list);	 //등록시 결재자 셀렉트 리스트 표출
	
	
	//조회--------------------------------------------------------------------------------------------------------------
	public HolidayVO read(Long h_id);
	
	
	//수정--------------------------------------------------------------------------------------------------------------
	public int update(HolidayVO board);
		
	
	//삭제--------------------------------------------------------------------------------------------------------------
	//public int delete(Long h_id);
	public int delete(HolidayVO board);
	
	
	
	//public List<HolidayVO> getSelectList();  //select 옵션 값 뿌려주는거
	
	
	
}
