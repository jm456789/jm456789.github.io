package org.zerock.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {

	
	@Inject
	private MemberService service;


	

	
//	@RequestMapping(value="/modify", method=RequestMethod.GET)
//	public String registerUpdateView() throws Exception
//	{
//		return "/modify";
//	}
//	@RequestMapping(value="/modify", method=RequestMethod.POST)
//	public String registerUpdate(MemberVO member, HttpSession session) throws Exception
//	{
//		service.memberUpdate(member);
//		session.invalidate();
//		return "redirect:/member/modify";
//	}
	
	//조회랑 수정 묶어버리기~ @GetMapping이나 @PostMapping 등에는 URL을 배열로 처리할 수 있으므로, 하나의 메서드로 여러 URL 처리
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("e_id") String e_id, Model model) {
		log.info("/get or modify");
		model.addAttribute("member", service.get(e_id));
	}
		
	//수정
	@PostMapping("/modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		log.info("modify" + member);
		
		if(service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/index";  //목록(list)으로 보냄
	}



//	@PostMapping("/modify")
//	public String modify(MemberVO member, RedirectAttributes rttr)
//	{
//		log.info("modify" + member);
//		if(service.modify(member)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//
//		return "redirect:/member/modify";
//	}


	//	@PostMapping("/remove")
	//	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr)
	//	{
	//		log.info("remove..."+bno);
	//		if(service.remove(bno))
	//		{
	//			rttr.addFlashAttribute("result","success");
	//		}
	//		rttr.addAttribute("pageNum",cri.getPageNum());
	//		rttr.addAttribute("amount",cri.getAmount());
	//		
	//		return "redirect:/board/list";
	//	}

	//	@GetMapping("/register")
	//	public void register() {
	//		
	//		
	//		
	//	}
	//	

}
