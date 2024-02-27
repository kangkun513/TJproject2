package com.tjoeun.project2.vo;

import java.util.Date;

public class boardVO {
	
	// 메인글
	private int idx;
	private String id;
	private String subject;
	private String content;
	private int hit;
	private int good;
	private Date writeDate;
	private int gup;
	private String category;
	
	public boardVO() {
	}

	public boardVO(int idx, String id, String subject, String content, int hit, int good, Date writeDate, int gup,
			String category) {
		super();
		this.idx = idx;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.hit = hit;
		this.good = good;
		this.writeDate = writeDate;
		this.gup = gup;
		this.category = category;
	}


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "MainVO [idx=" + idx + ", id=" + id + ", subject=" + subject + ", content=" + content + ", hit=" + hit
				+ ", good=" + good + ", writeDate=" + writeDate + ", gup=" + gup + ", category=" + category + "]";
	}
	
}
