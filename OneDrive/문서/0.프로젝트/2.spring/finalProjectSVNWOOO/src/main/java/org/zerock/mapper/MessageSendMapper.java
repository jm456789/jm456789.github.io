package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.MessageCriteria;
import org.zerock.domain.MessageVO;
public interface MessageSendMapper {
	//@Select
	//("select e_id, e_did, e_name, e_pid, e_tell, e_email from tbl_Message")
	public List<MessageVO> getList();
	
	public List<MessageVO> getListWithPaging(MessageCriteria cri);
	//public List<MessageVO> getListT(MessageVO messageVO);
	
	
	public MessageVO read(Long m_id);
	
	public int getTotalCount(MessageCriteria cri);

	public int delete(MessageVO message);

	public void insertSelectKey(MessageVO message);
	
	public void insert(MessageVO message);
}

