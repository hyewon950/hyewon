package org.kh.camp.mycamp.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.camp.mycamp.domain.MyCamp;
import org.kh.camp.mycamp.domain.MyCampComment;
import org.kh.camp.mycamp.domain.MyCampFile;
import org.kh.camp.mycamp.domain.MyCampLike;
import org.kh.camp.mycamp.domain.MyCampPageInfo;
import org.kh.camp.mycamp.domain.MyCampSearch;
import org.kh.camp.mycamp.store.MyCampStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("mycService")
public class MyCampServiceImpl implements MyCampService {

	@Autowired
	private MyCampStoreLogic mycStore;

	// top리스트 조회
			@Override
			public ArrayList<MyCamp> selectTopMyCamp() {
				// TODO Auto-generated method stub
				return mycStore.selectTopMyCamp();
			}

	// 전체 리스트 조회
	@Override
	public ArrayList<MyCamp> selectMyCamp(MyCampPageInfo mycpi) {
		// TODO Auto-generated method stub
		return mycStore.selectMycamp(mycpi);
	}

	// 페이지 데이타처리(전체리스트 꼭필요함 반드시!)
	@Override
	public int getMyCampListCount() {
		// TODO Auto-generated method stub
		return mycStore.getMyCampListCount();
	}

	// 파일 전체 리스트 조회
	@Override
	public ArrayList<MyCampFile> selectAllMyCampFile() {
		// TODO Auto-generated method stub
		return mycStore.selectAllMyCampFile();
	}
	
