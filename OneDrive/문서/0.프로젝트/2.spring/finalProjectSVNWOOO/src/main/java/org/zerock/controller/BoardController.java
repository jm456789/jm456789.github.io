package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	//목록 전체 표출
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("#################list");
//		model.addAttribute("list", service.getList());
//		
//	}
	//목록 페이징 적용
	@GetMapping("/board/list")
	public void list(Criteria cri, Model model) {
		log.info("#################list : " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));	
		//아래는 페이징. 전체 데이터 개수 추가
		int total = service.getTotal(cri);
        log.info("total: " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//등록
	@PostMapping("/board/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("#################register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());  //addFlashAttribute는 일회성으로만 데이터 전달
		return "redirect:/board/list";  //목록(list)으로 보냄
	}
	
//	//조회
//	@GetMapping("/get")
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get");
//		model.addAttribute("board", service.get(bno));
//	}
//	
//	//수정
//	@PostMapping("/modify")
//	public String modify(BoardVO board, RedirectAttributes rttr) {
//		log.info("#################modify" + board);
//		
//		if(service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";  //목록(list)으로 보냄
//	}
	
	//조회랑 수정 묶어버리기~ @GetMapping이나 @PostMapping 등에는 URL을 배열로 처리할 수 있으므로, 하나의 메서드로 여러 URL 처리
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/get or modify");
//		model.addAttribute("board", service.get(bno));
//	}
	//조회랑 수정 묶은거에 페이징 추가
	@GetMapping({"/board/get", "/board/modify"})
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model)
    {
        log.info("/get or modify");
        model.addAttribute("board", service.get(bno));
    }
		
	//수정
//	@PostMapping("/modify")
//	public String modify(BoardVO board, RedirectAttributes rttr) {
//		log.info("#################modify" + board);
//		
//		if(service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";  //목록(list)으로 보냄
//	}
//	
//	//삭제
//	@PostMapping("/remove")
//	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
//		log.info("#################remove" + bno);
//		
//		if(service.remove(bno)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/board/list";  //목록(list)으로 보냄
//	}
	
	//수정, 페이징 추가!
	@PostMapping("/board/modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("modify: " + board);
        if(service.modify(board)) {
            rttr.addFlashAttribute("result", "sucess");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/board/list";
    }
	
	//수정 test
//	@PostMapping("/board/modify")
//	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		log.info("#################register : " + board);
//		service.modify(board);
//		rttr.addFlashAttribute("result", board.getBno());  //addFlashAttribute는 일회성으로만 데이터 전달
//		rttr.addAttribute("pageNum", cri.getPageNum());
//        rttr.addAttribute("amount", cri.getAmount());
//		return "redirect:/board/list";  //목록(list)으로 보냄
//	}
    
	//삭제, 페이징 추가!
    @PostMapping("/board/remove")
    public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("remove..." + bno);
        if(service.remove(bno))
        {
            rttr.addFlashAttribute("result", "success");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/board/list";
    }
	
	//----------------------------------------------------------------------------------
	
	//등록 입력 페이지와 등록 처리. 게시물 등록 작업은 POST 방식으로 처리하지만, GET 방식으로 입력 페이지를 볼 수 있도록 메서드 추가
	@GetMapping("/board/register")
	public void register() {
		
	}//register()는 입력 페이지를 보여주는 역할만 하기 때문에 별도의 처리가 필요하지 않음.
	
}
