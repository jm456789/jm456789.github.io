package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.MgCriteria;

public interface MgService {

	public void register(MemberVO mg);

	public MemberVO get(String e_id);
	
	public AuthVO getAuth(AuthVO authVO);

	public boolean modify(MemberVO mg);
	
	public boolean modifyAuth(AuthVO auth);
	public boolean removeAuth(AuthVO auth);
	public boolean remove(String e_id);
	

	// public List<BoardVO> getList();

	public List<MemberVO> getList(MgCriteria cri);
	
	public int getTotal(MgCriteria cri);
	
	/*
	 * //검색 public List<MemberVO> listAll(String searchOption, String keyword)
	 * throws Exception;
	 * 
	 * public int countArticle(String searchOption, String keyword) throws
	 * Exception;
	 */

}

