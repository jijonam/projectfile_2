package com.ic.teamproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BoardDao;
import util.Common;
import util.Paging;
import vo.BoardVo;

@Controller
public class BoardController {
	final static String VIEW_PATH = "/WEB-INF/views/board/";
	
	BoardDao board_dao;

	public BoardDao getBoard_dao() {
		return board_dao;
	}

	public void setBoard_dao(BoardDao board_dao) {
		this.board_dao = board_dao;
	}

	@RequestMapping("/board/board_list.do")
	public String list(String search,
					   String search_text,
					   HttpServletRequest request,
					   Model model){
		
		int nowPage = 1;
		int start=0,end=0;
		String page = request.getParameter("page");
		if(page!=null && !page.isEmpty())
		   nowPage = Integer.parseInt(page);
		
		//가져올 범위 계산
		start = (nowPage-1)* Common.Board.BLOCK_LIST + 1;
		end   = start + Common.Board.BLOCK_LIST - 1;
		
		//범위=>Map으로 포장
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		//검색내용이 있으면
		if(search!=null && !search.isEmpty()){
			
			if(search.equals("name_subject_content")){
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
			}else if(search.equals("name")){
				map.put("name", search_text);
			}else if(search.equals("subject")){
				map.put("subject", search_text);
			}else if(search.equals("content")){
				map.put("content", search_text);
			}
		}

		//검색정보포함한 코드수
		int rowTotal = board_dao.selectRowTotal(map);
		
		String search_str = String.format("search=%s&search_text=%s", search==null ? "" : search,
																	  search_text==null ? "" : search_text);
		
		//페이지 메뉴 만들기
		String pageHtml = Paging.getPaging(
						"list.do", 
						search_str,
						nowPage, 
						rowTotal, 
						Common.Board.BLOCK_LIST, 
						Common.Board.BLOCK_PAGE
						);
		
		//목록가져오기
		List<BoardVo> list = board_dao.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageHtml", pageHtml);
		
		return VIEW_PATH + "board.jsp";
	}

	@RequestMapping("/pages/board_check_pwd.do")
	@ResponseBody
	public String check_pwd(int idx, String c_pwd){
		
		BoardVo vo = board_dao.selectOne(idx);
		
		String result = "diff";
		
		//비번 맞는지 유무 체크
		if(vo.getPwd().equals(c_pwd))
			result = "same";
		
		String resultStr = String.format("[{'result':'%s'}]", result);
		
		return resultStr;
	}

	@RequestMapping("/pages/board_insert_form.do")
	public String insert_form(){
		return VIEW_PATH + "board_write.jsp";
	}
	
	@RequestMapping("/pages/board_insert.do")
	public String insert(BoardVo vo,
						 HttpServletRequest request){
		
		String ip = request.getRemoteAddr();
		String content = vo.getContent().replaceAll("\r\n", "<br>");
		
		vo.setIp(ip);
		vo.setContent(content);
		
		int res = board_dao.insert(vo);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/pages/board_view.do")
	public String view(int idx,
					   HttpServletRequest request){
		
		BoardVo vo = board_dao.selectOne(idx);
		HttpSession session = request.getSession();
		if(session.getAttribute("show")==null){
			int res = board_dao.update_readhit(idx);
			
			session.setAttribute("show", "");
		}
		
		request.setAttribute("vo", vo);
		
		return VIEW_PATH + "board_view.jsp";
	}
	
	@RequestMapping("/pages/board_delete.do")
	public String delete(int idx,
						 HttpServletRequest request){
		
		int res = board_dao.delete(idx);
		String page = request.getParameter("page");
		
		return "redirect:list.do?page="+page;
	}
	
	@RequestMapping("/pages/board_modify_form.do")
	public String modify_form(int idx,
							  HttpServletRequest request){
		
		BoardVo vo = board_dao.selectOne(idx);
		
		request.setAttribute("vo", vo);
		
		return VIEW_PATH + "board_modify.jsp";
	}
	
	@RequestMapping("/pages/board_modify.do")
	public String modify(BoardVo vo,
						 int idx,
						 HttpServletRequest request){
		String ip = request.getRemoteAddr();
		
		vo.setIdx(idx);
		vo.setIp(ip);
		
		int res = board_dao.update(vo);
		
		String page = request.getParameter("page");
		return "redirect:list.do?page="+page;
	}
	
	@RequestMapping("/pages/board_reply_form.do")
	public String reply_form(){
		
		return VIEW_PATH + "board_reply.jsp";
	}
	
	@RequestMapping("/pages/board_reply.do")
	public String reply(int idx,
						BoardVo vo,
						HttpServletRequest request,
						Model model){
		
		String ip = request.getRemoteAddr();
		
		BoardVo baseVo = board_dao.selectOne(idx);
		
		int res = board_dao.update_step(baseVo);
		
		vo.setIp(ip);
		
		vo.setRef(baseVo.getRef());
		vo.setStep(baseVo.getStep()+1);
		vo.setDepth(baseVo.getDepth()+1);
		
		res = board_dao.reply(vo);
		
		String page = request.getParameter("page");
		
		model.addAttribute("page", page);
		
		return "redirect:list.do";
		
	}
	
}
