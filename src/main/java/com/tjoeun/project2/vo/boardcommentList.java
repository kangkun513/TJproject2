package com.tjoeun.project2.vo;

import java.util.ArrayList;

//	댓글 목록을 기억하는 클래스
public class boardcommentList {
	private ArrayList<boardcommentVO> list = new ArrayList<boardcommentVO>();
	
	public ArrayList<boardcommentVO> getList() {
		return list;
	}
	public void setList(ArrayList<boardcommentVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "boardcommentList [list=" + list + "]";
	}
}
