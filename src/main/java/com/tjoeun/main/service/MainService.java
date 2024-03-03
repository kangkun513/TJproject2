package com.tjoeun.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.main.dao.MainDAO;
import com.tjoeun.main.mybatis.MySession;
import com.tjoeun.main.vo.MainList;
import com.tjoeun.main.vo.MainVO;

public class MainService {
	
	private static MainService instance = new MainService();
	private MainService() { }
	public static MainService getInstance() {
		return instance;
	}
	
//	writeOK.jsp에서 호출되는 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글을 저장하는
//	FreeboardDAO 클래스의 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public void insert(MainVO vo) {
		System.out.println("MainService 클래스의 insert() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}	
	
//	list.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1페이지 분량의
//	메인글 목록을 얻어오는 MainDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public MainList selectList(int currentPage) {
		System.out.println("MainService 클래스의 selectList() 메소드 실행");
		SqlSession mapper = MySession.getSession();	
		
		int pageSize = 10;
		int totalCount = MainDAO.getInstance().selectCount(mapper);	
		
		MainList mainList = new MainList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", mainList.getStartNo());
		hmap.put("endNo", mainList.getEndNo());
		mainList.setList(MainDAO.getInstance().selectList(mapper, hmap));
		
		mapper.close();
		return mainList;
	}
	
	
//	read.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1건의
//	메인글을 얻어오는 MainDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public MainVO selectByIdx(int idx) {
		System.out.println("MainService 클래스의 selectByIdx() 메소드 실행");
		SqlSession mapper = MySession.getSession();	
		
		MainVO vo = MainDAO.getInstance().selectByIdx(mapper, idx);
		System.out.println(vo);
		
		mapper.close();
		return vo;
	}
	
//	increment.jsp에서 호출되는 조회수를 증가시킬 글번호를 넘겨받고 mapper를 얻어온 후 메인글의 조회수를
//	증가시키는 MainDAO 클래스의 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public void increment(int idx) {
		System.out.println("MainService 클래스의 increment() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().increment(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
	// read.jsp, list.jsp에서 호출되는 mapper를 얻어온 후 MainDAO 클래스의 테이블에 저장된 
	// 조회수 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectHit() {
		System.out.println("MainService 클래스의 selectHit() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectHit(mapper));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	// read.jsp, list.jsp에서 호출되는 mapper를 얻어온 후 MainDAO 클래스의 테이블에 저장된 
	// 추천수 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectGood() {
		System.out.println("MainService 클래스의 selectGood() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectGood(mapper));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	// read.jsp, list.jsp에서 호출되는 mapper를 얻어온 후 MainDAO 클래스의 테이블에 저장된 
	// 신규글 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectNew() {
		System.out.println("MainService 클래스의 selectNew() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectNew(mapper));
		// System.out.println(list);
		
		mapper.close();
		return list;
	}
	
	public void delete(int idx) {
		System.out.println("MainService 클래스의 delete() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().delete(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
	public void update(MainVO vo) {
		System.out.println("MainService 클래스의 update() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		MainDAO.getInstance().update(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
}