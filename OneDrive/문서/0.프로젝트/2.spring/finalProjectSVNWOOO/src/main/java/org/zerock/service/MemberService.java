package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {

//	public void register(MemberVO member) throws Exception;
//	
//	public MemberVO login(MemberVO member) throws Exception;
	
//	public MemberVO register(MemberVO member) throws Exception;
	
	//public void memberUpdate(MemberVO member) throws Exception;
	
//	public boolean remove(String e_id);
//	
//	public List<MemberVO> getList();
	public MemberVO get2(String e_name);
	
	public MemberVO get(String e_id);
	public boolean modify(MemberVO member);
}
