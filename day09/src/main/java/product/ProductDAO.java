package product;

import java.sql.*;
import java.util.*;
import oracle.jdbc.driver.OracleDriver;

public class ProductDAO {

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

	// close 계속 쓰니까 함수로 만듦
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
	private ProductDTO mapping(ResultSet rs) throws SQLException {
		ProductDTO dto = new ProductDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setPrice(rs.getInt("price"));
		dto.setImgName(rs.getString("imgName"));
		return dto;
	}

	// 전체 목록 불러오기
	public List<ProductDTO> selectList() {
		ArrayList<ProductDTO> list = new ArrayList<>();
		String sql = "select * from product"; // 쿼리문 작성
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 단일 조회
	public ProductDTO selectOne(int idx) {
		String sql = "select * from product where idx = ?";
		ProductDTO dto = null;
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

	// 추가하기

	public int insert(ProductDTO dto) {
		int row = 0;
		String sql = "insert into product (idx, name, price, imgName)" + " values(?, ?, ?, ?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgName());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close();
		}
		return row;
	}

	// 수정하기
	
	public int update(ProductDTO dto) {
		int row=0;
		String sql = "update product"
				+ " set"
				+ " name=?,"
				+ " price=?,"
				+ " imgName=? "
				+ " where"
				+ " idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getImgName());
			pstmt.setInt(4, dto.getIdx());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return row;
	}
	

	// 삭제하기
	public int delete(int idx) {
		int row = 0;
		String sql = "delete from product where idx=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
//			rs = pstmt.executeQuery(sql);
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			close();
		}
		return row;
	}

	//
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from product";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return idx;
	}

}
