package com.ic.teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyclassController {
	
	@RequestMapping("/pages/myclass_cart_list.do")
	public String myclass_cart_list(){
		
		return "/WEB-INF/views/pages/myclass_cart.jsp";
	}
	
	@RequestMapping("/pages/myclass.do")
	public String myclass(){
		
		return "/WEB-INF/views/pages/myclass.jsp";
	}
	
	@RequestMapping("/pages/myclass_lecture.do")
	public String myclass_lecture(){
		
		return "/WEB-INF/views/pages/myclass_lecture.jsp";
	}

}
