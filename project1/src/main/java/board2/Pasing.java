package board2;

public class Pasing {

		private int page;
		private int perPage;
		private int boardCount;
		private int offset;
		private int fetch;
		
		private int pageCount;
		private int section;
		private boolean prev;
		private boolean next;
		
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		public int getPerPage() {
			return perPage;
		}
		public void setPerPage(int perPage) {
			this.perPage = perPage;
		}
		public int getBoardCount() {
			return boardCount;
		}
		public void setBoardCount(int boardCount) {
			this.boardCount = boardCount;
		}
		public int getOffset() {
			return offset;
		}
		public void setOffset(int offset) {
			this.offset = offset;
		}
		public int getFetch() {
			return fetch;
		}
		public void setFetch(int fetch) {
			this.fetch = fetch;
		}
		public int getPageCount() {
			return pageCount;
		}
		public void setPageCount(int pageCount) {
			this.pageCount = pageCount;
		}
		public int getSection() {
			return section;
		}
		public void setSection(int section) {
			this.section = section;
		}
		public boolean isPrev() {
			return prev;
		}
		public void setPrev(boolean prev) {
			this.prev = prev;
		}
		public boolean isNext() {
			return next;
		}
		public void setNext(boolean next) {
			this.next = next;
		}
		
		
}
