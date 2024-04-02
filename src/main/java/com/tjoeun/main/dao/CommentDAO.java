package com.tjoeun.main.dao;

import java.util.ArrayList;

import com.tjoeun.main.vo.MainCommentVO;

public interface CommentDAO {

	ArrayList<MainCommentVO> selectList(int idx);
	void insert(MainCommentVO commentVO);
	void delete(int comidx);
	MainCommentVO selectByIdx(int idx);
	void update(MainCommentVO origincom);
	
}
