package ex03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReviewDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ReviewDAO instance = new ReviewDAO();
	public static ReviewDAO getInstance() {
		return instance;
	}
	private ReviewDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//dto를 insert하는 함수
	public int insert(ReviewDTO dto) {
		int row=0;
		String sql ="insert into review (storeName, content, image, visitDate)"
				+ " values(?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStoreName());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImage());
			pstmt.setDate(4, dto.getVisitDate());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	
	}
	// 리뷰 목록을 날짜 순으로 정렬하여 불러오는 함수
	public List<ReviewDTO> selectList(){
		ArrayList<ReviewDTO> list = new ArrayList<>();
		String sql="select * from review order by visitDate desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();		
			}finally {
				close();
			}
		return list;
	}
	
	public ReviewDTO selectOne(int idx) {
		ReviewDTO dto = null;
		String sql="select * from review where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();		
			}finally {
				close();
			}
		return dto;	
	}
	
	
	
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
		}
	}
	
	private ReviewDTO mapping(ResultSet rs) throws SQLException {
		ReviewDTO dto = new ReviewDTO();
		dto.setContent(rs.getString("content"));
		dto.setIdx(rs.getInt("idx"));
		dto.setImage(rs.getString("image"));
		dto.setStoreName(rs.getString("storeName"));
		dto.setVisitDate(rs.getDate("visitDate"));
		
		return dto;
		
	}
	
}
