package com.tjoeun.project2.dao;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.project2.vo.boardcommentVO;

public class boardcommentDAO {
	private static boardcommentDAO instance = new boardcommentDAO();
	private boardcommentDAO() { }
	public static boardcommentDAO getInstance() {
		return instance;
	}
	
	public int insertComment(SqlSession mapper, boardcommentVO co) {
		System.out.println("boardcommentDAO 클래스의 insertComment() 메소드 실행");
		return mapper.insert("insertComment", co);
	}
	

}
