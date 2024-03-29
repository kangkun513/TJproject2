package com.tjoeun.main;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tjoeun.main.dao.CommentDAO;
import com.tjoeun.main.dao.MybatisDAO;
import com.tjoeun.main.vo.MainCommentList;
import com.tjoeun.main.vo.MainCommentVO;
import com.tjoeun.main.vo.MainList;
import com.tjoeun.main.vo.MainVO;
import com.tjoeun.main.vo.MemberVO;
import com.tjoeun.main.vo.Param;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("home 실행");
		return "redirect:list";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		logger.info("HomeController의 list() 실행");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int pageSize = 10;
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {	currentPage = 1; }
		// int loginCheck = Integer.parseInt(request.getParameter("loginCheck"));
		int totalCount = mapper.selectCount();
		
		MainList mainList = ctx.getBean("mainList", MainList.class);
		mainList.initMainList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", mainList.getStartNo());
		hmap.put("endNo", mainList.getEndNo());
		mainList.setList(mapper.selectList(hmap));
		model.addAttribute("mainList", mainList);
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		return "main";
	}
	
	@RequestMapping("/increment")
	public String increment(HttpServletRequest request, Model model) {
		logger.info("HomeController의 increment() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		mapper.increment(idx);
		model.addAttribute("idx", idx);
		model.addAttribute("currentPage", currentPage);
		
		return "redirect:contentView";
	}
	
	@RequestMapping("/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		logger.info("HomeController의 contentView() 실행");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);

		int idx = Integer.parseInt(request.getParameter("idx"));
		
		// 소설 내용 글
		MainVO mainVO = mapper.selectByIdx(idx);
		model.addAttribute("vo", mainVO);
		model.addAttribute("idx", idx);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		mainVO.setContent(mainVO.getContent().replace("<", "&lt;"));
		mainVO.setContent(mainVO.getContent().replace(">", "&gt;"));
		mainVO.setContent(mainVO.getContent().replace("\r\n", "<br/>"));
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		// 댓글 목록
		MainCommentList commentList = ctx.getBean("commentList", MainCommentList.class);
		CommentDAO mapper2 = sqlSession.getMapper(CommentDAO.class);
		commentList.setList(mapper2.selectList(idx));
		model.addAttribute("commentList", commentList);
		
		return "read";
	}
	
	@RequestMapping("/commentInsert")
	public String commentInsert(HttpServletRequest request, Model model, MainCommentVO commentVO) {
		CommentDAO mapper = sqlSession.getMapper(CommentDAO.class);
		commentVO.setContent(commentVO.getContent().replace("<", "&lt;"));
		commentVO.setContent(commentVO.getContent().replace(">", "&gt;"));
		commentVO.setContent(commentVO.getContent().replace("\r\n", "<br/>"));
		mapper.insert(commentVO);
		
		model.addAttribute("idx", Integer.parseInt(request.getParameter("idx")));
		model.addAttribute("currentPage", Integer.parseInt(request.getParameter("currentPage")));
		return "redirect:contentView";
	}
	
	@RequestMapping("/commentUpdate")
	public String commentReply(HttpServletRequest request, Model model, MainCommentVO commentVO) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		CommentDAO mapper = sqlSession.getMapper(CommentDAO.class);
		
		if(commentVO.getContent() == null || commentVO.getContent().trim().equals("")) {
			System.out.println("댓글이 비어서 수정 실패");
		} else {
			MainCommentVO origincom = ctx.getBean("origincom", MainCommentVO.class);
			origincom = mapper.selectByIdx(commentVO.getIdx());
			commentVO.setContent(commentVO.getContent().replace("<", "&lt;"));
			commentVO.setContent(commentVO.getContent().replace(">", "&gt;"));
			commentVO.setContent(commentVO.getContent().replace("\r\n", "<br/>"));
			origincom.setContent(commentVO.getContent());
			
		 	mapper.update(origincom);
		}
		
		model.addAttribute("idx", commentVO.getGup());
		model.addAttribute("currentPage", Integer.parseInt(request.getParameter("currentPage")));
		return "redirect:contentView";
	}
	
	@RequestMapping("/commentDelete")
	public String commentDelete(HttpServletRequest request, Model model) {
		CommentDAO mapper = sqlSession.getMapper(CommentDAO.class);
		int comidx = Integer.parseInt(request.getParameter("comidx"));
		
		mapper.delete(comidx);
		
		model.addAttribute("idx", Integer.parseInt(request.getParameter("idx")));
		model.addAttribute("currentPage", Integer.parseInt(request.getParameter("currentPage")));
		return "redirect:contentView";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model,
			HttpSession session) {
		logger.info("HomeController의 write() 실행");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int currentPage;
		try { currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { currentPage = 1; }
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		model.addAttribute("currentPage", currentPage);
		
		return "write";
	}
	
	@RequestMapping("/writeOK")
	public String writeOK(HttpServletRequest request, Model model, MainVO mainVO,
			HttpSession session) {
		logger.info("Homecontroller의 writeOK() 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String id = (String) session.getAttribute("loginInfoID");
		mainVO.setId(id);
		int currentPage = 1;
		model.addAttribute("currentPage", currentPage);
		if (category.equals("카테고리 입력")) {
			return "redirect:write";
		} else if (subject == null || subject.trim().equals("")) {
			return "redirect:write";
		} else if (content == null || content.trim().equals("")) {
			return "redirect:write";
		} else {
			mapper.insert(mainVO);
			return "redirect:list";
		}
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		logger.info("HomeController의 login() 실행");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int idx;
		int currentPage;
		try { idx = Integer.parseInt(request.getParameter("idx")); } 
		catch (NumberFormatException e) { idx = 1; }
		try { currentPage = Integer.parseInt(request.getParameter("currentPage")); } 
		catch (NumberFormatException e) { currentPage = 1; }
		
		int backPage = Integer.parseInt(request.getParameter("backPage"));
//		MainList selectHit = MainService.getInstance().selectHit();
//		MainList selectGood = MainService.getInstance().selectGood();
//		MainList selectNew = MainService.getInstance().selectNew();
		
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		model.addAttribute("idx", idx);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("backPage", backPage);
		
		return "login";
	}
	
	@RequestMapping("/loginOK")
	public String login(HttpServletRequest request, Model model, MemberVO memberVO,
			HttpSession session) {
		logger.info("HomeController의 login() 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int backPage = Integer.parseInt(request.getParameter("backPage"));
		int idx;
		if (backPage == 3) {
			try {
				idx = Integer.parseInt(request.getParameter("idx"));
			} catch (NumberFormatException e) {
				idx = 1;
			}
			model.addAttribute("idx", idx);
		}
		
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		int loginCheck = mapper.login(memberVO);
//		MainList selectHit = MainService.getInstance().selectHit();
//		MainList selectGood = MainService.getInstance().selectGood();
//		MainList selectNew = MainService.getInstance().selectNew();
		
		
		model.addAttribute("currentPage", currentPage);
		session.setAttribute("loginCheck", loginCheck);
		session.setAttribute("loginInfoID", memberVO.getId());
		
		switch (backPage) {
			case 1: return "redirect:list";
			case 2: return "redirect:write";
			case 3: return "redirect:contentView";
			default: return "redirect:list";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model,
			HttpSession session) {

		int backPage = Integer.parseInt(request.getParameter("backPage"));
		int idx;
		if (backPage == 3) {
			try {
				idx = Integer.parseInt(request.getParameter("idx"));
			} catch (NumberFormatException e) {
				idx = 1;
			}
			model.addAttribute("idx", idx);
		}
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		
		model.addAttribute("currentPage", currentPage);
		session.removeAttribute("loginCheck");
		
		switch (backPage) {
			case 1: return "redirect:list";
			case 2: return "redirect:write";
			case 3: return "redirect:contentView";
			default: return "redirect:list";
		}
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request, Model model) {
		logger.info("HomeController의 register() 실행");
		
		int currentPage;
		try { currentPage = Integer.parseInt(request.getParameter("currentPage")); } 
		catch (NumberFormatException e) { currentPage = 1; }
		
		model.addAttribute("currentPage", currentPage);
		
		return "register";
	}
	
	@RequestMapping("/selectByIdx")
	public String selectByIdx(HttpServletRequest request, Model model, MainVO mainVO,
			HttpSession session) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String job = request.getParameter("job");
		if (job == null) {
			job = "";
		}
		
		// read.jsp에서 삭제 버튼 클릭 시
		if (job.equals("delete")) {
			mapper.delete(idx);
			model.addAttribute("currentPage", currentPage);
			return "redirect:list";
		// read.jsp에서 수정 버튼 클릭 시
		} else if(job.equals("update")) {
			// MainCommentList list = MainCommentService.getInstance().selectList(idx);
			MainVO mainvo = mapper.selectByIdx(idx);
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("mainvo", mainvo);
			// model.addAttribute("enter", "\r\n");
			
			// TOP5 글 랭킹
			MainList selectHit = ctx.getBean("selectHit", MainList.class);
			MainList selectGood = ctx.getBean("selectGood", MainList.class);
			MainList selectNew = ctx.getBean("selectNew", MainList.class);
			selectHit.setList(mapper.selectHit());
			selectGood.setList(mapper.selectGood());
			selectNew.setList(mapper.selectNew());
			model.addAttribute("selectHit", selectHit);
			model.addAttribute("selectGood", selectGood);
			model.addAttribute("selectNew", selectNew);
			
			return "readUpdate";
		// read.jsp에서 추천 버튼 클릭 시
		} else if(job.equals("good")) {
			// System.out.println("goodidxcheck" + idx);
			String ch = (String) session.getAttribute("goodidxcheck" + idx);
			if (ch == null) {
				ch = "";
			}
			if (!ch.equals("checked")) {
				mapper.good(idx);
				session.setAttribute("goodidxcheck" + idx, "checked");
			}
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			return "redirect:selectByIdx";
		// readUpdate.jsp에서 수정 완료 버튼 클릭 시
		} else if(job.equals("updateOK")) {
			mapper.update(mainVO);
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("Mainboard", mainVO);
			// model.addAttribute("enter", "\r\n");
			
//			if (vo.getCategory() == null || vo.getCategory().equals("카테고리 입력") || vo.getCategory().trim().equals("")) {
//				out.println("<script>");
//				out.println("alert('카테고리를 입력하세요')");
//				out.println("location.href='readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
//				
//			} else if (vo.getSubject() == null || vo.getSubject().trim().equals("")) {
//				out.println("<script>");
//				out.println("alert('제목을 입력하세요')");
//				out.println("location.href='readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
//				
//			} else if (vo.getContent() == null || vo.getContent().trim().equals("")) {
//				out.println("<script>");
//				out.println("alert('내용을 입력하세요')");
//				out.println("location.href='readUpdate.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
//				
//			} else {
//				MainService.getInstance().update(vo);
//				out.println("<script>");
//				out.println("alert('정상적으로 수정되었습니다')");
//				out.println("location.href='selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
//				
//			}
//			out.println("</script>");
			return "redirect:contentView";
		// Main.jsp에서 게시글 제목 클릭 시, readUpdate.jsp에서 수정 취소 버튼 클릭 시
		} else {
			
			MainVO mainvo = mapper.selectByIdx(idx); // 메인글
//			MainCommentList list = MainCommentService.getInstance().selectList(idx); // 해당 글의 댓글

			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("Mainboard", mainvo);
			// model.addAttribute("enter", "\r\n");
			
//			request.setAttribute("commentList", list);
			
			try {
				session.getAttribute("goodidxcheck" + idx);
			} catch (NullPointerException e) {
				session.setAttribute("goodidxcheck" + idx, "");
			}
			
			//	read.jsp로 넘겨준다.
			return "redirect:contentView";
		}
	}
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model, Param param,
			HttpSession session) {
		logger.info("HomeController의 list() 실행");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int pageSize = 10;
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		
		String searchTag = request.getParameter("searchTag");
		String category = request.getParameter("category");
		String searchVal = request.getParameter("searchVal");
			
		if (searchVal != null) { // 넘어온 검색어가 있으면 세션에 태그와 검색어를 저장
			session.setAttribute("searchTag", searchTag);
			session.setAttribute("category", category);
			searchVal = searchVal.trim().length() == 0 ? "" : searchVal;
			session.setAttribute("searchVal", searchVal);
		} else { // 검색어가 없으면 세션에 저장된 검색어와 카테고리를 읽어온다.
			searchTag = (String) session.getAttribute("searchTag");
			category = (String) session.getAttribute("category");
			searchVal = (String) session.getAttribute("searchVal");
		}
		MainList mainList = ctx.getBean("mainList", MainList.class);

		param.setSearchTag(searchTag);
		param.setCategory(category);
		param.setSearchVal(searchVal);
		
		if (searchTag.equals("subject")) {
			int totalCount = mapper.searchCount1(param);
			mainList.initMainList(pageSize, totalCount, currentPage);
			param.setStartNo(mainList.getStartNo());
			param.setEndNo(mainList.getEndNo());
			mainList.setList(mapper.searchList1(param));
		} else if (searchTag.equals("id")) {
			int totalCount = mapper.searchCount2(param);
			mainList.initMainList(pageSize, totalCount, currentPage);
			param.setStartNo(mainList.getStartNo());
			param.setEndNo(mainList.getEndNo());
			mainList.setList(mapper.searchList2(param));
		}
		
		model.addAttribute("mainList", mainList);
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		model.addAttribute("searchVal", searchVal);
		
		return "main";
	}
	
	@RequestMapping("/search_pw")
	public String search_pw(HttpServletRequest request, Model model) {
		logger.info("HomeController의 search_pw() 실행");
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int idx;
		int currentPage;
		int backPage;
		try { idx = Integer.parseInt(request.getParameter("idx")); } 
		catch (NumberFormatException e) { idx = 1; }
		try { currentPage = Integer.parseInt(request.getParameter("currentPage")); } 
		catch (NumberFormatException e) { currentPage = 1; }
		try { backPage = Integer.parseInt(request.getParameter("backPage")); } 
		catch (NumberFormatException e) { backPage = 1; }
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		model.addAttribute("idx", idx);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("backPage", backPage);
	
		return "search_pw";
	}
	
	@RequestMapping("/search_pw_OK")
	public String search_pw_OK(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		
		MemberVO memberVO = ctx.getBean("memberVO", MemberVO.class);
		memberVO.setId(id);
		memberVO.setName(name);
		memberVO.setEmail(email);
		// System.out.println(memberVO);
		
		int search_pw_check = mapper.search_pw_check(memberVO);
		MemberVO search_pw = mapper.search_pw(memberVO);
		
		// TOP5 글 랭킹
		MainList selectHit = ctx.getBean("selectHit", MainList.class);
		MainList selectGood = ctx.getBean("selectGood", MainList.class);
		MainList selectNew = ctx.getBean("selectNew", MainList.class);
		selectHit.setList(mapper.selectHit());
		selectGood.setList(mapper.selectGood());
		selectNew.setList(mapper.selectNew());
		model.addAttribute("selectHit", selectHit);
		model.addAttribute("selectGood", selectGood);
		model.addAttribute("selectNew", selectNew);
		
		String Message;
		if (search_pw_check == 1) {
			Message = memberVO.getName() + "의 비밀번호는 " + search_pw.getPw() + "입니다.";
			model.addAttribute("msg", Message);
			return "login";
		} else {
			Message = "입력 정보 확인 바람";
			model.addAttribute("msg", Message);
			return "search_pw";
		}
	}
}
