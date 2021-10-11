package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.zerock.service.HolidayService;
import org.zerock.service.RemoteService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class RemoteController {

	
	private RemoteService service;
	
	@GetMapping("/remote")
	public void get(@RequestParam("e_id") String e_id, Model model) {
		log.info("/remote");
		model.addAttribute("remote", service.get(e_id));
	}
		
//	@RequestMapping(value = "/remote", method = RequestMethod.GET)
//	public String home(Model model) {	
//		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
//		String ip = req.getHeader("X-FORWARDED-FOR");
//		if (ip == null)
//			ip = req.getRemoteAddr();
//
//		model.addAttribute("clientIP", ip);
//		return "/index";
//	}
}
