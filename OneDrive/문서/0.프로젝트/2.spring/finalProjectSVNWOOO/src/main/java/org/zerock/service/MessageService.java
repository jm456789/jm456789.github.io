package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.MessageCriteria;
import org.zerock.domain.MessageVO;


public interface MessageService {

	public void register(MessageVO message);
	
	public void regi(MessageVO message);
	
	public List<MessageVO> mList(MessageVO message);	 //등록시 결재자 셀렉트 리스트 표출

	public MessageVO get(Long m_id);

	public boolean remove(MessageVO message);

	public List<MessageVO> getList(MessageCriteria cri);
	
	public int getTotal(MessageCriteria cri);

	public void readM(MessageVO message);
	
	/*
	 * //검색 public List<MemberVO> listAll(String searchOption, String keyword)
	 * throws Exception;
	 * 
	 * public int countArticle(String searchOption, String keyword) throws
	 * Exception;
	 */

}

