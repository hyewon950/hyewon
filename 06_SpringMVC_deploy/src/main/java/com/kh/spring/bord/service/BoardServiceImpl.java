package com.kh.spring.bord.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.bord.domain.Board;
import com.kh.spring.bord.domain.PageInfo;
import com.kh.spring.bord.domain.Reply;
import com.kh.spring.bord.store.BoardStoreLogic;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardStoreLogic bStore;
	
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return bStore.getListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bStore.selectList(pi);
	}

	@Override
	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addReadCount(int bId) {
		// TODO Auto-generated method stub
		return bStore.addReadCount(bId);
	}

	@Override
	public Board selectBoard(int bId) {
		// TODO Auto-generated method stub
		return bStore.selectBoard(bId);
	}

	@Override
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int bId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		return bStore.selectReplyList(bId);
	}

	@Override
	public int insertReply(Reply r) {
		return bStore.insertReply(r);
	}

}
