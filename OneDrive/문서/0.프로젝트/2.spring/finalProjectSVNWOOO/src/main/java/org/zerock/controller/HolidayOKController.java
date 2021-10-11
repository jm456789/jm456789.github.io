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
import org.zerock.domain.Coolsms;
import org.zerock.domain.HolidayVO;
import org.zerock.service.HolidayOKService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class HolidayOKController {

	private HolidayOKService service;
	
	//list-------------------------------------------------------------------------------------------------------------------
	//목록 전체 표출(일반)
//	@GetMapping("/holidayOK/list")
//	public void list(Model model) {
//		model.addAttribute("list", service.getList());
//	}
	//목록 전체 표출(한개의 값만 넘길 때 RequestParam 사용. 근데 잘 안씀)
//	@GetMapping("/list")
//	public void list(@RequestParam("e_id") String e_id, Model model) {
//		model.addAttribute("list", service.getList(e_id));
//	}
	//목록 전체 표출
	@RequestMapping("/holidayOK/list")
	public void list(HolidayVO holidayVO, Model model) {
		model.addAttribute("list", service.getList(holidayVO));
	}
	
	
	
	//조회-------------------------------------------------------------------------------------------------------------------
//	//조회
//	@GetMapping("/get")
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get");
//		model.addAttribute("board", service.get(bno));
//	}
	//조회
	@GetMapping("/holidayOK/get")
	public void get(HttpServletRequest request, Model model) {
		log.info("/get");
		Long hId = (long) Integer.parseInt(request.getParameter("h_id"));
		model.addAttribute("holiday", service.get(hId));
	}
	
	
	//조회 후 승인-------------------------------------------------------------------------------------------------------------------
//	@PostMapping("/holidayOK/holOK")
//	public String holOK(HolidayVO holidayVO, RedirectAttributes rttr) {		
////		Long hId = (long) Integer.parseInt(request.getParameter("h_id"));
////		String hSledding = request.getParameter("h_sledding");
//		
//		if(service.holOK(holidayVO)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		rttr.addFlashAttribute("result", holidayVO.getE_id());
//		return "redirect:/holidayOK/list?e_id="+holidayVO.getE_id();  //목록(list)으로 보냄
//	}
	
	@PostMapping("/holidayOK/holOK")
	public String holOK(HolidayVO holidayVO, RedirectAttributes rttr, HttpServletRequest request) throws UnsupportedEncodingException {		
		String encodedParam = URLEncoder.encode(holidayVO.getE_id(), "UTF-8");
		String api_key = "NCSRRBANGK3PA7JB";
	    String api_secret = "UAXC68Y79HVTNQUPS0UHS8LL0WURCMHN";
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", "01055649947"); // 수신번호 (받을 사람)

	    set.put("from", (String)request.getParameter("from")); // 발신번호 (보내는 사람)
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
		
		if(service.holOK(holidayVO)) {
			rttr.addFlashAttribute("result", "success");
		}
			
		return "redirect:/holidayOK/list?e_id="+encodedParam;  //목록(list)으로 보냄
	}
	
	
	
	
}
