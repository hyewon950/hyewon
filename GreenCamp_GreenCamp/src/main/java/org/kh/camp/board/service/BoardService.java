package org.kh.camp.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.camp.board.domain.Board;
import org.kh.camp.board.domain.BoardComment;
import org.kh.camp.board.domain.BoardSearch;
import org.kh.camp.board.domain.OrderCondition;
import org.kh.camp.board.domain.PageInfo;
import org.kh.camp.files.domain.Files;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {

	/**
	 *	1_1. 게시판 전체 수 조회 
	 * 
	 */
	public int getListCount(String bType);

/*	public int getDListCount(String bType);*/
	
	
	public ArrayList<Board> selectList(PageInfo pi, String bType);
	
/*	public ArrayList<Board> selectDList(PageInfo pi, String bType);*/

	/**
	 * 2. 게시판 등록
	 * 
	 * @param b
	 * @return result
	 */
	public int insertboard(Board board, HttpServletRequest request);

	/**
	 * 3_1. 게시판 상세 조회시 조회수 증가
	 * 
	 * @param bId
	 * @return result
	 */
	public int addReadCount(int bId);

	/**
	 * 3_2. 게시판 상세 조회
	 * 
	 * @param bId
	 * @return
	 */
	public Board selectBoard(int bId);

/*	public Board selectDBoard(int bId);*/
	/**
	 * 4. 게시판 수정 
	 * 
	 * @param b
	 * @return result
	 */
	public int updateBoard(Board board);

	/**
	 * 5. 게시판 삭제
	 * 
	 * @param bId
	 * @return result
	 */
	public int deleteBoard(int bNo);

	
	/*
	 * 
	 * 6. 게시글 댓글 조회
	 *  @param bId
	 * @return list
	 * 
	 */
	public ArrayList<BoardComment> selectBoardCommentList(int bId);
	
	/*
	 * 
	 * 7. 게시글 댓글 등록
	 * 
	 *  @param r
	 * @return result
	 * 
	 */
	public int insertBoardComment(BoardComment bc);
	
	// 검색
	public ArrayList<Board> searchList(BoardSearch boardSearch);
	
	//상세페이지 좋아요
	public int addLike(int bNo);

/*	public ArrayList<Board> TypeList(PageInfo pi, OrderCondition od);*/
	// 댓글 삭제 
	public int deleteComment(int commentNo);
	// 댓글 수정
	public int updateComment(int commentNo, String modifyComment);
		
	// board 최신 글 번호로 조회
	public int selectBoardLatestNo(String mId);
	
	// 게시글번호로 게시글정보 조회
	public Board selectOneBoard(int bNo);

	
}
