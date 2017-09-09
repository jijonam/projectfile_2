package com.ic.teamproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.SignupDao;
import vo.SignupVo;

@Controller
public class SignupController {
	
	SignupDao signup_dao;
	
	public SignupDao getSignup_dao() {
		return signup_dao;
	}

	public void setSignup_dao(SignupDao signup_dao) {
		this.signup_dao = signup_dao;
	}

	@RequestMapping("/pages/home.do")
	public String home(){
		
		return "/WEB-INF/views/pages/index.jsp";
	}
	
	@RequestMapping("/pages/toeic.do")
	public String toeic(){
		
		return "/WEB-INF/views/pages/toeic.jsp";
	}

	@RequestMapping("/pages/signup_page.do")
	public String signup_form(){
		
		return "/WEB-INF/views/pages/signup.jsp";
	}
	
	@RequestMapping("/pages/lecture_list.do")
	public String lecture_list(String [] level, String [] tc, String [] book, Model model){
		
		Map map = new HashMap();
		
		List<SignupVo> list = null;
		
		
		if(level==null && tc==null && book==null){
			list = signup_dao.selectList(); 
			
		}else{
			if(level!=null){
				
				map.put("level", level);		
				//System.out.println(map.get("level"));
				
			}
			if(tc!=null){
					
				map.put("tc",tc);	
			}
			if(book!=null){
					
				map.put("book", book);	
			}
			list = signup_dao.selectList(map);
			
		}
		
		//System.out.println(list.get(0).getLecture_level());
		model.addAttribute("list", list);
		
		return "/WEB-INF/views/pages/signup.jsp";
	}
}









