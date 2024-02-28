package com.tjoeun.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view.jsp/AjaxLogin")
public class AjaxLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AjaxSelect 서블릿이 actionDo() 메소드 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");

		response.getWriter().write(getJSON(id));
	}
	
	private String getJSON(String id) {
		System.out.println("AjaxSelect 서블릿이 getJSON() 메소드 실행");
		if (id == null) {
			id = "";
		}
		ArrayList<AjaxVO> list = new AjaxDAO().login(id);
		
		StringBuffer result = new StringBuffer();
		result.append("{\"result\": [");
		for (AjaxVO vo : list) {
			result.append("[{\"value\": \"" + vo.getId().trim() + "\"},");
			result.append("{\"value\": \"" + vo.getPw().trim() + "\"},");
		}
		result.append("]}");
		
		return null;
	}
	
}
