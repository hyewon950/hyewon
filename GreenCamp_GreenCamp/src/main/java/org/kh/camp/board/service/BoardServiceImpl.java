package org.kh.camp.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.camp.board.domain.Board;
import org.kh.camp.board.domain.BoardComment;

import org.kh.camp.board.domain.BoardSearch;
import org.kh.camp.board.domain.OrderCondition;
import org.kh.camp.board.domain.PageInfo;
import org.kh.camp.board.store.BoardStoreLogic;
import org.kh.camp.files.domain.Files;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service("bService")
public class BoardServiceImpl implements BoardService{

	
	/*	@Override
	public int getDListCount(String bType) {
		return bStore.getDListCount(bType);
	}*/
	
/*	@Override
	public ArrayList<Board> selectDList(PageInfo pi, String bType) {
		return bStore.selectDList(pi, bType);
	}*/
	
	/*	@Override
	public Board selectDBoard(int bNo) {
		return bStore.selectDBoard(bNo);
	}*/
	
	@Autowired
	private BoardStoreLogic bStore;
	
	@Override
	public int getListCount(String bType) {
		return bStore.getListCount(bType);
	}
	
	@Override
	public ArrayList<Board> selectList(PageInfo pi, String bType) {
		return bStore.selectList(pi, bType);
	}
	
	@Override
	public Board selectBoard(int bNo) {
		return bStore.selectBoard(bNo);
	}
	

/*	@Override
	public int insertBoard(Board board, HttpServletRequest requestH) {
		board.setbDetail(board.getbDetail().replace("\n", "<br>"));
		return bStore.insertBoard(board);
	}*/

	@Override
	public int addReadCount(int bNo) {
		return bStore.addReadCount(bNo);
	}


	@Override
	public int updateBoard(Board board) {
		return bStore.updateBoard(board);
	}

	@Override
	public int deleteBoard(int bNo) {
		return bStore.deleteBoard(bNo);
	}

	@Override
	public ArrayList<BoardComment> selectBoardCommentList(int bNo) {
		return bStore.selectBoardCommentList(bNo);
	}

	@Override 
	public int insertBoardComment(BoardComment bc) {
		return bStore.insertBoardComment(bc);
	}

	@Override
	public ArrayList<Board> searchList(BoardSearch boardSearch) {
		return bStore.searchList(boardSearch);
	}

	@Override
	public int addLike(int bNo) {
		// TODO Auto-generated method stub
		return bStore.addLike(bNo);
	}

/*	@Override
	public ArrayList<Board> TypeList(PageInfo pi, OrderCondition od) {
		return bStore.TypeList(pi, od);
	}*/

	@Override
	public int deleteComment(int commentNo) {
		return bStore.deleteComment(commentNo);
	}

	@Override
	public int updateComment(int commentNo, String modifyComment) {
		return bStore.updateComment(commentNo, modifyComment);
	}

	@Override
	public int selectBoardLatestNo(String mId) {
		return bStore.selectBoardLatestNo(mId);
	}


	@Override
	public int insertboard(Board board, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return bStore.insertBoard(board);
	}

	@Override
	public Board selectOneBoard(int bNo) {
		return bStore.selectOneBoard(bNo);
	}

}
