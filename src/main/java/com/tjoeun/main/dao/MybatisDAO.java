package com.tjoeun.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.main.vo.MainVO;
import com.tjoeun.main.vo.MemberVO;

//	mapper로 사용할 인터페이스
//	이 인터페이스의 풀 패키지와 이름을 sql 명령이 저장된 xml 파일의 namespace에 정확히 적어야 함
public interface MybatisDAO {

	void insert(MainVO mainVO);
	int selectCount();
	ArrayList<MainVO> selectList(HashMap<String, Integer> hmap);
	void increment(int idx);
	MainVO selectByIdx(int idx);
	int login(MemberVO memberVO);
	void delete(int idx);
	void good(int idx);
	
	
}