	// 게시글 검색 조회(지도)
			@Override
			public ArrayList<MyCamp> searchMyCampMapList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
				// TODO Auto-generated method stub
				return mycStore.searchMyCampMapList(mycsearchpi, mycSearch);
			}
		
			// 페이지 데이타처리(지도)
			@Override
			public int getMyCampSearchMapListCount(MyCampSearch mycSearch) {
				// TODO Auto-generated method stub
				return mycStore.getMyCampSearchMapListCount(mycSearch);
			}

	// 게시글 검색 조회(전체)
		@Override
		public ArrayList<MyCamp> searchMyCampAList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
			// TODO Auto-generated method stub
			return mycStore.searchMyCampAList(mycsearchpi, mycSearch);
		}
	
		// 페이지 데이타처리(전체)
		@Override
		public int getMyCampSearchAListCount(MyCampSearch mycSearch) {
			// TODO Auto-generated method stub
			return mycStore.getMyCampSearchAListCount(mycSearch);
		}
		
	// 게시글 검색 조회(제목)
	@Override
	public ArrayList<MyCamp> searchMyCampList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
		// TODO Auto-generated method stub
		return mycStore.searchMyCampList(mycsearchpi, mycSearch);
	}

	// 페이지 데이타처리(제목)
	@Override
	public int getMyCampSearchListCount(MyCampSearch mycSearch) {
		// TODO Auto-generated method stub
		return mycStore.getMyCampSearchListCount(mycSearch);
	}

	// 게시글 검색 조회(내용)
	@Override
	public ArrayList<MyCamp> searchMyCampDList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
		// TODO Auto-generated method stub
		return mycStore.searchMyCampDList(mycsearchpi, mycSearch);
	}

	// 페이지 데이타처리(내용)
	@Override
	public int getMyCampSearchDListCount(MyCampSearch mycSearch) {
		// TODO Auto-generated method stub
		return mycStore.getMyCampSearchDListCount(mycSearch);
	}

	// 태그 검색 조회
	@Override
	public ArrayList<MyCamp> searchMyCampTagList(MyCampPageInfo mycsearchpi,MyCampSearch mycSearch) {
		// TODO Auto-generated method stub
		return mycStore.searchMyCampTagList(mycsearchpi,mycSearch);
	}
	
	// 페이지 데이타처리(태그)
		@Override
		public int getMyCampSearchTListCount(MyCampSearch mycSearch) {
			// TODO Auto-generated method stub
			return mycStore.getMyCampSearchTListCount(mycSearch);
		}

	// 나만의 캠핑 상세조회 (멤버넣고)
	/*
	 * @Override public MyCamp selectOneMyCamp(int mId) { // TODO Auto-generated
	 * method stub return mycStore.selectOneMyCamp(mId); }
	 */

	// 나만의 캠핑 상세조회
	@Override
	public MyCamp selectOneMyCamp(int mycNo) {
		// TODO Auto-generated method stub
		return mycStore.selectOneMyCamp(mycNo);
	}

	// 조회수 증가
	@Override
	public int listViewCount(int mycNo) {
		// TODO Auto-generated method stub
		return mycStore.listViewCount(mycNo);
	}

	// 게시글 등록
	@Override
	public int insertMyCampBoard(MyCamp myCamp, HttpServletRequest request) {
		// TODO Auto-generated method stub
		myCamp.setMycDetail(myCamp.getMycDetail().replace("\n", "<br>"));
		return mycStore.insertMyCampBoard(myCamp);
	}

	// 게시글 수정
	@Override
	public int updateMyCampBoard(MyCamp myCamp) {
		// TODO Auto-generated method stub
		myCamp.setMycDetail(myCamp.getMycDetail().replace("\n", "<br>"));
		return mycStore.updateMyCampBoard(myCamp);
	}

	// 게시글 삭제
	@Override
	public int deleteMyCampBoard(int mycNo) {
		// TODO Auto-generated method stub
		return mycStore.deleteMyCampBoard(mycNo);
	}

	// 댓글~~~~~~~~~

	// 댓글 조회
	@Override
	public ArrayList<MyCampComment> selectMyCampComment(int mycNo) {
		// TODO Auto-generated method stub
		return mycStore.selectMyCampComment(mycNo);
	}

	// 댓글 작성
	@Override
	public int insertMyCampComment(MyCampComment myCampComment) {
		// TODO Auto-generated method stub
		return mycStore.insertMyCampComment(myCampComment);
	}

	// 댓글 수정
	@Override
	public int updateMyCampComment(MyCampComment myCampComment) {
		// TODO Auto-generated method stub
		System.out.println(myCampComment + "하핳");
		return mycStore.updateMyCampComment(myCampComment);
	}

	// 댓글 삭제
	@Override
	public int deleteMyCampComment(int mycCommentNo) {
		// TODO Auto-generated method stub
		return mycStore.deleteMyCampComment(mycCommentNo);
	}

	// ===========좋아요===========

	// 좋아요 갯수조회
	/*
	 * public int getMyCampLike(MyCampLike myCampLike) { return
	 * mycStore.getMyCampLike(myCampLike); }
	 */

	// 좋아요 취소
	/*
	 * @Override public int deleteMyCampLike(MyCampLike myCampLike) { return
	 * mycStore.deleteMyCampLike(myCampLike); //return
	 * mycStore.updateBoardLike(myCampLike.getMycNo()); }
	 */
	/*
	 * public int deleteMyCampLike(MyCampComment myCampLike) { return
	 * mycStore.deleteMyCampLike(myCampLike); }
	 */

	// 좋아요 신청
	/*
	 * @Override public int insertMyCampLike(MyCampLike myCampLike) { return
	 * mycStore.insertMyCampLike(myCampLike); }
	 */

	// 좋아요 전체 조회
	public MyCampLike selectMyCampLike(int mycNo) {
		return mycStore.selectMyCampLike(mycNo);
	}

	// 좋아요 갯수조회
	public int getMyCampLike(MyCampLike myCampLike) {
		System.out.println(myCampLike);
		return mycStore.getMyCampLike(myCampLike);
	}

	// 좋아요 취소 updateMyCampLikecnt
	@Override
	/*
	 * public void deleteMyCampLike(MyCampLike myCampLike) {
	 * mycStore.deleteMyCampLike(myCampLike);
	 * mycStore.updateMyCampLike(myCampLike.getMycNo()); //return
	 * mycStore.updateBoardLike(myCampLike.getMycNo()); }
	 */
	public void updateMyCampLikecnt(MyCampLike myCampLike) {
		mycStore.updateMyCampLikecnt(myCampLike);
		mycStore.updateMyCampLike(myCampLike.getMycNo());
		// return mycStore.updateBoardLike(myCampLike.getMycNo());
	}

	// 좋아요 신청
	@Override
	public void insertMyCampLike(MyCampLike myCampLike) {
		mycStore.insertMyCampLike(myCampLike);
		mycStore.updateMyCampLike(myCampLike.getMycNo());
	}

	// 파일

	// 파일 조회 selectMyCampFile
	@Override
	public ArrayList<MyCampFile> selectMyCampFile(int mycNo) {
		// TODO Auto-generated method stub
		return mycStore.selectMyCampFile(mycNo);
	}

	// 파일 등록
	@Override
	public int insertMyCampFile(MyCampFile myCampFile, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return mycStore.insertMyCampFile(myCampFile);
	}

	// 파일 삭제 deleteMyCampFile
	@Override
	public int deleteMyCampFile(int mycFileNo) {
		// TODO Auto-generated method stub
		return mycStore.deleteMyCampFile(mycFileNo);
	}

	// 파일 업뎃 updateMyCampFile
	@Override
	public int updateMyCampFile(MyCampFile myCampFile, int mycNo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return mycStore.updateMyCampFile(myCampFile, mycNo);
	}

}
