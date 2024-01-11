package board2;

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
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getString("writer"));
		dto.setContent(rs.getString("content"));
		dto.setImage(rs.getString("image"));
		dto.setIpaddr(rs.getString("ipaddr"));
		dto.setViewCount(rs.getInt("viewCount"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setDeleted(rs.getInt("deleted"));
		return dto;
		
	}
	
	// 게시글 목록 불러오기
		public List<BoardDTO> selectList(String search, Paging paging){
			ArrayList<BoardDTO> list = new ArrayList<>();
			String sql = "select * from board2 "
					+ "	where"
					+ "		deleted = 0 and"
					+ "		(title like '%' || ? || '%' or"
					+ "		writer like '%' || ? || '%' or"
					+ "		content like '%' || ? || '%')"
					+ " order by idx desc"
					+ "	offset ? rows"
					+ "	fetch next ? rows only";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				pstmt.setString(3, search);
				pstmt.setInt(4, paging.getOffset());
				pstmt.setInt(5, paging.getFetch());
				rs =pstmt.executeQuery();
				while(rs.next()) {
					list.add(mapping(rs));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}return list;
			
		}
	
		
	// 게시글 개수 불러오기
		public int selectCount(String search) {
			int count =0;
			String sql ="select count(*) from board2 "
					+ "	where"
					+ "		deleted = 0 and"
					+ "		(title like '%' || ? || '%' or"
					+ "		writer like '%' || ? || '%' or"
					+ "		content like '%' || ? || '%')"
					+ " order by idx desc";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				pstmt.setString(2, search);
				pstmt.setString(3, search);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return count;
		}
		
		// 단일 게시글 불러오기 (ip주소 일부 가리기)
		public BoardDTO selectOne(int idx) {
			BoardDTO dto = null;
			String sql = "select * from board2 where idx = ? ";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = mapping(rs);
					//dto.setIpaddr(maskIPaddr(dto.getIpaddr()));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { close(); }
			return dto;
		}
		
		private String maskIPaddr(String src) {	// 아이피 주소 원본(DB에서 가져온 값)
			String dst = "";
			int dotCount = 0;
			for(int i = 0; i < src.length(); i++) {
				char ch = src.charAt(i);
				if(ch == '.') dotCount += 1;
				if(dotCount >= 2 && '0' <= ch && ch <= '9') {
					dst += '*';
				}
				else {
					dst += ch;
				}
			}
			return dst;		// 뒷자리 숫자를 자릿수 맞춰서 *로 바꾼 문자열
		}
		// 게시글 작성
		public int insert(BoardDTO dto) {
			int row = 0;
			String sql= "insert into board2 (title, writer, content, image, ipaddr)"
					+ " values (?, ?, ?, ?, ?)";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getWriter());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getImage());
				pstmt.setString(5, dto.getIpaddr());
				row =pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return row;
			
		}
	
		
		// 삭제 : 리스트를 불러올 때, deleted값이 0인 항목만 불러오면 된다
		public int delete(int idx) {
			int row=0;
			String sql ="update board2 set deleted = 1 where idx = ?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				row = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return row;
		}
		
		// 삭제여부
		public List<BoardDTO> selectListByWriter(String userid) {
			ArrayList<BoardDTO> list = new ArrayList<>();
			String sql ="select * from board2 where writer = ?";
			try {
				conn =ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
			    rs = pstmt.executeQuery();
			    while(rs.next()) {
			    	list.add(mapping(rs));
			    }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return list;	
		}
		
		// 삭제 복원
		
		public int back(int idx) {
			int row =0;
			String sql="update board2 "
					+ "	 set deleted = 0"
					+ "	 where idx = ? ";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				row =pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return row;
			
		}
		
		// 조회수 세기
		public int totalView(int idx) {
			int row =0;
		    String sql = "update board2 set viewCount = viewCount + 1 where idx = ?";
		    try {
		        conn = ds.getConnection();
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, idx);
		        row = pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return 0; 
		    } finally {
		        close();
		    }
		    return row;
		}
		
		
		// 게시물 수정
		public int modifyPost(BoardDTO dto) {
			int row =0;
			String sql="update board2 set title = ? and content =? where idx =?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getContent());;
				pstmt.setInt(3, dto.getIdx());
				row = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return row;
		}
			
}
