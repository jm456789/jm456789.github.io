package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.MessageVO;
import org.zerock.domain.MgCriteria;
import org.zerock.domain.MessageCriteria;
import org.zerock.mapper.MessageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MessageServiceImpl implements MessageService {

	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;
	
	@Override
	public void register(MessageVO message) {

		log.info("register......" + message);

		mapper.insertSelectKey(message);
//		message.getMemberList().get(0).setE_id(message.getE_id());
		//mapper.insertAuth(message.getAuthList());
	}
	
	@Override
	public void regi(MessageVO message) {

		log.info("regi......" + message);

		mapper.insertSelectKey(message);
//		message.getMemberList().get(0).setE_id(message.getE_id());
		//mapper.insertAuth(message.getAuthList());
	}
	
//	@Override
//	public List<MessageVO> getList(){
//		log.info("getList......");
//		return mapper.getList();
//	}
	@Override
	public List<MessageVO> getList(MessageCriteria cri){
		log.info("getList Cri......" + cri);
		return mapper.getListWithPaging(cri);
	}
	
	//등록시 결재자 셀렉트 리스트 표출
	@Override
	public List<MessageVO> mList(MessageVO message) {	
		return mapper.mList(message);
	}
	
	
	@Override
	public MessageVO get(Long m_id) {

		log.info("get......" + m_id);

		return mapper.read(m_id);
	}
	


	@Override
	public boolean remove(MessageVO message) {
		log.info("remove......."+message);
		
		return mapper.delete(message) == 1;
	}
	@Override
	public int getTotal(MessageCriteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public void readM(MessageVO message) {
		mapper.readM(message);
	}

}
