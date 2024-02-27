package com.tjoeun.project2.service;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.project2.dao.boardDAO;
import com.tjoeun.project2.mybatis.freeSession;
import com.tjoeun.project2.vo.boardVO;


public class boardService {
	private static boardService instance = new boardService();
	private boardService() { }
	public static boardService getInstance() {
		return instance;
	}
	
	public boardVO selectByIdx(int idx) {
		System.out.println("boardService 클래스의 selectByIdx() 메소드 실행");
		SqlSession mapper = freeSession.getSession();
		boardVO vo = boardDAO.getInstance().selectByIdx(mapper, idx);
		mapper.close();
		return vo;
	}
}
