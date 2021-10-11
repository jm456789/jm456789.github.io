package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AuthVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.MgCriteria;
import org.zerock.domain.MgPageDTO;
import org.zerock.service.MgService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mg/*")
@AllArgsConstructor
public class MgController {

   private MgService service;

   /*
    * //목록
    * 
    * @GetMapping("/mgList") public void list(Model model) { log.info("list");
    * model.addAttribute("mgList", service.getList()); }
    */
   
   //목록
   @GetMapping("/mgList")
   public void list(MgCriteria cri, Model model) {
      log.info("list: "+cri);
      model.addAttribute("mgList", service.getList(cri));
      model.addAttribute("pageMaker", new MgPageDTO(cri, 123));
      
      int total = service.getTotal(cri);
      log.info("total: "+total);
      model.addAttribute("pageMaker", new MgPageDTO(cri, total));
   }

   //등록
   @PostMapping("/mgRegister")
   public String register(MemberVO mg, RedirectAttributes rttr) {

      log.info("register: " + mg);
      service.register(mg);

      rttr.addFlashAttribute("result", mg.getE_id());
//      rttr.addFlashAttribute("result", "테스트");

      return "redirect:/mg/mgList";
   }   
   @GetMapping("/mgRegister")
   public void register() {
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   /*
    * @PostMapping("/mgMessage") public String registerM(@RequestParam("e_id")
    * String e_id, RedirectAttributes rttr) { rttr.addFlashAttribute(e_id);
    * 
    * return "redirect:/message/messageRegister?e_id=" + e_id; }
    */
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   /*
    * //조회
    * 
    * @GetMapping("/mgGet") public void get(@RequestParam("e_id")String e_id, Model
    * model) { log.info("/get"); model.addAttribute("mg", service.get(e_id)); }
    */
   //수정
   @PostMapping("/mgModify")
   public String modify(MemberVO mg,AuthVO auth, @ModelAttribute("cri") MgCriteria cri, RedirectAttributes rttr) {

      log.info("modify: "+ mg);

      if(service.modify(mg)) {
         rttr.addFlashAttribute("result", "success");
      }
      rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addAttribute("amount", cri.getAmount());
      rttr.addAttribute("type", cri.getType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
      service.modifyAuth(auth);
      
      return "redirect:/mg/mgList";
   }
   
   @GetMapping({"/mgGet", "/mgModify"})
   public void get(@RequestParam("e_id") String e_id, @ModelAttribute("cri") MgCriteria cri, Model model, AuthVO authVO) {
      log.info("/mgGet or /mgModify");
      model.addAttribute("mg", service.get(e_id));
      
      AuthVO authDataVO = service.getAuth(authVO);
      model.addAttribute("auth", authDataVO);
   }

@PostMapping("/mgRemove")
   public String remove(@RequestParam("e_id") String e_id,AuthVO auth, @ModelAttribute("cri") MgCriteria cri, RedirectAttributes rttr) {
	 service.removeAuth(auth);
      log.info("remove..." + e_id);
      if (service.remove(e_id)) {
         rttr.addFlashAttribute("result", "success");
      }
      rttr.addAttribute("pageNum", cri.getPageNum());
      rttr.addAttribute("amount", cri.getAmount());
      rttr.addAttribute("type", cri.getType());
      rttr.addAttribute("keyword", cri.getKeyword());
      
     
      
      return "redirect:/mg/mgList";
   }
/*   //검색
   @RequestMapping("list.do")
   public ModelAndView list(@RequestParam(defaultValue ="e_id") String searchOption,
         @RequestParam(defaultValue = "")String keyword) throws Exception{
      List<MemberVO>list= service.listAll(searchOption, keyword);

      //레코드 개수
      int count = service.countArticle(searchOption, keyword);
      ModelAndView mav = new ModelAndView();
      Map<String, Object> map= new HashMap<String, Object>();

      map.put("mgList", mgList);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
      map.put("count", count);
      map.put("searchOption", searchOpion);
      map.put("keyword", keyword);

      System.out.println("map : "+map);
      mav.setViewName("
/memberboard");                //자료를 넘길 뷰의 이름

      return mav;    //게시판 페이지로 이동
   }*/


}