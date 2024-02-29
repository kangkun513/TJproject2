package com.tjoeun.TJproject2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.TJproject2.vo.MainCommentVO;

public class MainCommentDAO {
	private static MainCommentDAO instance = new MainCommentDAO();
	private MainCommentDAO() { }
	public static MainCommentDAO getInstance() {
		return instance;
	}
	
//	commentService 클래스에서 호출되는 mapper와 테이블에 저장할 메인 카테고리 정보가 저장된 객체를 넘겨받고
//	테이블에 메인 카테고리를 저장하는 comment.xml 파일의 insert sql 명령을 실행하는 메소드
	public void insert(SqlSession mapper, MainCommentVO vo) {
		System.out.println("MainCommentDAO 클래스의 insert() 메소드 실행");
		mapper.insert("insertComment", vo);
	}
	
	public ArrayList<MainCommentVO> selectList(SqlSession mapper) {
		System.out.println("MainCommentDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<MainCommentVO>) mapper.selectList("selectCommentList");
	}
	
	public MainCommentVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("MainCommentDAO 클래스의 selectByIdx() 메소드 실행");
		return (MainCommentVO) mapper.selectOne("selectCommentByIdx", idx);
	}
	
	public void delete(SqlSession mapper, int idx) {
		System.out.println("MainCommentDAO 클래스의 delete() 메소드 실행");
		mapper.delete("deleteComment", idx);
	}
	
	public void deleteMessage(SqlSession mapper, int idx) {
		System.out.println("MainCommentDAO 클래스의 deleteCommentMessage() 메소드 실행");
		mapper.update("deleteCommentMessage", idx);
	}
	
	public void deleteCheck(SqlSession mapper, int idx) {
		System.out.println("MainCommentDAO 클래스의 deleteCommentCheck() 메소드 실행");
		mapper.update("deleteCommentCheck", idx);
	}

}
