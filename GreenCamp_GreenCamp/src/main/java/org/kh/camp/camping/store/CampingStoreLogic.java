package org.kh.camp.camping.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.camp.camping.domain.CampReview;
import org.kh.camp.camping.domain.Camping;
import org.kh.camp.camping.domain.PageInfo;
import org.kh.camp.camping.domain.Reservation;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("campoingStore")
public class CampingStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
	


	public ArrayList<Camping> selectCampingList(PageInfo pi){
		
		int offset=(pi.getCurrentPage() -1)* pi.getPageLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getPageLimit());
		
	return (ArrayList)sqlSession.selectList("campingMapper.selectCampingList",null,rowBounds);
	}

	public Camping selectCampingOne(int cNo) {
		return sqlSession.selectOne("campingMapper.selectOne",cNo);
	}
	//예약insert
	public int insertReservation(Reservation res) {
		return sqlSession.insert("campingMapper.insertReservation", res);
	}

	public int selectReservation(Reservation reservation) {
		return sqlSession.selectOne("campingMapper.selectReservation",reservation);
	}

	public int updateReservation(Reservation res) {
		return 0;
	}

	//게시글 전체개수 세는 메소드
	public int getListCount() {
		return sqlSession.selectOne("campingMapper.getListCount");
	}
	//하나의 게시글 조회수 증가 메소드
	public int addCount(int cNo) {
		
		return sqlSession.update("campingMapper.addCount",cNo);
	}
	//좋아요
	public int addLike(int cNo) {
		return sqlSession.update("campingMapper.addLike",cNo);
	}
	//리뷰 insert
	public int insertReview(CampReview cv) {
		return sqlSession.insert("campingMapper.insertRivew",cv);
	
	}
	//리뷰 불러오기
	public ArrayList<CampReview> selectReivewList(int cNo) {
		return (ArrayList)sqlSession.selectList("campingMapper.selectreviewList",cNo);
	}
	//리뷰 수정
	public int updateReview(CampReview cr) {
		return sqlSession.update("campingMapper.updateReview",cr);
	}
	//한유저가 한 캠핑장당 작성한 리뷰갯수
	public int sumReview(CampReview cr) {
		return sqlSession.selectOne("campingMapper.sumReview", cr);
	}
	//댓글 삭제 메소드
	public int deleteReview(CampReview cr) {
		return sqlSession.delete("campingMapper.deleteReview", cr);
	}
	//예약 취소 메소드
/*	public int deleteReservation(Reservation rs) {
		return sqlSession.delete("campingMapper.deleteReservation",rs);
	}*/
	
	//예약 취소 메소드
	   public int deleteReservation(int resNo) {
	      return sqlSession.delete("campingMapper.deleteReservation",resNo);
	   }
	   
	//예약정보조회
    public ArrayList<Reservation> selectReservationUser(String mId) {
       return (ArrayList)sqlSession.selectList("campingMapper.selectReservationUser",mId);
    }
	
	//지역을 선택하면 동일지역리스트를 가져옴
	public ArrayList<Camping> searchMapRegion(Camping camping){
		return (ArrayList)sqlSession.selectList("campingMapper.searchRegion",camping);
	}
	//지도검색 결과의 리스트 갯수 가져옴
	public int countsearchMap(Camping camping) {
		return sqlSession.selectOne("campingMapper.countSearchMap",camping);
	}
	
	//이름으로 검색
	public ArrayList<Camping> campingSearchName(Camping camping,PageInfo pi) {
		
		int offset=(pi.getCurrentPage() -1)* pi.getPageLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getPageLimit());
		
		return (ArrayList)sqlSession.selectList("campingMapper.searchName",camping,rowBounds);
	}
	
	//위치로검색
	public ArrayList<Camping> campingSearchAddr(Camping camping,PageInfo pi) {
		
		int offset=(pi.getCurrentPage() -1)* pi.getPageLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getPageLimit());
		
		return (ArrayList)sqlSession.selectList("campingMapper.searchAddr",camping,rowBounds);
	}
	
	//이름으로 검색 게시글 갯수 가져옴
	public int getListCountSearchName(Camping camping) {
	return sqlSession.selectOne("campingMapper.searchcountName",camping);
	}
	
	//주소로 검색하는 게시글 갯수 가져옴
	public int getListCountSearchAddr(Camping camping) {
		return sqlSession.selectOne("campingMapper.searchcountAddr",camping);
	}
	
	//메인메뉴에서 좋아요 갯수 높은 캠핑게시물 가져오는 메소드
	public ArrayList<Camping> showMenu(){
		return (ArrayList)sqlSession.selectList("campingMapper.showmenuLike");
	}
}