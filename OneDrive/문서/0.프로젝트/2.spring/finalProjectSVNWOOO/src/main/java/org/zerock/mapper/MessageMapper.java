package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.MessageCriteria;
import org.zerock.domain.MessageVO;
public interface MessageMapper {
	//@Select
	//("select e_id, e_did, e_name, e_pid, e_tell, e_email from tbl_Message")
	public List<MessageVO> getList();
	
	public List<MessageVO> getListWithPaging(MessageCriteria cri);
	
	public void insert(MessageVO message);

	public void insertSelectKey(MessageVO message);
	
	public List<MessageVO> mList(MessageVO list);	 //등록시 결재자 셀렉트 리스트 표출
	
	public MessageVO read(Long m_id);
	
	public int delete(MessageVO message);

	public int getTotalCount(MessageCriteria cri);
	
	public void readM(MessageVO message);


}
