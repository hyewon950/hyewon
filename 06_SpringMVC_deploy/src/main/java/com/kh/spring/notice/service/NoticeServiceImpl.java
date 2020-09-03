package com.kh.spring.notice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.notice.domain.Notice;
import com.kh.spring.notice.domain.Search;
import com.kh.spring.notice.store.NoticeStoreLogic;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeStoreLogic nStore;
	
	@Override
	public ArrayList<Notice> selectList() {
		return nStore.selectList();
	}

	@Override
	public int insertNotice(Notice notice, MultipartFile file, HttpServletRequest request) {
		//Textarea의 개행 문자를 <br>로 변경
		notice.setnContent(notice.getnContent().replace("\n","<br>"));
		
		return nStore.insertNotice(notice);
	}

	@Override
	public Notice selectOne(int nId) {
		return nStore.selectOne(nId);
	}

	@Override
	public int updateNotice(Notice notice) {
		//textarea의 개행문자를 <br>로 변경
		notice.setnContent(notice.getnContent().replace("\n", "<br>"));
		return nStore.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int nId) {
		
		return nStore.deleteNotice(nId);
	}

	@Override
	public ArrayList<Notice> searchList(Search search) {
		return nStore.searchList(search);
	}

	
	
}
