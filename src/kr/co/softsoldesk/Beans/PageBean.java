package kr.co.softsoldesk.Beans;

public class PageBean {
	private int min; //최소 페이지 번호
	private int max; //최대 페이지 번호
	private int prevPage; //이전 버튼 페이지 번호
	private int nextPage; //다음 버튼 페이지 번호
	private int pageCnt; //전체 페이지 개수
	private int currentPage; //현재 페이지 번호
	
	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		//contentCnt: 전체 글 개수
		//currentPage: 현재 페이지 번호
		//contentPageCnt: 페이지당 글의 개수(10개)
		//paginationCnt: 한번에 표시할 페이지 버튼의 최대개수(10개)
		
		this.currentPage = currentPage;
		//현재 페이지 번호
		
		pageCnt = contentCnt / contentPageCnt;
		//전체 페이지 개수
		//EX) 게시글이 1개: 1 / 10 => 0페이지 => +1 필요
		//EX) 게시글이 10개: 10 / 10 => 1페이지 => +1필요 X
		//EX) 게시글 21개 : 21/10 => 2페이지 => +1 필요
		//EX) 게시글 30개: 3페이지 => +1 필요X
		//=> 나머지가 0보다 크면 +1 필요
		
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
		//=================페이지 계산====================
		
		min = ((currentPage-1) / contentPageCnt) * contentPageCnt + 1;
		//1번째 페이지: 0 / 10 * 10+1 => 1 [1]부터 화면에 출력
		//2번째 페이지: 1/10*10+1 => 1     [1]부터 화면에 출력
		//11번째 페이지 10/10*10+1 => 11   [11]부터 화면에 출력
		
		max = min + paginationCnt - 1;
		//1페이지: 1 + 10 - 1 => 10 1페이지의 최대 페이지[10]
		
		if(max > pageCnt) {
			max = pageCnt; //11개의 글이 있을 때 하단에 페이지네이션을 2번까지만 만듦
		}
		
		//=================보이는 페이지의 페이지네이션 값 최대, 최소==================
		
		prevPage = min - 1;
		//이전 페이지는 최소페이지에서-1   <이전 [11]  => [10]
		
		nextPage = max + 1;
		//다음 페이지는 최대페이지에서+1   [10] 다음>  => [11]
		
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		} //최대페이지 제한
		//EX)현재 전체 페이지가 15페이지일 때, max는 15페이지로 조정
		//nextPage는 16페이지여야 하지만 16페이지는 존재하지 않으므로 nextPage를 15페이지로 조정
	}

	
	/*
	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		this.currentPage = currentPage;
		pageCnt = contentCnt / contentPageCnt;
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
		min = ((currentPage-1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationCnt - 1;
		if(max > pageCnt) {max = pageCnt;}
		prevPage = min - 1;
		nextPage = max + 1;
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		} 
	}*/
	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
}
