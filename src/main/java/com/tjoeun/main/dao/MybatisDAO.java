package com.tjoeun.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.main.vo.MainCommentVO;
import com.tjoeun.main.vo.MainList;
import com.tjoeun.main.vo.MainVO;
import com.tjoeun.main.vo.MemberVO;
import com.tjoeun.main.vo.Param;

//	mapper로 사용할 인터페이스
//	이 인터페이스의 풀 패키지와 이름을 sql 명령이 저장된 xml 파일의 namespace에 정확히 적어야 함
public interface MybatisDAO {

	void insert(MainVO mainVO);
	int selectCount();
	ArrayList<MainVO> selectList(HashMap<String, Integer> hmap);
	void increment(int idx);
	MainVO selectByIdx(int idx);
	void delete(int idx);
	void good(int idx);
	void update(MainVO mainvo);
	ArrayList<MainVO> selectHit();
	ArrayList<MainVO> selectGood();
	ArrayList<MainVO> selectNew();
	int selectCountMulti();
	ArrayList<MainVO> selectListMulti(HashMap<String, Integer> hmap);
	int searchCount1(Param param);
	int searchCount2(Param param);
	int searchCount3(Param param);
	ArrayList<MainVO> searchList1(Param param);
	ArrayList<MainVO> searchList2(Param param);
	ArrayList<MainVO> searchList3(Param param);
	
	
	int login(MemberVO memberVO);
	MemberVO search_pw(MemberVO memberVO);
	int search_pw_check(MemberVO memberVO);
	int checkID(String id);
	void register(HashMap<String, String> hmap);
	
}
