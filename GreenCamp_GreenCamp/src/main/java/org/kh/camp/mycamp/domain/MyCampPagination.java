package org.kh.camp.mycamp.domain;



public class MyCampPagination {

	//PageInfo 객체를 리턴해주는 static메소드 추가
		//PageInfo라는 클래스는 페이징 처리에 필요한 데이터를 담는 믈래수
		//클래스가 계속 생성이 되면 정보들이 초기화 되기 떄문에
		//한번만 생성하여 정보를 저장할 수 있도록 해야함 ex) db connection
		public static MyCampPageInfo getPageInfo(int mycCurrentPage, int mycListCount) {
			//페이지 정보를 담아줄 PafeInfo 참조변수 선언
			MyCampPageInfo mycpi = null;
			
			// currentPage와 listCount가 넘어온 상태기 때문에 
			//페이징 처리에 필요한 나머지 변수만 선언
			int mycPageLimit =5; //한 페이지에서 보여질 페이징 수
			int mycMaxPage; 		// 전체 페이징 수 중 가장 마지막 페이지
			int mycStartPage;		// 현재 페이지에서 보여질 페이징 버튼의 시작 페이지
			int mycEndPage;		// 현제 페이지에서 보여질 페이징 버튼의 끝 페이지
			
			int mycBoardLimit = 6; // 한 페이지에 보여질 게시글 갯수
			
			// * maxPage -총 페이지수
			//목록수가 123개이면 페이지수는 13페이지
			//짜투리 목록이 최소 1개일때, 1page로 처리하기위해 0.9를 더함
			mycMaxPage = (int)((double)mycListCount/mycBoardLimit+0.9); // 15/5=3+0.9=3.9 ->int니까 결론은 3(maxPage)
			
			//*startPage-현재페이지에 보여질 시작페이지 수
			//1, 11, 21, 31
			mycStartPage =(((int)((double)mycCurrentPage / mycPageLimit + 0.9))-1) *mycPageLimit+1;
			//1 2 3 4 5 6 7 8 9 10 ->1누르면
			//11 12 13 14 15 16 17 18 19 20 ->11누르면
			
			//* endPage - 현재페이지에서 보여질 마지막 페이지 수
			// 10, 20, 30
			mycEndPage = mycStartPage + mycPageLimit -1;
			
			// 123개의 게시물이 있음, 10개씩 보여진다고 했을 경우, 페이지 수 13
			// [이전] 1(startPage) 2 3 4 5 6 7 8 9 10(endPage) [다음]
			// [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 으로 만들어주는게 startPage와 endPage의 역할
			
			if(mycMaxPage < mycEndPage) {
				//maxPage값 지정
				mycEndPage = mycMaxPage;
			}
			
			mycpi = new MyCampPageInfo(mycCurrentPage, mycListCount, mycPageLimit, mycMaxPage, mycStartPage, mycEndPage, mycBoardLimit);
			
			return mycpi; 
			
		}
}
