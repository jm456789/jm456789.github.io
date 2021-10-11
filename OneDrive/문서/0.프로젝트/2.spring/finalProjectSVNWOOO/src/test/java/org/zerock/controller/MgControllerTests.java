package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MgControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	//목록
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/mg/mgList"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);

	}
	//등록
	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/mg/mgRegister")
				.param("e_did", "1003")
				.param("e_name", "김똑똑")
				.param("e_pid", "2006")
				.param("e_tell", "031-334-0000")
				.param("e_email", "ss@naver.com")
				.param("e_birth", "19991122")
				.param("e_cell", "010-0000-0000")
				.param("e_address", "충북")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	//조회
	@Test
	public void testGet() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/mg/mgGet")
				.param("e_id", "21008"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}

	//수정
	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("mg/mgModify")
				.param("e_pid", "1004")
				.param("e_did", "1004")
				.param("e_email", "ss@naver.com")
				.param("e_cell", "1004")
				.param("e_cell2", "1004")
				.param("e_cell3", "1004")
				.param("e_tell", "1004")
				.param("e_tell2", "1004")
				.param("e_tell3", "1004")
				.param("e_address", "김수정")
				.param("e_address2", "김수정")
				.param("e_address3", "김수정")
				.param("e_birth", "2002")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

	//삭제
	@Test
	public void testRemove() throws Exception{
		//삭제 전 데이터베이스에 게시물 번호 확인할 것
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/mg/mgRemove")
				.param("e_id", "21127")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}

}
