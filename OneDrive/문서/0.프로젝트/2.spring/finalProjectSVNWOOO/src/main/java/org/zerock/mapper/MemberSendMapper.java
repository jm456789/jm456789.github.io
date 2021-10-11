package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberSendMapper {
	

		//@Select("select * from tbl_board where bno > 0")
//		public List<MemberVO> getList();
		
//		public void insert(MemberVO member);
//		public void insertSelectKey(MemberVO member);
//		
		public MemberVO read(String e_id);
		
		public MemberVO get(String e_name);
//		
		public int delete(Long m_id);
	
		public int memberUpdate(MemberVO member);
		
	}
	
	
