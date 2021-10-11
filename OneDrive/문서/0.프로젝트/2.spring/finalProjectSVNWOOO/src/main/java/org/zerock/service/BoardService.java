package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	//용어가 영속계층에 비해 일상적인 용어.. insert대신 register, update대신 modify 등...
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	//public void modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	//public List<BoardVO> getList();  //전체 리스트 표출
	public List<BoardVO> getList(Criteria cri);  //페이징 적용
	
	public int getTotal(Criteria cri);  //페이징, 전체 데이터의 개수 처리
	
}
