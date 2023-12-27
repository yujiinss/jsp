package member;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	private static  MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private Context init; 
	private DataSource ds; 

	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("지정한 이름의 객체를 찾을 수 없습니다 :" + e);
		} finally {
			if (conn != null)try {conn.close();} catch (SQLException e) {}
		}

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

	// mapping
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setUserId(rs.getString("userId"));
		dto.setUserPw(rs.getString("userPw"));
		dto.setUserName(rs.getString("userName"));
		dto.setGender(rs.getString("gender"));
		dto.setEmail(rs.getString("email"));
		return dto;
	}
	
	// 회원목록 불러오기 // sql문 적고 연결
	public List<MemberDTO> selectList(){
		ArrayList<MemberDTO> list = new ArrayList<>();
		String sql ="select * from member";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	// 로그인 
	public MemberDTO login(String userId, String userPw) {
		MemberDTO dto = null;
		String sql = "select * from member where userId = ? and userPw = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
		}
	
	// 회원가입 -추가
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql ="insert into member(userId, userPw, userName, gender, email)"
				+ " values (?, ?, ?, ?, ?)";
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close();
		}
		return row;
		
	}
	
	// 수정
	public int update(MemberDTO dto) {
		int row=0;
		String sql = "update member"
				+ "	set"
				+ "	userId=?,"
				+ "	userName=?,"
				+ "	gender=?,"
				+ "	email=?"
				+ "	where"
				+ "	userId =?";
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, dto.getUserId());
				pstmt.setString(2, dto.getUserPw());
				pstmt.setString(3, dto.getUserName());
				pstmt.setString(4, dto.getGender());
				pstmt.setString(5, dto.getEmail());
				row = pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 }finally {
			 close();
		 }
		 return row;
		}
		
	// 탈퇴
	public int delete(String userId) {
		int row =0;
		String sql ="delete from member where userid =?";
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
	}
	// 로그아웃
	// 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
