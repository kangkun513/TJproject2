package com.tjoeun.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.main.vo.MainVO;

public class MainDAO {
	private static MainDAO instance = new MainDAO();
	private MainDAO() { }
	public static MainDAO getInstance() {
		return instance;
	}
	
//	MainService 클래스에서 호출되는 mapper와 메인글이 저장된 객체를 넘겨받고 메인글을 저장하는 
//	main.xml 파일의 insert sql 명령을 실행하는 메소드	
	public void insert(SqlSession mapper, MainVO vo) {
		System.out.println("MainDAO 클래스의 insert() 메소드 실행");
		mapper.insert("insert", vo);
	}
	
//	MainService 클래스에서 호출되는 mapper를 넘겨받고 메인글 전체 개수를 얻어오는 main.xml
//	파일의 select sql 명령을 실행하는 메소드	
	public int selectCount(SqlSession mapper) {
		System.out.println("MainDAO 클래스의 selectCount() 메소드 실행");
		return (int) mapper.selectOne("selectCount");
	}
	
//	MainService 클래스에서 호출되는 mapper와 1페이지 분량의 시작 인덱스, 끝 인덱스가 저장된
//	HashMap 객체를 넘겨받고 1페이지 분량의 메인글 목록을 얻어오는 main.xml 파일의 
//	select sql 명령을 실행하는 메소드	
	public ArrayList<MainVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("MainDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectList", hmap);
	}

//	MainService 클래스에서 호출되는 mapper와 해당 글 인덱스가 저장된 객체를 넘겨받고 
//	해당 글 인덱스의 메인글 목록을 얻어오는 main.xml 파일의 select sql 명령을 실행하는 메소드
	public MainVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("MainDAO 클래스의 selectByIdx() 메소드 실행");
		return (MainVO) mapper.selectOne("selectByIdx", idx);
	}

//	MainService 클래스에서 호출되는 mapper와 조회수를 증가시킬 글번호를 넘겨받고 조회수를
//	증가시키는 main.xml 파일의 update sql 명령을 실행하는 메소드	
	public void increment(SqlSession mapper, int idx) {
		System.out.println("MainDAO 클래스의 increment() 메소드 실행");
		mapper.update("increment", idx);
	}

	public ArrayList<MainVO> selectHit(SqlSession mapper) {
		System.out.println("MainDAO 클래스의 selectHit() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectHit");
	}
	
	public ArrayList<MainVO> selectGood(SqlSession mapper) {
		System.out.println("MainDAO 클래스의 selectGood() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectGood");
	}
	
	public ArrayList<MainVO> selectNew(SqlSession mapper) {
		System.out.println("MainDAO 클래스의 selectNew() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectNew");
	}
	
	public void delete(SqlSession mapper, int idx) {
		System.out.println("MainDAO 클래스의 delete() 메소드 실행");
		mapper.update("delete", idx);
	}
	
	public void update(SqlSession mapper, MainVO vo) {
		System.out.println("MainDAO 클래스의 update() 메소드 실행");
		mapper.update("update", vo);
	}

}
