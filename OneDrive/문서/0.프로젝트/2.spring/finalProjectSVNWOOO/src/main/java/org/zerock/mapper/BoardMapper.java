package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	public List<BoardVO> getListWithPaging(Criteria criteria);  //페이징 추가
	
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
	//public void update(BoardVO board);
	
	public int getTotalCount(Criteria cri);  //페이징때문에.. 전체 데이터의 개수 처리
}
