package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	//커스텀 로그인
	@GetMapping("/customLogin")
	public void logininput(String error, String logout, Model model) {
		log.info("error: "+ error);
		log.info("logout: "+ logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인 실패. 아이디 및 비밀번호를 확인해주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
		
	}
	//로그아웃

	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}
	
	@GetMapping("/index")
	public void indexGET() {

		log.info("index");
	}
	@GetMapping("/NewFile")
	public void NewfileGet() {

		log.info("NewFile");
	}

	
}
