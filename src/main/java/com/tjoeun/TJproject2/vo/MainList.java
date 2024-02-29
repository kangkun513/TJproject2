package com.tjoeun.TJproject2.vo;

import java.util.ArrayList;

public class MainList {
	private ArrayList<MainVO> list = new ArrayList<MainVO>();

	public ArrayList<MainVO> getList() {
		return list;
	}
	public void setList(ArrayList<MainVO> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "MainList [list=" + list + "]";
	}
}
