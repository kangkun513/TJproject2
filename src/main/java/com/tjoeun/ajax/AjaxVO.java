package com.tjoeun.ajax;

public class AjaxVO {
	private String id;
	private String pw;
	private String name;
	private String nick;
	private String email;
	
	public AjaxVO() { }

	public AjaxVO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
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
		return "AjaxVO [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", email=" + email + "]";
	}
	
}
