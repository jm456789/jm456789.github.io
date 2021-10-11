package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MypageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements BoardService 해줘야 함. 
public class MemberServiceImpl implements MemberService {
	
	//@Inject MemberDAO dao;

//	//lombok 이용하여 BoardMapper 객체 생성
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;
//	
//	

	//조회
	@Override
	public MemberVO get(String e_id) {
		log.info("get................." + e_id);
		return mapper.read(e_id);
	}
	//채팅 사용자
	@Override
	public MemberVO get2(String e_name) {
		log.info("get................." + e_name);
		return mapper.get(e_name);
	}
	
	
	//삭제, 수정
	@Override
	public boolean modify(MemberVO member) {
		log.info("modify............." + member);
		return mapper.memberUpdate(member) == 1;
	}

	
}
