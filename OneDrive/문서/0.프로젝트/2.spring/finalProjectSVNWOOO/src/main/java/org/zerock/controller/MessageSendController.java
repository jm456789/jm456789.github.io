package org.zerock.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.zerock.domain.MessageVO;
import org.zerock.domain.MessageCriteria;
import org.zerock.domain.MessagePageDTO;
import org.zerock.service.MessageSendService;
import org.zerock.service.MessageService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/messageSe/*")
@AllArgsConstructor
public class MessageSendController {

	private MessageSendService service;

	/*
	 * //목록
	 * 
	 * @GetMapping("/mgList") public void list(Model model) { log.info("list");
	 * model.addAttribute("mgList", service.getList()); }
	 */

	//목록
	@GetMapping("/messageSendList")
	public void list(MessageVO messageVO, MessageCriteria cri, Model model) {
		log.info("list: "+cri);
		model.addAttribute("messageList", service.getList(cri));		
		model.addAttribute("pageMaker", new MessagePageDTO(cri, 123));

		int total = service.getTotal(cri);
		log.info("total: "+total);
		model.addAttribute("pageMaker", new MessagePageDTO(cri, total));
		
		//model.addAttribute("messageList", service.getListT(messageVO));
	}
	@GetMapping({"/messageSendGet"})
	public void get(@RequestParam("m_id") Long m_id, @ModelAttribute("cri") MessageCriteria cri, Model model) {
		log.info("/messageSendGet");
		model.addAttribute("message", service.get(m_id));
	}

	/*
	 * @RequestMapping({"/messageSendGet"}) public void get(@RequestParam("m_id")
	 * Long m_id, @ModelAttribute("cri") MessageCriteria cri, Model model, MessageVO
	 * messageVO) { log.info("/messagesendGet"); model.addAttribute("message",
	 * service.get(m_id));
	 * 
	 * service.readM(messageVO);
	 * 
	 * }
	 */

	//등록
	@PostMapping("/send")
	public String regi(MessageVO message, RedirectAttributes rttr) throws UnsupportedEncodingException  {
		String encodedParam = URLEncoder.encode(message.getM_eid2(), "UTF-8");
		
		log.info("register: " + message);

		service.regi(message);

		rttr.addFlashAttribute("result", message.getM_id());

		return "redirect:/messageSe/messageSendList?m_eid2="+encodedParam;
	}
	@GetMapping("/send")
	public void regi() {
	}
	
	

	  @PostMapping("/messageSeRemove")
	   public String remove(MessageVO message, @ModelAttribute("cri") MessageCriteria cri, RedirectAttributes rttr) throws UnsupportedEncodingException {
	      String encodedParam = URLEncoder.encode(message.getM_eid2(), "UTF-8");
	      
	      log.info("remove..." + message);
	      if (service.remove(message)) 
	      {
	         rttr.addFlashAttribute("result", "success");
	      }
	      rttr.addAttribute("pageNum", cri.getPageNum());
	      rttr.addAttribute("amount", cri.getAmount());

	      //return "redirect:/message/messageList";
	      return "redirect:/messageSe/messageSendList?m_eid2="+encodedParam;
	   }

}
