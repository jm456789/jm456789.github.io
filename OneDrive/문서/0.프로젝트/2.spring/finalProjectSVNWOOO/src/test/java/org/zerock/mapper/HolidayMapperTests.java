package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.HolidayVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HolidayMapperTests {

	@Setter(onMethod_ = @Autowired)
	private HolidayMapper mapper;
	
	//list
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
//	//paging
//		@Test
//		public void testPaging() {
//			Criteria cri = new Criteria();
//			
//			//10개씩 3페이지
//			cri.setPageNum(3);
//			cri.setAmount(10);
//			
//			List<BoardVO> list = mapper.getListWithPaging(cri);
//			list.forEach(board -> log.info(board));
//		}
	
	//insert
//	@Test
//	public void testInsert() {
//		HolidayVO board = new HolidayVO();
//		board.setH_start(TO_DATE(#{h_start}, 'yyyy/mm/dd'));
//		board.setH_end("");
//		board.setH_reason("");
//		board.setH_eid1("");
//		board.setH_sledding("");
//		board.setH_eid2("");
//		board.setH_did("");
//		board.setH_division("");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
	
//	//insert bno 값 처리?
//	@Test
//	public void testInsertSelectKey() {
//		HolidayVO board = new HolidayVO();
//		board.setH_start("yyyy-mm-dd");
//		board.setH_end("");
//		board.setH_reason("");
//		board.setH_eid1("");
//		board.setH_sledding("");
//		board.setH_eid2("");
//		board.setH_did("");
//		board.setH_division("");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//	}
	
	//read
	@Test
	public void testRead() {
		
		//존재하는 게시물 번호로 테스트
		HolidayVO board = mapper.read(5L);
		
		log.info(board);
	}
//	
//	//delete
//	@Test
//	public void testDelete() {
//				
//		log.info("DELETE COUNT : " + mapper.delete(3L));
//	}
//	
//	//update
//	@Test
//	public void testUpdate() {
//		BoardVO board = new BoardVO();
//		//실행 전 존재하는 번호인지 확인할 것
//		board.setBno(5L);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된 내용");
//		board.setWriter("user00");
//		
//		int count = mapper.update(board);
//		
//		log.info("UPDATE COUNT : " + count);
//	}
//	
	
}
