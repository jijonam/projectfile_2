package com.ic.teamproject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDao;
import vo.MemberVo;

@Controller
public class MemberController {

	final static String VIEW_PATH = "/WEB-INF/views/pages/";

	MemberDao member_dao;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	public MemberDao getMember_dao() {
		return member_dao;
	}

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}

	@RequestMapping("/pages/login_form.do")
	public String login_form(){

		return VIEW_PATH + "login.jsp";
	}

	@RequestMapping("/pages/join_form.do")
	public String join_form(){

		return VIEW_PATH + "join_form.jsp";
	}

	@RequestMapping("/pages/check_email.do")
	@ResponseBody
	public String checkid(String email){

		MemberVo vo = member_dao.selectOne(email);
		
		String result="not_use";
		if(vo==null){
			result = "use";		
		}

		//결과를 JSON으로 포장
		String resultStr = String.format("[{'result':'%s'}]", result);

		return resultStr;
	}
	
	@RequestMapping("/pages/member_insert.do")
	public String join(MemberVo vo){
		
		String ip = request.getRemoteAddr();
		String rating = "basic";
		
		vo.setIp(ip);
		vo.setRating(rating);
		
		int res = member_dao.insert(vo);
		
		return "redirect:login_form.do";
	}
	
	@RequestMapping("/pages/login.do")
	public String login(String email, String password){
		
		MemberVo user = member_dao.selectOne(email);
		
		//아이디가 없는경우
		if(user == null){
			return "redirect:login_form.do?reason=id_fail";
		}
		
		System.out.println(password);
		
		//비밀번호가 틀린경우
		if(!user.getPwd().equals(password)){
			return "redirect:login_form.do?reason=pwd_fail";
		}
		
		session = request.getSession();
		
		session.setAttribute("user", user);
		
		return "redirect:home.do";
	}

}
