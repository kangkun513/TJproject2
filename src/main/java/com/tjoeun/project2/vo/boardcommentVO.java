package com.tjoeun.project2.vo;

import java.util.Date;

public class boardcommentVO {
	private int idx;
	private String name;
	private String content;
	private Date writeDate;
	private int gup;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getGup() {
		return gup;
	}
	public void setGup(int gup) {
		this.gup = gup;
	}
	
	@Override
	public String toString() {
		return "boardcommentVO [idx=" + idx + ", name=" + name + ", content=" + content + ", writeDate=" + writeDate
				+ ", gup=" + gup + "]";
	}
}
