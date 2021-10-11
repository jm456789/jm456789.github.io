package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.AuthVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.MgCriteria;

public interface MgMapper {
	//@Select
	//("select e_id, e_did, e_name, e_pid, e_tell, e_email from tbl_member")
	public List<MemberVO> getList();
	
	public List<MemberVO> getListWithPaging(MgCriteria cri);
	
	public void insert(MemberVO mg);
	
	public int updateAuth(List<AuthVO> auth);
//	
	public void insertAuth(List<AuthVO> auth);
	
	public void insertSelectKey(MemberVO mg);
	
	public MemberVO read(String e_id);
	
	public AuthVO readAuth(AuthVO authVO);
	
	public int deleteAuth(AuthVO auth);
	
	public int delete(String e_id);
	

	
	public int update(MemberVO mg);
	
	public int updateAuth(AuthVO auth);
	
	public int getTotalCount(MgCriteria cri);

}
