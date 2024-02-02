package kr.co.softsoldesk.Beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBean {

	private int min;		// 최소페이지 번호
	private int max;		// 최대페이지 번호
	private int prevPage;	// 이전 버튼 페이지 번호
	private int nextPage;	// 다음 버튼 페이지 번호
	private int pageCnt;	// 전체 페이지 개수
	private int currentPage;	// 현재 페이지 번호
	
	// 맨뒤 두개 변수는 option.properties 파일에서 가져온 값으로 넣음
	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		
		// contentCnt : 전체 글 개수
		// currentPage : 현재 페이지 번호
		// contentPageCnt : 페이지당 글의 개수 (10)	option.properties에서 지정한 값
		// paginationCnt : 한번에 표시할 페이지 버튼의 최대 개수 (10) option.properties에서 지정한 값
		
		this.currentPage = currentPage;
		
		pageCnt = contentCnt / contentPageCnt;
		//전체 페이지 개수
		// 게시글이 1개 : 0페이지 에서 +1 해야됌(ㅇ)
		// 게시글이 10개 : 1페이지 +1할필요없음	(X)
		// 게시글이 21개 : 2페이지에서 +1 해야됌(ㅇ)
		// 게시글이 30개 : 3페이지 +1할필요없음 (X)
		
		if (contentCnt % contentPageCnt > 0) {		// 게시글개수 : 1~9 => 1페이지 , 10~19 => 2페이지
			
			pageCnt++;
		}
// =================================================================
		
		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		// 1페이지 : 0/10*10+1 => 1 [1]부터 화면에 출력
		// 2페이지 : 0/10*10+1 => 1 [1]부터 화면에 출력
		// 11페이지 : 10/10*10+1 => 11 [11]부터 화면에 출력
		// 쉽게 말해서 11페이지 가는순간 11페이지 부터 보이게 하는거 ㅇㅇ 
		
		max = min + paginationCnt -1;
		// 1페이지 : 1+ 10 - 1 => 10 1페이지의 최대페이지 [10]
		// 19페이지 : 11 + 10 -1 => 20  19페이지의 최대 페이지 [20]
		
		if(max > pageCnt) {
			max = pageCnt;
		}
		// 전체 페이지가 2페이지까지 있으면, max 페이지는 2페이지로 제한
		// 전체 페이지가 12페이지까지 있으면, max 페이지는 12페이지로 제한
		
// -----------------------------------------------------------------
		
		prevPage = min -1;
		// 이전 페이지는 최소페이지에서 -1		<이전 [11] => [10]
		nextPage = max + 1;
		// 다음 페이지는 최대페이지에서 +1		[10] 다음> => [11]
		
		
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}	// 최대페이지 제한
		// 현재 전체 페이지가 15페이지일때, max는 15페이지로 조정
		// nextPage는 16페이지어야 하지만 16페이지 는 없으므로 nextPage를 15페이지로 조정
	}
	
	
}
