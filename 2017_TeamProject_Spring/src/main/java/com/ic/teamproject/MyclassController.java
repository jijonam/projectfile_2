package com.ic.teamproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/pages/myclass_check_cart.do")
	@ResponseBody
	public String check_cart(int l_idx){
		// TODO Auto-generated method stub
		
		session = request.getSession();

		//session login된 user정보를 binding
		MemberVo vo2 = (MemberVo)session.getAttribute("user");
		/*if(vo2==null){

					//forward 
					String forward_page = "/member/login_form.do";
					request.getRequestDispatcher(forward_page).forward(request, response);

				}*/

		Map map = new HashMap();
		if(vo2 != null){
			map.put("l_idx", l_idx);
			map.put("m_idx", vo2.getIdx());
		}	

		LectureCartVo vo = lecture_cart_dao.selectOne(map);

		String resultStr="";
		String result = "exist";
		if(vo==null){ //해당상품이 장바구니에 없으면
			result = "not_exist";
		}else{

		}
		resultStr = String.format("[{'result':'%s'}]", result);

		//응답
		//response.getWriter().print(resultStr);
		return resultStr;
	}
	
	@RequestMapping("/pages/myclass_cart_insert.do")
	public String cart_insert(int l_idx){
		
		session = request.getSession();
		
		MemberVo vo = (MemberVo) session.getAttribute("user");

		Map map = new HashMap();
		if(vo != null){
			map.put("l_idx", l_idx);
			map.put("m_idx", vo.getIdx());
		}
		//DB cart insert 
		int res = lecture_cart_dao.insert(map);

	
		return "redirect:lecture_list.do";
	}
	
	@RequestMapping("/pages/myclass_cart_delete.do")
	public String cart_delete(int l_idx){
				
		session = request.getSession();

		
		MemberVo vo = (MemberVo) session.getAttribute("user");

		Map map = new HashMap();
		if(vo != null){
			map.put("l_idx", l_idx);
			map.put("m_idx", vo.getIdx());
		}		

		//4. DB insert
		int res = lecture_cart_dao.delete(map);

				
		return "redirect:myclass_cart_list.do";
	}

}
