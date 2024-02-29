package com.tjoeun.TJproject2.vo;

public class memberVO {
	private int id;
	private String pw;
	private String name;
	private String nick;
	private String email;
	
	public memberVO() { }

	public memberVO(int id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "memberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", email=" + email + "]";
	}
}
