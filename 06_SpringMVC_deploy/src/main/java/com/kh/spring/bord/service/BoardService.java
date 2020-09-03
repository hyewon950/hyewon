package com.kh.spring.bord.service;

import java.util.ArrayList;

import com.kh.spring.bord.domain.Board;
import com.kh.spring.bord.domain.PageInfo;
import com.kh.spring.bord.domain.Reply;

public interface BoardService {

	/**
	 *	1_1. 게시판 전체 수 조회 
	 * 
	 */
	public int getListCount();

	public ArrayList<Board> selectList(PageInfo pi);

	/**
	 * 2. 게시판 등록
	 * 
	 * @param b
	 * @return result
	 */
	public int insertBoard(Board b);

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

	/**
	 * 4. 게시판 수정 
	 * 
	 * @param b
	 * @return result
	 */
	public int updateBoard(Board b);

	/**
	 * 5. 게시판 삭제
	 * 
	 * @param bId
	 * @return result
	 */
	public int deleteBoard(int bId);

	public ArrayList<Reply> selectReplyList(int bId);
	
	public int insertReply(Reply r);
}
