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
import org.zerock.domain.MgCriteria;
import org.zerock.domain.HolidayVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.MessageCriteria;
import org.zerock.domain.MessagePageDTO;
import org.zerock.service.MessageService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/message/*")
@AllArgsConstructor
public class MessageController {

   private MessageService service;

   /*
    * //목록
    * 
    * @GetMapping("/mgList") public void list(Model model) { log.info("list");
    * model.addAttribute("mgList", service.getList()); }
    */

   //목록
   @GetMapping("/messageList")
   public void list(MessageCriteria cri, Model model) {
      log.info("list: "+cri);
      model.addAttribute("messageList", service.getList(cri));
      model.addAttribute("pageMaker", new MessagePageDTO(cri, 123));

      int total = service.getTotal(cri);
      log.info("total: "+total);
      model.addAttribute("pageMaker", new MessagePageDTO(cri, total));
   }
//   
//   @PostMapping("/messageGet")
//   public String getRead(MessageVO messageVO) {
//      service.readM(messageVO);
//      return "redirect:/message/messageGet";
//   }


   @RequestMapping({"/messageGet"})
   public void get(@RequestParam("m_id") Long m_id, @ModelAttribute("cri") MessageCriteria cri, Model model, MessageVO messageVO) {
      log.info("/messageGet");
      model.addAttribute("message", service.get(m_id));

      service.readM(messageVO);

   }

	/*
	 * //등록 - 보기
	 * 
	 * @GetMapping("/messageRegister") public void selectList(MessageVO message,
	 * Model model){ model.addAttribute("mList", service.mList(message)); //등록시 결재자
	 * 셀렉트 리스트 표출 }
	 */
    
   
   //등록
   @PostMapping("/messageRegister")
   public String register(MessageVO message, RedirectAttributes rttr) throws UnsupportedEncodingException  {
      String encodedParam = URLEncoder.encode(message.getM_eid2(), "UTF-8");
      
      log.info("register: " + message);

      service.register(message);

      rttr.addFlashAttribute("result", message.getM_id());

      return "redirect:/messageSe/messageSendList?m_eid2="+encodedParam;
   }
   @GetMapping("/messageRegister")
   public void register() {
   }
   

   //등록
      @PostMapping("/send")
      public String regi(MessageVO message, RedirectAttributes rttr) throws UnsupportedEncodingException  {
         String encodedParam = URLEncoder.encode(message.getM_eid1(), "UTF-8");
         
         log.info("register: " + message);

         service.regi(message);

         rttr.addFlashAttribute("result", message.getM_id());

         return "redirect:/messageSe/messageSendList?m_eid1="+encodedParam;
      }
      @GetMapping("/send")
      public void regi() {
      }
      
   


      @PostMapping("/messageRemove")
      public String remove(MessageVO message, @ModelAttribute("cri") MessageCriteria cri, RedirectAttributes rttr) throws UnsupportedEncodingException {
         String encodedParam = URLEncoder.encode(message.getM_eid1(), "UTF-8");
         
         log.info("remove..." + message);
         if (service.remove(message)) 
         {
            rttr.addFlashAttribute("result", "success");
         }
         rttr.addAttribute("pageNum", cri.getPageNum());
         rttr.addAttribute("amount", cri.getAmount());


	      //return "redirect:/message/messageList";
	      return "redirect:/message/messageList?m_eid1="+encodedParam;
	   }
}