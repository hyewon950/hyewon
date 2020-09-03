package org.kh.camp.camping.service;

import java.util.ArrayList;

import org.kh.camp.camping.domain.CampReview;
import org.kh.camp.camping.domain.Camping;
import org.kh.camp.camping.domain.PageInfo;
import org.kh.camp.camping.domain.Reservation;

public interface CampingService {

	//캠핑장 검색
	public String campingSearch(String name);
	
	//캠핑장 리스트출력
	public ArrayList<Camping> selectCampingList(PageInfo pi);

	//캠핑장리스트 데이터 갯수
	public int getListCount();
	
	
	//한 유저가 한 캠핑장당 쓴 리뷰 개수
	public int sumReview(CampReview cr);
	
	//캠핑장 상세정보
	public Camping selectCampingOne(int nNO);
	

	//캠핑장 예약 하기      
	public int insertReservation(Reservation reservation) ;
	
	// 예약내역에 회원정보조회
	public int selectReservation(Reservation reservation) ;
	
	
	//예약 정보 수정
	public int updateReservation(Reservation res);

	//예약 취소
	public int deleteReservation();
	
	//상세페이지 조회수
	public int addCount(int cNo);
	
	//좋아요 추가 
	public int addLike(int cNo);
	
	//후기 작성
	public int insertReview(CampReview cr);
	
	//댓글 리스트 불러오기
	public  ArrayList<CampReview> selectReivewList(int cNo);
	
	//댓글 수정
	public int updateReview(CampReview cr);
	
	//리뷰 삭제
	public int deleteReview(CampReview cr);
//----------------------------------------	
	//예약삭제 
	//public int deleteReservation(Reservation rs);
	
	//예약한 정보 조회
	public ArrayList<Reservation> selectReservationUser(String mId);
	
	//예약삭제 
	 public int deleteReservation(int resNo);
//-----------------
	//지도로 검색
	public ArrayList<Camping> searchMapRegion(Camping camping);
	
	//지도 검색 결과 갯수 가져옴
	public int countsearchMap(Camping camping);

	//이름으로 검색
	public ArrayList<Camping> campingSearchName(Camping camping,PageInfo pi);

	//이름으로 검색 게시글count
	public int getListCountSearchName(Camping camping);
	
	//위치로 검색
	public ArrayList<Camping> campingSearchAddr(Camping camping,PageInfo pi);
	
	//위치로검색 게시글 count
	public int getListCountSearchAddr(Camping camping);
	
	//메인메뉴에서 좋아요 많은 순서 3개 불러오는 메소드
	public ArrayList<Camping> showMenu();

}
