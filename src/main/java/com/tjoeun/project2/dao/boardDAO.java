package com.tjoeun.project2.dao;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.project2.vo.boardVO;

public class boardDAO {
	private static boardDAO instance = new boardDAO();
	private boardDAO() { }
	public static boardDAO getInstance() {
		return instance;
	}
	
	public boardVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("boardDAO 클래스의 selectByIdx() 메소드 실행");
		return (boardVO) mapper.selectOne("selectByIdx", idx);
	}

}
