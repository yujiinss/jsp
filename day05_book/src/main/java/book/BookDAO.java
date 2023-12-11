package book;

import java.util.ArrayList;
import java.util.List;

public class BookDAO {
	
	// 서로 다른 JSP 페이지에서 같은 DAO객체를 참조하기 위해 싱글톤 패턴 적용
	// 1) DAO객체는 생성자로 호출 할 수 없다
	// 2) DAO클래스의 static 메서드를 호출하여 단 하나의 객체만 반환하도록 한다
	
	// 프로그램에서 사용되는 데이터의 저장소
	private ArrayList<BookDTO> list = new ArrayList<>();
	// 프로그램의 주요 기능을 메서드로 작성한다
	// 목록
	public List<BookDTO> selectList(){
		// select * from book order by idx;
		return list;
	}
	// 단일 조회
	public BookDTO selectOne(int idx) {
		// select * from book where idx=?
		for(BookDTO dto : list) {
			if(dto.getIdx() == idx) {
				return dto;
			}
		}
		return null;
	}
	
	// 추가
	
	public int insert(BookDTO dto) {
		//insert into book(title,author,publisher, publishDate) values(?,?,?,?)
		int row = list.add(dto) ? 1: 0;
		return row;
	}
	// 삭제
	public int delete(int idx) {
		int row =list.removeIf(dto -> dto.getIdx() == idx) ? 1: 0;
		return row;
	}
	
	//추가한 이후 마지막으로 추가된 객체의 idx가 몇 번인지 확인하는 기능
	public static int currval() {
		return BookDTO.getSeq();
	}
		//select book_seq.currval from dual
	

}
