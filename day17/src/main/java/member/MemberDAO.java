package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {
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
	
	private MemberDTO mapping(ResultSet rs) throws Exception {
		MemberDTO dto = new MemberDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setUserpw(rs.getString("userpw"));
		dto.setUsername(rs.getString("username"));
		dto.setEmail(rs.getString("email"));
		dto.setGender(rs.getString("gender"));	
		return dto;
		
	}
	
	// 로그인
	
	    public MemberDTO selectOne(MemberDTO dto){
		MemberDTO selectOne = null;
		String sql ="select * from member where userid = ? and userpw = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				selectOne = mapping(rs);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return selectOne;
	}
	
	// 회원가입
	
	    public int insert(MemberDTO dto){
		int row =0;
		String sql=" insert into member (userid, userpw, username, gender, email) "
				+ " values (?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail());
			row = pstmt.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException e) {
			row = -1;
			e.printStackTrace();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
		
	}
	
	// 회원탈퇴
	    public int delete(MemberDTO dto){
	    	int row =0;
	    	String sql ="delete from member where userid = ?";
	    	try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getUserid());
				row = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
	    	
			return row;
	    	
	    }
	      
}
