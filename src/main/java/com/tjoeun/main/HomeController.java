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

import com.tjoeun.main.dao.MybatisDAO;
import com.tjoeun.main.vo.MainCommentList;
import com.tjoeun.main.vo.MainList;
import com.tjoeun.main.vo.MainVO;
import com.tjoeun.main.vo.MemberVO;

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
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {		}
		// int loginCheck = Integer.parseInt(request.getParameter("loginCheck"));
		int totalCount = mapper.selectCount();
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:/applicationCTX.xml");
		MainList mainList = ctx.getBean("mainList", MainList.class);
		mainList.initMainList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", mainList.getStartNo());
		hmap.put("endNo", mainList.getEndNo());
		mainList.setList(mapper.selectList(hmap));
		
		model.addAttribute("mainList", mainList);
		// model.addAttribute("loginCheck", request.getParameter("loginCheck"));
		
		return "main";
	}
	
	@RequestMapping("/increment")
	public String increment(HttpServletRequest request, Model model) {
		logger.info("HomeController의 increment() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		mapper.increment(idx);
		model.addAttribute("idx", request.getParameter("idx"));
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		
		return "redirect:contentView";
	}
	
	@RequestMapping("/contentView")
	public String contentView(HttpServletRequest request, Model model) {
		logger.info("HomeController의 contentView() 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		// int loginCheck = Integer.parseInt(request.getParameter("loginCheck"));
		
		MainVO mainVO = mapper.selectByIdx(idx);
		model.addAttribute("vo", mainVO);
		model.addAttribute("idx", idx);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		model.addAttribute("enter", "\r\n");
		// model.addAttribute("loginCheck", request.getParameter("loginCheck"));
		
		return "read";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		logger.info("HomeController의 write() 실행");
		
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		int loginCheck = Integer.parseInt(request.getParameter("loginCheck"));
//		MainList selectHit = MainService.getInstance().selectHit();
//		MainList selectGood = MainService.getInstance().selectGood();
//		MainList selectNew = MainService.getInstance().selectNew();
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("loginCheck", loginCheck);
		
		return "write";
	}
	
	@RequestMapping("/writeOK")
	public String writeOK(HttpServletRequest request, Model model, MainVO mainVO) {
		logger.info("Homecontroller의 writeOK() 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		mapper.insert(mainVO);
		
		return "redirect:list";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		logger.info("HomeController의 login() 실행");
		
		int idx;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		} catch (NumberFormatException e) {
			idx = 1;
		}
		
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		int backPage = Integer.parseInt(request.getParameter("backPage"));
//		MainList selectHit = MainService.getInstance().selectHit();
//		MainList selectGood = MainService.getInstance().selectGood();
//		MainList selectNew = MainService.getInstance().selectNew();
		
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
		
		int idx;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		} catch (NumberFormatException e) {
			idx = 1;
		}
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		int backPage = Integer.parseInt(request.getParameter("backPage"));
		int loginCheck = mapper.login(memberVO);
//		MainList selectHit = MainService.getInstance().selectHit();
//		MainList selectGood = MainService.getInstance().selectGood();
//		MainList selectNew = MainService.getInstance().selectNew();
		
		
		model.addAttribute("idx", idx);
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

		int idx;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		} catch (NumberFormatException e) {
			idx = 1;
		}
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		int backPage = Integer.parseInt(request.getParameter("backPage"));
		
		model.addAttribute("idx", idx);
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
		
		int idx;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		} catch (NumberFormatException e) {
			idx = 1;
		}
		
		int currentPage;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		
		model.addAttribute("idx", idx);
		model.addAttribute("currentPage", currentPage);
		
		return "register";
	}
	
	@RequestMapping("/selectByIdx")
	public String selectByIdx(HttpServletRequest request, Model model,
			HttpSession session) {
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
			mapper.selectByIdx(idx);
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			return "readUpdate";
		// read.jsp에서 추천 버튼 클릭 시
		} else if(job.equals("good")) {
			mapper.good(idx);
			System.out.println("goodidxcheck" + idx);
			session.setAttribute("goodidxcheck" + idx, "checked");
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			return "redirect:selectByIdx";
		// readUpdate.jsp에서 수정 완료 버튼 클릭 시
		} else if(job.equals("updateOK")) {
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
			return "redirect:selectByIdx";
		// Main.jsp에서 게시글 제목 클릭 시, readUpdate.jsp에서 수정 취소 버튼 클릭 시
		} else {
			
			MainVO mainvo = mapper.selectByIdx(idx); // 메인글
//			MainCommentList list = MainCommentService.getInstance().selectList(idx); // 해당 글의 댓글
//			
//			MainList selectHit = MainService.getInstance().selectHit(); // 조회수 랭킹
//			MainList selectGood = MainService.getInstance().selectGood(); // 추천수 랭킹
//			MainList selectNew = MainService.getInstance().selectNew(); // 신규글 랭킹
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("Mainboard", mainvo);
			model.addAttribute("enter", "\r\n");
			
//			request.setAttribute("selectHit", selectHit);
//			request.setAttribute("selectGood", selectGood);
//			request.setAttribute("selectNew", selectNew);
//			request.setAttribute("commentList", list);
			
			try {
				session.getAttribute("goodidxcheck" + idx);
			} catch (NullPointerException e) {
				session.setAttribute("goodidxcheck" + idx, "un");
			}
			
			//	read.jsp로 넘겨준다.
			return "redirect:contentView";
		}
	}
}
