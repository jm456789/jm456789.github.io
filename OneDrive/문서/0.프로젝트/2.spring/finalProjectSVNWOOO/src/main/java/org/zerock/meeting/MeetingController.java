package org.zerock.meeting;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/meeting/*")
@AllArgsConstructor
public class MeetingController {
	
	@GetMapping("/meeting1")
	public void meeting1() {
		
	}
	
	@GetMapping("/meeting2")
	public void meeting2() {
		
	}
	
}
