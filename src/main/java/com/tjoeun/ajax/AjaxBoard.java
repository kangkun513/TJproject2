package com.tjoeun.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/read")
public class AjaxBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AjaxBoard 서블릿이 actionDo() 메소드 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String idx = "";
		if (request.getParameter("idx") != null) {
			idx = request.getParameter("idx").trim();
		}
		System.out.println(idx);
		
		ArrayList<boardVO> list = new boardDAO().getContent(idx);
		System.out.println(list);
		request.setAttribute("idx", list.get(0).getIdx());
		request.setAttribute("subject", list.get(0).getSubject());
		request.setAttribute("content", list.get(0).getContent());
		request.setAttribute("hit", list.get(0).getHit());
		request.setAttribute("good", list.get(0).getGood());
		request.setAttribute("writeDate", list.get(0).getWriteDate());
		request.setAttribute("gup", list.get(0).getGup());
		request.setAttribute("category", list.get(0).getCategory());
		request.setAttribute("id", list.get(0).getId());
		
		String viewpage = "/read.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
	}
}
