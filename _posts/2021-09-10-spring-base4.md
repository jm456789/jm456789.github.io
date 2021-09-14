---
layout: post  

title: "Spring 스프링 MVC 프로젝트의 기본 구성 / 5. 페이징 처리" 
excerpt: ""

categories:
  - Spring
tags:
  - [Spring]
  
toc: true
toc_sticky: true
 
date: 2021-09-10
last_modified_at: 2021-09-10
---

---

# 페이징 처리 persistence 계층(영속계층) 먼저

### Criteria.java

> src/main/java - org.zerock.domain에 클래스 만들기

```java
package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10);		
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}

```

### BoardMapper 인터페이스

영속계층(persistence)먼저 연결 해주는것임

> org.zerock.mapper에 있음

```java
	public List<BoardVO> getListWithPaging(Criteria criteria);  //페이징 추가
}

```

### BoardMapper.xml

> 프로젝트 - src/main/resources - org - zerock - mapper - 안에 있음

```jsp
<!-- 테이블 조회 페이징 -->
<select id="getListWithPaging" resultType="org.zerock.domain.BoardVO">
	<![CDATA[  
		select
			bno, title, content, writer, regdate, updatedate
		from(
			select /*+ INDEX_DESC(tbl_board pk_board) */
				rownum rn, bno, title, content, writer, regdate, updatedate
			from tbl_board
			where rownum <= #{pageNum} * #{amount}
		)where rn > (#{pageNum} - 1) * #{amount}
	]]>
</select> <!-- CDATA는 XML에서 부등호를 사용하기 위해 사용 -->
<!-- //테이블 조회 페이징 -->
```

### BoardMapperTests.java

잘 연결됐나 테스트해보기!

> 프로젝트 - src/test/java - org.zerock.mapper 에 있음

```java
	//paging
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		//10개씩 3페이지
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
```

---

# 페이징 처리 business 계층 (service)

### BoardService 인터페이스

> src/main/java - org.zerock.service에 있음

```java
	//public List<BoardVO> getList();  //전체 리스트 표출
	public List<BoardVO> getList(Criteria cri);  //페이징 적용
```

### BoardServiceImpl.java

> src/main/java - org.zerock.service에 있음

```java
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
```

### BoardServiceTests.java

> src/test/java - org.zerock.service에 있음

```java
	@Test
	public void testGetList() {
		//service.getList().forEach(board -> log.info(board));  리스트 전체 표출
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));  //리스트 표출 페이징 적용
	}
```

---

# 페이징 처리 presentation 계층

### BoardController.java

> src/main/java - org.zerock.controller에 있음

```java
	//목록 전체 표출
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("#################list");
//		model.addAttribute("list", service.getList());
//		
//	}
	//목록 페이징 적용
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("#################list : " + cri);
		model.addAttribute("list", service.getList(cri));
		
	}
```

### BoardControllerTests.java

> src/test/java - org.zerock.controller에 있음

```java
	//목록 페이징 처리
	@Test
	public void testListPaging() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}
```

---

### PageDTO.java

> src/main/java - org.zerock.domain에 생성

```java
package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}

```

### BoardController.java

> src/main/java - org.zerock.controller에 있음

```java
	//목록
//	@Test
//	public void testList() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap()
//				);
//	}

	//목록 페이징 적용
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("#################list : " + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));		
	}
```

### list.jsp

list.jsp에 페이징 구조 추가

```jsp
</table>
                            
		<div class='pull-right'>
			<ul class="pagination">
	
				<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a href="#">Previous</a>
				</li>
				</c:if>
	
				<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button"><a href="#">${num}</a></li>
				</c:forEach>
	
				<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a href="#">Next</a></li>
				</c:if>              
				
			</ul>
		</div>
		<!--  end Pagination -->
```
