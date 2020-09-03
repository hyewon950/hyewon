package org.kh.camp.mycamp.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.camp.mycamp.domain.MyCamp;
import org.kh.camp.mycamp.domain.MyCampComment;
import org.kh.camp.mycamp.domain.MyCampFile;
import org.kh.camp.mycamp.domain.MyCampLike;
import org.kh.camp.mycamp.domain.MyCampPageInfo;
import org.kh.camp.mycamp.domain.MyCampSearch;
import org.springframework.web.multipart.MultipartFile;



public interface MyCampService {

	/** 나만의 캠핑 top리스트 조회 서비스
	 *
	 * @param
	 * @return topList
	 */
	//나만의 캠핑 댓글 내용 조회
	public abstract ArrayList<MyCamp> selectTopMyCamp();

	 /**
	 *	나만의 캠핑 전체 조회 서비스
	 * @param mycpi
	 * @return list
	 * 
	 */
	// 나만의 캠핑 게시판 전체 조회
	public abstract ArrayList<MyCamp> selectMyCamp(MyCampPageInfo mycpi);
	
	 /**
		 *	나만의 캠핑 파일 전체 조회 서비스
		 * @param 
		 * @return list
		 * 
		 */
		// 나만의 캠핑 파일 전체 조회
		public abstract ArrayList<MyCampFile> selectAllMyCampFile();
	
	/**
	 * 게시판 전체 수 조회 
	 * 
	 */
	public abstract int getMyCampListCount();

	
	
	/** 나만의 캠핑 상세조회용 서비스
	 * @param mId
	 * @return 
	 */
	// 나만의 캠핑 게시판 세부 내용조회(멤버넣고)
	/*public abstract MyCamp selectOneMyCamp(int mId);*/
	
	/** 나만의 캠핑 상세조회용 서비스
	 * @param mycNo
	 * @return 
	 */
	// 나만의 캠핑 게시판 세부 내용조회
	public abstract MyCamp selectOneMyCamp(int mycNo);

	/**
	 * 3_1. 게시판 상세 조회시 조회수 증가
	 * 
	 * @param mycNo
	 * @return result
	 */
	public abstract int listViewCount(int mycNo);
	
	/** 나만의 캠핑 등록 서비스
	 * @param myCamp
	 * @return result
	 */
	//나만의 캠핑 게시글 쓰기
	public abstract int insertMyCampBoard(MyCamp myCamp, HttpServletRequest request);

	/** 나만의 캠핑 수정용 서비스
	 * @param myCamp
	 * @return result
	 */
	//나만의 캠핑 글 수정
	public abstract int updateMyCampBoard(MyCamp myCamp);

	/** 나만의 캠핑 삭제용 서비스
	 * @param mycNo
	 * @return result
	 */
	//나만의 캠핑 글 삭제
	public abstract int deleteMyCampBoard(int mycNo);
	
