package com.tjoeun.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardcomment")
public class AjaxComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AjaxComment 서블릿이 actionDo() 메소드 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String idx = "";
		if (request.getParameter("idx") != null) {
			idx = request.getParameter("idx").trim();
		}
		System.out.println(idx);
		
		ArrayList<commentVO> list = new commentDAO().getContent(idx);
		System.out.println(list);
		request.setAttribute("list", list.get(0));
		request.setAttribute("idx", list.get(0).getIdx());
		request.setAttribute("name", list.get(0).getName());
		request.setAttribute("content", list.get(0).getContent());
		request.setAttribute("writeDate", list.get(0).getWriteDate());
		request.setAttribute("gup", list.get(0).getGup());
		
		String viewpage = "/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
	}
}
