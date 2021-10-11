package org.zerock.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Coolsms;
import org.zerock.domain.Criteria;
import org.zerock.domain.HolidayVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.HolidayService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class HolidayController {

	private HolidayService service;
	
	//list-------------------------------------------------------------------------------------------------------------------
	//목록 전체 표출(일반)
//	@GetMapping("/list")
//	public void list(Model model) {
//		model.addAttribute("list", service.getList());
//		
//	}
	//목록 전체 표출(한개의 값만 넘길 때 RequestParam 사용. 근데 잘 안씀)
//	@GetMapping("/list")
//	public void list(@RequestParam("e_id") String e_id, Model model) {
//		model.addAttribute("list", service.getList(e_id));
//	}
	//목록 전체 표출
	@RequestMapping("/holiday/list")
	public void list(HolidayVO holidayVO, Model model, RedirectAttributes rttr) {
		model.addAttribute("list", service.getList(holidayVO));
	}
		
	
	//view-------------------------------------------------------------------------------------------------------------------
	//등록 - 보기
//	@GetMapping("/holiday/register")
//	public void register(HolidayVO holidayVO, Model model, RedirectAttributes rttr) {
//		model.addAttribute("list", service.getListSelect(holidayVO));
//		
//	}//register()는 입력 페이지를 보여주는 역할만 하기 때문에 별도의 처리가 필요하지 않음.
	//등록 - 보기
	@GetMapping("/holiday/register")
	public void selectList(MemberVO list, Model model){		
		model.addAttribute("sList", service.sList(list));	 //등록시 결재자 셀렉트 리스트 표출
	}
		
	//등록 - 등록하기
	@PostMapping("/holiday/register")
	public String register(HolidayVO board, RedirectAttributes rttr, HttpServletRequest request) throws UnsupportedEncodingException {
		String encodedParam = URLEncoder.encode(board.getH_eid2(), "UTF-8");
		
		String api_key = "NCSRRBANGK3PA7JB";
	    String api_secret = "UAXC68Y79HVTNQUPS0UHS8LL0WURCMHN";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", "01055649947"); // 수신번호

	    set.put("from", (String)request.getParameter("from")); // 발신번호
	    set.put("text", (String)request.getParameter("text")); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }
		
		log.info("#################register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getH_id());  //addFlashAttribute는 일회성으로만 데이터 전달
		rttr.addFlashAttribute("result", board.getE_id());		
		
		return "redirect:/holiday/list?e_id="+encodedParam;  //목록(list)으로 보냄
	}
	
	
	
	
	//register, modify-------------------------------------------------------------------------------------------------------------------
//	//조회
//	@GetMapping("/holidayOK/get")
//	public void get(HttpServletRequest request, Model model) {
//		log.info("/get");
//		Long hId = (long) Integer.parseInt(request.getParameter("h_id"));
//		model.addAttribute("holiday", service.get(hId));
//	}
	//조회랑 수정 묶어버리기~ @GetMapping이나 @PostMapping 등에는 URL을 배열로 처리할 수 있으므로, 하나의 메서드로 여러 URL 처리
	@GetMapping({"/holiday/get", "/holiday/modify"})
	public void get(@RequestParam("h_id") Long h_id, MemberVO list, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(h_id));
		
		model.addAttribute("sList", service.sList(list));	 //등록시 결재자 셀렉트 리스트 표출
	}
	

	//modify-------------------------------------------------------------------------------------------------------------------
	//수정
	@PostMapping("/holiday/modify")
	public String modify(HolidayVO board, RedirectAttributes rttr) throws UnsupportedEncodingException {
		String encodedParam = URLEncoder.encode(board.getH_eid2(), "UTF-8");
				
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/holiday/list?e_id="+encodedParam;  //목록(list)으로 보냄
	}
	
	
	//remove-------------------------------------------------------------------------------------------------------------------
	//삭제
//	@PostMapping("/holiday/remove")
//	public String remove(@RequestParam("h_id") Long h_id, RedirectAttributes rttr) {
//		log.info("#################remove" + h_id);
//		
//		if(service.remove(h_id)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/holiday/list?e_id="+board.getH_eid2();  //목록(list)으로 보냄
//	}
	@PostMapping("/holiday/remove")
	public String remove(HolidayVO board, RedirectAttributes rttr) throws UnsupportedEncodingException {
		String encodedParam = URLEncoder.encode(board.getH_eid2(), "UTF-8");
		
		if(service.remove(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		//rttr.addFlashAttribute("result", board.getE_id());
		return "redirect:/holiday/list?e_id="+encodedParam;  //목록(list)으로 보냄
	}
	
	
	
	
	
	
	
	
}
