package com.tjoeun.ajax;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class boardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//	기본 생성자에서 오라클과 연결함
	public boardDAO() {
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

//	게시글 번호에 게시글이 있나 판단하고 가져오는 메소드
	public ArrayList<boardVO> getContent(String idx) {
		System.out.println("boardDAO 클래스의 getContent() 메소드 실행");
		ArrayList<boardVO> list = null;
		try {
			String sql = "select * from main where idx = ?";
			pstmt = conn.prepareStatement(sql);
			int idx_int = Integer.parseInt(idx.trim());
			pstmt.setInt(1, idx_int);
			rs = pstmt.executeQuery();
			list = new ArrayList<boardVO>();
		
			while (rs.next()) {
				boardVO vo = new boardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setHit(rs.getInt("hit"));
				vo.setGood(rs.getInt("good"));
				vo.setWriteDate(rs.getDate("writeDate"));
				vo.setGup(rs.getInt("gup"));
				vo.setCategory(rs.getString("category"));
				vo.setId(rs.getString("id"));
				list.add(vo);
			}
		} catch (SQLException e) {
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
