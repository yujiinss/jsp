package youtube;

import java.sql.*;
import java.util.*;

import oracle.jdbc.driver.OracleDriver;

public class YutubeDAO {

	// 데이터 베이스 연결하기
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// getConnection연결하기 
	private Connection getConnection() throws Exception {
		Class.forName(OracleDriver.class.getName());
		return DriverManager.getConnection(url, user, password);
	}

	// close
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
		}
	}

	// mapping하기
	private YutubeDTO mapping(ResultSet rs) throws SQLException {
		YutubeDTO dto = new YutubeDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setCategory(rs.getString("category"));
		dto.setTitle(rs.getString("title"));
		dto.setChannel(rs.getString("channel"));
		dto.setImgName(rs.getString("imgName"));
		dto.setVideo(rs.getString("video"));
		return dto;
	}
	// 전체 목록 불러오기 (list)

	public List<YutubeDTO> selectList() {
		ArrayList<YutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	// 카테고리에 따른 목록 불러오기 (view)

	public List<YutubeDTO> selectListByCategory(String category) {
		ArrayList<YutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube where category = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 영상 자세히보기(view)
		public YutubeDTO selectOne(int idx) {
			String sql = "select * from youtube where idx = ?";
			YutubeDTO dto = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = mapping(rs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return dto;
		}
	
	
	// 영상 추가하기 (add,add-action)
		
		public int insert(YutubeDTO dto) {
			int row=0;
			String sql="insert into youtube (category, title, channel, imgName, video)"
					+ " values ( ?, ?, ?, ?, ?)";
			try {
				conn = getConnection();
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, dto.getCategory());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getChannel());
				pstmt.setString(4, dto.getImgName());
				pstmt.setString(5, dto.getVideo());
				row = pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return row;		
		}

	// 영상 삭제하기 (delete)
		
		public int delete(int idx) {
			int row=0;
			String sql="delete youtube where idx = ?";
			
			try {
				conn=getConnection();
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				row= pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			} return row;
		}
		

	// 수정하기 (modify)
		
		public int update(YutubeDTO dto) {
			int row=0;
			String sql=" update youtube"
					+ " set"
					+ " category = ?,"
					+ " title = ?, "
					+ " channel = ?,"
					+ " imgName=?,"
					+ " video=?"
					+ " where "
					+ " idx=?";
			
			try {
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getCategory());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getChannel());
				pstmt.setString(4, dto.getImgName());
				pstmt.setString(5, dto.getVideo());
				pstmt.setInt(6, dto.getIdx());
				row = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				close();
			}return row;
					
		}
		
}
