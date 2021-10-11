package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service  //service는 비즈니스 영역 담당하는 객체 표시
@AllArgsConstructor  //모든 파라미터를 이용하는 생성자를 만듬

//implements BoardService 해줘야 함. 
public class BoardServiceImpl implements BoardService {

	//lombok 이용하여 BoardMapper 객체 생성
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	//등록
	@Override
	public void register(BoardVO board) {		
		log.info("register.........." + board);
		mapper.insertSelectKey(board);  //persistence 영역에서 쓰던걸 Business에서 씀!! persistence와 DB 먼저 연결이 1번임.
	}
	
	
	//목록(리스트) 전체 표출
//	@Override
//	public List<BoardVO> getList(){		
//		log.info("getList.............");
//		return mapper.getList();
//	}
	//목록(리스트) 페이징 적용
	@Override
	public List<BoardVO> getList(Criteria cri){		
		log.info("getList.............");
		return mapper.getListWithPaging(cri);
	}
	
	//페이징, 전체 데이터의 개수 처리
	@Override
    public int getTotal(Criteria cri) {
        log.info("get total count");
        return mapper.getTotalCount(cri);
    }
	
	
	//조회
	@Override
	public BoardVO get(Long bno) {
		log.info("get................." + bno);
		return mapper.read(bno);
	}
	
	
	//삭제, 수정
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify............." + board);
		return mapper.update(board) == 1;
	}
//	@Override
//	public void modify(BoardVO board) {		
//		log.info("register.........." + board);
//		mapper.update(board);
//	}
	
	@Override
	public boolean remove(Long bno) {
		log.info("remove..............." + bno);
		return mapper.delete(bno) == 1;
	}
	
}