	/** 나만의 캠핑 검색용 서비스 (지도 검색)
	 * @param mycSearch
	 * @return searchMyCampList
	 */
	//나만의 캠핑 글 검색(전체 검색)
	public abstract ArrayList<MyCamp> searchMyCampMapList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch);
	
	/**
	 * 검색 한 게시판 수 조회 (지도 검색)
	 * 
	 */
	public int getMyCampSearchMapListCount(MyCampSearch mycSearch);
	
	/** 나만의 캠핑 검색용 서비스 (전체 검색)
	 * @param mycSearch
	 * @return searchMyCampList
	 */
	//나만의 캠핑 글 검색(전체 검색)
	public abstract ArrayList<MyCamp> searchMyCampAList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch);
	
	/**
	 * 검색 한 게시판 수 조회 (전체 검색)
	 * 
	 */
	public int getMyCampSearchAListCount(MyCampSearch mycSearch);

	/** 나만의 캠핑 검색용 서비스 (제목 검색)
	 * @param mycSearch
	 * @return searchMyCampList
	 */
	//나만의 캠핑 글 검색(제목 검색)
	public abstract ArrayList<MyCamp> searchMyCampList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch);
	
	/**
	 * 검색 한 게시판 수 조회 (제목 검색)
	 * 
	 */
	public int getMyCampSearchListCount(MyCampSearch mycSearch);
	
	/** 나만의 캠핑 검색용 서비스 (내용 검색)
	 * @param mycSearch
	 * @return searchMyCampList
	 */
	//나만의 캠핑 글 검색(내용 검색)
	public abstract ArrayList<MyCamp> searchMyCampDList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch);
	
	/**
	 * 검색 한 게시판 수 조회 (내용 검색)
	 * 
	 */
	public int getMyCampSearchDListCount(MyCampSearch mycSearch);
	
	/**
	 * 검색 한 게시판 수 조회 (태그 검색)
	 * 
	 */
	public int getMyCampSearchTListCount(MyCampSearch mycSearch);
	
	/** 나만의 캠핑 태그 검색용 서비스 
	 * @param mycSearch
	 * @return searchMyCampList
	 */
	//나만의 캠핑 글 검색
	public abstract ArrayList<MyCamp> searchMyCampTagList(MyCampPageInfo mycsearchpi,MyCampSearch mycSearch);
	
	
	//나만의 캠핑 댓글 메소드 (myCampComment)

	
	/** 나만의 캠핑 댓글 전체 조회 서비스
	 *
	 * @param mycNo
	 * @return commentList
	 */
	//나만의 캠핑 댓글 내용 조회
	public abstract ArrayList<MyCampComment> selectMyCampComment(int mycNo);

	/** 나만의 캠핑 댓글 등록 서비스
	 * @param myCampComment
	 * @return result
	 */
	//나만의 캠핑 댓글 쓰기
	public abstract int insertMyCampComment(MyCampComment myCampComment);

	/** 나만의 캠핑 댓글 수정용 서비스
	 * @param myCampComment
	 * @return result
	 */
	//나만의 캠핑 댓글 수정
	public abstract int updateMyCampComment(MyCampComment myCampComment);

	/** 나만의 캠핑 댓글 삭제용 서비스
	 * @param mycCommentNo
	 * @return result
	 */
	//나만의 캠핑 댓글 삭제
	public abstract int deleteMyCampComment(int mycCommentNo);

	
	//=====좋아요
	
	/** 나만의 캠핑 좋아요 갯수 조회용 서비스
	 * @param myCampLike
	 * @return result
	 */
	//좋아요 갯수조회
	//public abstract int getMyCampLike(MyCampLike myCampLike);
	
	/** 나만의 캠핑 좋아요 취소용 서비스
	 * @param myCampLike
	 * @return result
	 */
	//좋아요 취소
	//public abstract int deleteMyCampLike(MyCampLike myCampLike);
	
	/** 나만의 캠핑 좋아요 신청용 서비스
	 * @param myCampLike
	 * @return result
	 */
	//좋아요 신청
	//public abstract int insertMyCampLike(MyCampLike myCampLike);
	//-----------------------------------------------------------------------------
	
	/** 나만의 캠핑 좋아요 테이블 조회용 서비스
	 * @param mycNo
	 * @return likeList
	 */
	public abstract MyCampLike selectMyCampLike(int mycNo);
	
	/** 나만의 캠핑 좋아요 갯수 조회용 서비스
	 * @param myCampLike
	 * @return result
	 */
	//좋아요 갯수조회
	public abstract int getMyCampLike(MyCampLike myCampLike);
	
	/** 나만의 캠핑 좋아요 취소용 서비스
	 * @param myCampLike
	 * @return result
	 */
	//좋아요 취소 updateMyCampLikecnt
	public abstract void updateMyCampLikecnt(MyCampLike myCampLike);
	//public abstract void deleteMyCampLike(MyCampLike myCampLike);
	
	/** 나만의 캠핑 좋아요 신청용 서비스
	 * @param myCampLike
	 * @return result
	 */
	//좋아요 신청
	public abstract void insertMyCampLike(MyCampLike myCampLike);

	
	//===============나만의 캠핑 파일
	
	/** 나만의 캠핑 파일 조회 서비스
	 *
	 * @param mycFileNo
	 * @return fileList
	 */
	//나만의 캠핑 댓글 내용 조회
	public abstract ArrayList<MyCampFile> selectMyCampFile(int mycFileNo);
	
	
	/** 나만의 캠핑 파일 등록 서비스
	 * @param myCampFile
	 * @return result
	 */
	//나만의 캠핑 파일 
	public abstract int insertMyCampFile(MyCampFile myCampFile, HttpServletRequest request);
	
	
	/** 나만의 캠핑 파일 삭제용 서비스
	 * @param mycFileNo
	 * @return result
	 */
	//나만의 캠핑 파일 삭제
	public abstract int deleteMyCampFile(int mycNo);
	
	/** 나만의 캠핑 파일 업뎃용 서비스
	 * @param mycFileNo
	 * @return result
	 */
	//나만의 캠핑 파일 업뎃
	public abstract int updateMyCampFile(MyCampFile myCampFile,int mycNo,HttpServletRequest request);

}
