package com.tjoeun.ajax;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AjaxDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//	기본 생성자에서 오라클과 연결함
	public AjaxDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "tjoeunit", "0000");
			// System.out.println("연결 성공: " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스가 없거나 읽어올 수 없음");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 정보가 올바르지 않음");			
		}
	}
	
	public ArrayList<AjaxVO> login(String id) {
		System.out.println("AjaxDAO 클래스의 login() 메소드 실행");
		System.out.println(id);
		ArrayList<AjaxVO> list = null;
		try {
			String sql = "select * from register where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			list = new ArrayList<AjaxVO>();
			
			while (rs.next()) {
				AjaxVO vo = new AjaxVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				list.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("ajax 데이터 실패");
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
}
