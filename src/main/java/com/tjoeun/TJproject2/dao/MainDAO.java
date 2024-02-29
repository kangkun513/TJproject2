package com.tjoeun.TJproject2.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import com.tjoeun.TJproject2.vo.MainVO;

public class MainDAO {
	private static MainDAO instance = new MainDAO();
	private MainDAO() { }
	public static MainDAO getInstance() {
		return instance;
	}
	
	public ArrayList<MainVO> selectRankList(SqlSession mapper) {
		System.out.println("boardDAO 클래스의 selectRankList() 메소드 실행");
		return (ArrayList<MainVO>) mapper.selectList("selectRankList");
	}
	
}
