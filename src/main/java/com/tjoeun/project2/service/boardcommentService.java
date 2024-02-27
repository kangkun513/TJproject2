package com.tjoeun.project2.service;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.project2.dao.boardcommentDAO;
import com.tjoeun.project2.mybatis.freeSession;
import com.tjoeun.project2.vo.boardcommentVO;

public class boardcommentService {
	private static boardcommentService instance = new boardcommentService();
	private boardcommentService() { }
	public static boardcommentService getInstance() {
		return instance;
	}
	
	public boolean insertComment(boardcommentVO co) {
		System.out.println("boardcommentService 클래스의 insertComment() 메소드 실행");
		SqlSession mapper = freeSession.getSession();
		int result = boardcommentDAO.getInstance().insertComment(mapper, co);
		System.out.println(result);
		if (result == 1) {
			mapper.commit();
			mapper.close();
			return true;
		} else {
			mapper.close();
			return false;
		}
	}
	
}
