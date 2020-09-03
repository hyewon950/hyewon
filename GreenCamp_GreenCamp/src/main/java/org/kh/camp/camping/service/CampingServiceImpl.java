package org.kh.camp.camping.service;

import java.util.ArrayList;

import org.kh.camp.camping.domain.CampReview;
import org.kh.camp.camping.domain.Camping;
import org.kh.camp.camping.domain.PageInfo;
import org.kh.camp.camping.domain.Reservation;
import org.kh.camp.camping.store.CampingStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("campService")
public class CampingServiceImpl implements CampingService{

	@Autowired
	private CampingStoreLogic cStore;
	
	
	
	@Override
	public String campingSearch(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	//캠핑장정보 져오는메소드
	@Override
	public ArrayList<Camping> selectCampingList(PageInfo pi) {
		
		return cStore.selectCampingList(pi);
	}
	//캠핑장 선택시 하나의 정보를 상세페이지로 가져가는 메소드
	@Override
	public Camping selectCampingOne(int cNo) {
		
		return cStore.selectCampingOne(cNo);
	}
	//예약insert하는 메소드
	@Override
	public int insertReservation(Reservation res) {
		return cStore.insertReservation(res);
	}
	//예약자를 확인하는 메소드
	@Override
	public int selectReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return cStore.selectReservation(reservation);
	}
	
	@Override
	public int updateReservation(Reservation res) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservation() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return cStore.getListCount();
	}

	@Override
	public int addCount(int cNo) {

		return cStore.addCount(cNo);
	}

	@Override
	public int addLike(int cNo) {
		// TODO Auto-generated method stub
		return cStore.addLike(cNo);
	}

	@Override
	public int insertReview(CampReview cr) {
		return cStore.insertReview(cr);
	}

	@Override
	public ArrayList<CampReview> selectReivewList(int cNo) {
		return cStore.selectReivewList(cNo);
	}

	@Override
	public int updateReview(CampReview cr) {
		
		return cStore.updateReview(cr);
	}

	//한유저가 한 캠핑장당 작성한 게수
	@Override
	public int sumReview(CampReview cr) {
		// TODO Auto-generated method stub
		return cStore.sumReview(cr);
	}

	//댓글 삭제메소드
	@Override
	public int deleteReview(CampReview cr) {
		// TODO Auto-generated method stub
		return cStore.deleteReview(cr);
	}
	//예약삭제
	/*   @Override
	   public int deleteReservation(int resNo) {
	      return cStore.deleteReservation(resNo);
	   }*/

	
	//지도를 클릭하면 동일 지역을 가져오는 메소드
	@Override
	public ArrayList<Camping> searchMapRegion(Camping camping) {
		return cStore.searchMapRegion(camping);
	}
	//지도 검색 결과의 갯수를 가져옴
	@Override
	public int countsearchMap(Camping camping) {
		
		return cStore.countsearchMap(camping);
	}
	//캠핑장 이름으로검색
	@Override
	public ArrayList<Camping> campingSearchName(Camping camping,PageInfo pi) {
		// TODO Auto-generated method stub
		return cStore.campingSearchName(camping,pi);
	}
	
	//캠핑장 주소로 검색
	@Override
	public ArrayList<Camping> campingSearchAddr(Camping camping,PageInfo pi) {
		// TODO Auto-generated method stub
		return cStore.campingSearchAddr(camping,pi);
	}
	//이름으로 검색 게시글 갯수 가져옴
	@Override
	public int getListCountSearchName(Camping camping) {
		return cStore.getListCountSearchName(camping);
	}
	//주소로 검색 게시글 가져옴
	@Override
	public int getListCountSearchAddr(Camping camping) {
		return cStore.getListCountSearchAddr(camping);
	}
    //예약한 정보 조회
	@Override
	   public ArrayList<Reservation> selectReservationUser(String mId) {
	  
	      return cStore.selectReservationUser(mId);
	   }
	//예약 삭제하는 메소드
	   @Override
	   public int deleteReservation(int resNo) {
	      return cStore.deleteReservation(resNo);
	   }
	   
	//메인메뉴에서 좋아요 갯수 넢은 게시물 불러오는 메소드   
	@Override
	public ArrayList<Camping> showMenu() {
		return cStore.showMenu();
	}

}
