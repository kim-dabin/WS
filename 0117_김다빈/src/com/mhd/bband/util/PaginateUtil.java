package com.mhd.bband.util;

public class PaginateUtil {
	public static String paginate(int now, int total, int numPage, int numBlock, String url, String param) {
		/*
		 * now: 현재 페이지 total: 전체 게시물 수 numPage: 한 페이지당 보여질 게시물 수 
		 * numBlock: 한 페이지에 보여질 페이징 블록의 갯수(?) url: 주소 param:파라미터
		 * */
		int totalPage= (int)Math.ceil((double)total/numPage);//전체 페이지
		int nowBlock = (int)Math.ceil((double)now/numBlock);//현재 블록
		String paging = "";//페이지뷰 html요소
		if(total>0) {//게시물이 있을 시에
			paging = "<div class='paginate'>";
			
			/*이전 버튼*/
			if(now<=1) { //클릭한 페이징 블록이 맨 처음일때
				//이전버튼은 비활성화됨
				paging+="<span title='이전 페이지 없음' class='prev'><span>이전</span></span><!-- -->";
			}else {
				//이전버튼 활성화
				paging+="<a href='"+url+"?"+param+(now-1) +"' class='prev' "
						+ "title='"+(now-1)+"'><span>이전</span></a>";
			}
			
			/*출력될 페이징 블록들*/
			for(int i=1; i<=numBlock; i++) {
				//출력될 실제 페이지
				int realPage =(nowBlock-1)*numBlock+i;
				System.out.println("realPage: "+realPage);
				if(realPage==now) {
					//현재 페이지
					paging+="<strong title='현재페이지'>"+now+"</strong>";
				}else {
					//현재 페이지 아닐 때
					paging+="<a href='"+url+"?"+param+realPage+"' title='"+realPage+"'>"+realPage+"</a>";
				}//if~else end
				if(realPage==totalPage) {//페이지가 총페이지 수와 같을 때
					break;
				}//if end
			}//for end
			
			/*다음 버튼*/
			if(now>=totalPage) {
				paging+="<span class='next'><span>다음</span></span>";
			}else {
				paging+="<a href='"+url+"?"+param+(now+1)+"' title='"+(now+1)+"페이지'" + 
						"class='next'><span>다음</span></a>";
			}//if~else
			
			paging+="</div>";
		}//if end
		
		
		return paging;
	}//paginate end

}
