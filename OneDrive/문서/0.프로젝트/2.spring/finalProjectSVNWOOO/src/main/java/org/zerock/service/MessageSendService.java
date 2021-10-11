package org.zerock.service;

import java.util.List;


import org.zerock.domain.MessageCriteria;
import org.zerock.domain.MessageVO;


public interface MessageSendService {

	public MessageVO get(Long m_id);

	public boolean remove(MessageVO message);
	
	public List<MessageVO> getList(MessageCriteria cri);
	
	public int getTotal(MessageCriteria cri);
	
	/*
	 * //검색 public List<MemberVO> listAll(String searchOption, String keyword)
	 * throws Exception;
	 * 
	 * public int countArticle(String searchOption, String keyword) throws
	 * Exception;
	 */

	public void register(MessageVO message);
	
	public void regi(MessageVO message);

}

