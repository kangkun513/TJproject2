package com.tjoeun.TJproject2.service;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.TJproject2.dao.MainDAO;
import com.tjoeun.TJproject2.mybatis.MySession;
import com.tjoeun.TJproject2.vo.MainList;

public class MainService {
	
	private static MainService instance = new MainService();
	private MainService() { }
	public static MainService getInstance() {
		return instance;
	}
	
	// MainList.jsp에서 호출되는 mapper를 얻어온 후 boardDAO 클래스의 테이블에 저장된 
	// 랭크 글 목록을 얻어오는 select sql 명령 실행하는 메소드를 호출하는 메소드
	public MainList selectRankList() {
		System.out.println("MainService 클래스의 selectRankList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		MainList list = new MainList();
		list.setList(MainDAO.getInstance().selectRankList(mapper));
		System.out.println(list);
		
		mapper.close();
		return list;
	}
	
}
