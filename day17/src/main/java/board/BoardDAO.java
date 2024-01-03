package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
				
	}
	
	private void close(){
		try {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		}catch(Exception e) {}
	}
	
	private BoardDTO mapping(ResultSet rs) throws Exception {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setTitle(rs.getString("writer"));
		dto.setTitle(rs.getString("content"));
		dto.setDate(rs.getDate("date"));
		return dto;
		
	}
	
	
	// 게시글 목록
	public List<BoardDTO> selectList(){
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql=" select * from board order by idx desc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = mapping(rs);
				//dto.setReplyCount(rs.getInt("reply"))
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
		
	}
	// 게시글 읽기
	
	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		String sql="• select * from board where idx = ?";
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
		}
		return dto;
		
	}
	
	// 게시글 작성
	public int insert(BoardDTO dto) {
		int row =0;
		String sql ="insert into board (title, writer, content) "
				+ " values (?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getTitle() );
			pstmt.setString(2,dto.getWriter() );
			pstmt.setString(3,dto.getContent() );
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	// 게시글 수정
	
	// 게시글 삭제
	public int delete(int idx) {
		int row=0;
		String sql="delete from board where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;	
	}
	
}
