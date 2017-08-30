package com.ic.teamproject;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.LectureCartDao;
import vo.LectureCartVo;
import vo.MemberVo;

@Controller
public class MyclassController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	
	LectureCartDao lecture_cart_dao;	
	
	public LectureCartDao getLecture_cart_dao() {
		return lecture_cart_dao;
	}

	public void setLecture_cart_dao(LectureCartDao lecture_cart_dao) {
		this.lecture_cart_dao = lecture_cart_dao;
	}

	@RequestMapping("/pages/myclass_cart_list.do")
	public String myclass_cart_list(Model model){
		
		session = request.getSession();
		
		//session login된 user정보를 binding
		MemberVo vo = (MemberVo) session.getAttribute("user");
		
		if(vo==null){			
			
			return "/WEB-INF/views/pages/login_form.jsp";

		}
		List<LectureCartVo> list = lecture_cart_dao.selectList(vo.getIdx());
		
		//3.request binding
		model.addAttribute("list", list);			
		
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
