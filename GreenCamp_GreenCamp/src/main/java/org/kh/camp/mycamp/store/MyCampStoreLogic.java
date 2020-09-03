package org.kh.camp.mycamp.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.camp.mycamp.domain.MyCamp;
import org.kh.camp.mycamp.domain.MyCampComment;
import org.kh.camp.mycamp.domain.MyCampFile;
import org.kh.camp.mycamp.domain.MyCampLike;
import org.kh.camp.mycamp.domain.MyCampPageInfo;
import org.kh.camp.mycamp.domain.MyCampSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("mycStore")
public class MyCampStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 나만의 캠핑 top 리스트 조회
			public ArrayList<MyCamp> selectTopMyCamp() {
				ArrayList<MyCamp> topList = new ArrayList<>();

				return (ArrayList) sqlSession.selectList("myCampMapper.selectTopList");
			}

	
	// 페이징 처리를 위한 게시글 카운트
	public int getMyCampListCount() {
		return sqlSession.selectOne("myCampMapper.getListCount");
	}

	// 나만의 캠핑 게시판 전체 조회
	public ArrayList<MyCamp> selectMycamp(MyCampPageInfo mycpi) {
		int offset = (mycpi.getMycCurrentPage() - 1) * mycpi.getMycBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, mycpi.getMycBoardLimit());

		return (ArrayList) sqlSession.selectList("myCampMapper.selectList", null, rowBounds);
	}

	// 나만의 캠핑 게시판 전체 조회
	public ArrayList<MyCampFile> selectAllMyCampFile() {
		return (ArrayList) sqlSession.selectList("myCampMapper.selectAllFileList");
	}

	// 나만의 캠핑 게시판 태그 조회
	public ArrayList<MyCamp> searchMyCampTagList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
		int offset = (mycsearchpi.getMycCurrentPage() - 1) * mycsearchpi.getMycBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, mycsearchpi.getMycBoardLimit());

		return (ArrayList) sqlSession.selectList("myCampMapper.selectTagList", mycSearch, rowBounds);
	}

	// 페이징 처리를 위한 게시글 카운트(태그)
	public int getMyCampSearchTListCount(MyCampSearch mycSearch) {
		return sqlSession.selectOne("myCampMapper.getSearchTListCount", mycSearch);
	}
	
	// 나만의 캠핑장 검색 (지도)
		public ArrayList<MyCamp> searchMyCampMapList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
			int offset = (mycsearchpi.getMycCurrentPage() - 1) * mycsearchpi.getMycBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, mycsearchpi.getMycBoardLimit());

			return (ArrayList) sqlSession.selectList("myCampMapper.searchMapList", mycSearch, rowBounds);
		}

		// 페이징 처리를 위한 게시글 카운트(지도)
		public int getMyCampSearchMapListCount(MyCampSearch mycSearch) {
			return sqlSession.selectOne("myCampMapper.getSearchMapListCount", mycSearch);
		}

	// 나만의 캠핑장 검색 (전체)
	public ArrayList<MyCamp> searchMyCampAList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
		int offset = (mycsearchpi.getMycCurrentPage() - 1) * mycsearchpi.getMycBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, mycsearchpi.getMycBoardLimit());

		return (ArrayList) sqlSession.selectList("myCampMapper.searchList", mycSearch, rowBounds);
	}

	// 페이징 처리를 위한 게시글 카운트(전체)
	public int getMyCampSearchAListCount(MyCampSearch mycSearch) {
		return sqlSession.selectOne("myCampMapper.getSearchAListCount", mycSearch);
	}

	// 나만의 캠핑장 검색 (제목)
	public ArrayList<MyCamp> searchMyCampList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
		int offset = (mycsearchpi.getMycCurrentPage() - 1) * mycsearchpi.getMycBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, mycsearchpi.getMycBoardLimit());

		return (ArrayList) sqlSession.selectList("myCampMapper.searchList", mycSearch, rowBounds);
	}

	// 페이징 처리를 위한 게시글 카운트(제목)
	public int getMyCampSearchListCount(MyCampSearch mycSearch) {
		return sqlSession.selectOne("myCampMapper.getSearchListCount", mycSearch);
	}

	// 나만의 캠핑장 검색 (내용)
	public ArrayList<MyCamp> searchMyCampDList(MyCampPageInfo mycsearchpi, MyCampSearch mycSearch) {
		int offset = (mycsearchpi.getMycCurrentPage() - 1) * mycsearchpi.getMycBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, mycsearchpi.getMycBoardLimit());

		return (ArrayList) sqlSession.selectList("myCampMapper.searchList", mycSearch, rowBounds);
	}

	// 페이징 처리를 위한 게시글 카운트(내용)
	public int getMyCampSearchDListCount(MyCampSearch mycSearch) {
		return sqlSession.selectOne("myCampMapper.getSearchDListCount", mycSearch);
	}

	// 나만의 캠핑 게시판 세부 내용조회 (멤버넣고)
	/*
	 * public MyCamp selectOneMyCamp(int mId) { return
	 * sqlSession.selectOne("myCampMapper.selectOne", mId); }
	 */

	// 나만의 캠핑 게시판 세부 내용조회
	public MyCamp selectOneMyCamp(int mycNo) {
		return sqlSession.selectOne("myCampMapper.selectOne", mycNo);
	}

	// 조회수 증가 listViewCount
	public int listViewCount(int mycNo) {
		return sqlSession.update("myCampMapper.updateCount", mycNo);
	}

	// 나만의 캠핑 게시글 쓰기
	public int insertMyCampBoard(MyCamp myCamp) {
		return sqlSession.insert("myCampMapper.insertMyCamp", myCamp);
	}

	// 나만의 캠핑 글 수정
	public int updateMyCampBoard(MyCamp myCamp) {
		return sqlSession.update("myCampMapper.updateMyCamp", myCamp);
	}

	// 나만의 캠핑 글 삭제
	public int deleteMyCampBoard(int mycNo) {
		// return sqlSession.delete("myCampMapper.deleteMyCamp", mId);
		return sqlSession.delete("myCampMapper.deleteMyCamp", mycNo);
	}

	// 나만의 캠핑 댓글

	// 나만의 캠핑 댓글 내용 조회
	public ArrayList<MyCampComment> selectMyCampComment(int mycNo) {
		ArrayList<MyCampComment> commentList = new ArrayList<>();

		return (ArrayList) sqlSession.selectList("myCampMapper.selectCommentList", mycNo);
	}

	// 나만의 캠핑 댓글 쓰기
	public int insertMyCampComment(MyCampComment myCampComment) {
		return sqlSession.insert("myCampMapper.insertComment", myCampComment);
	}

	// 나만의 캠핑 댓글 수정
	public int updateMyCampComment(MyCampComment myCampComment) {
		// return SqlSession.update("myCampCommentMapper.updateMyCampComment",
		// myCampComment);
		return sqlSession.update("myCampMapper.updateComment", myCampComment);
	}

	// 나만의 캠핑 댓글 삭제
	public int deleteMyCampComment(int mycCommentNo) {
		// return SqlSession.delete("myCampCommentMapper.deleteMyCampComment", mId);
		return sqlSession.delete("myCampMapper.deleteComment", mycCommentNo);
	}

	// =====나만의 캠핑 좋아요

	// 좋아요 조회
	/*
	 * public int getMyCampLike(MyCampLike myCampLike) { return
	 * sqlSession.selectOne("myCampMapper.getBoardLike",myCampLike); }
	 */

	// 좋아요 등록
	/*
	 * public int insertMyCampLike(MyCampLike myCampLike) { return
	 * sqlSession.insert("myCampMapper.createBoardLike",myCampLike); }
	 */

	// 좋아요 취소
	/*
	 * public int deleteMyCampLike(MyCampLike myCampLike) { return
	 * sqlSession.delete("myCampMapper.deleteBoardLike",myCampLike); }
	 */

	/*
	 * public int updateBoardLike(int boardId) { return
	 * sqlSession.update("myCampMapper.updateBoardLike",boardId); }
	 */

	// =====나만의 캠핑 좋아요

	// 좋아요 전체조회
	public MyCampLike selectMyCampLike(int mycNo) {
		return sqlSession.selectOne("myCampMapper.selectMyCampLike", mycNo);
	}

	// 좋아요 조회
	public int getMyCampLike(MyCampLike myCampLike) {
		return sqlSession.selectOne("myCampMapper.getMyCampLike", myCampLike);
	}

	// 좋아요 등록
	public int insertMyCampLike(MyCampLike myCampLike) {
		return sqlSession.insert("myCampMapper.insertMyCampLike", myCampLike);
	}

	// 좋아요 취소 updateMyCampLikecnt
	/*
	 * public int deleteMyCampLike(MyCampLike myCampLike) { return
	 * sqlSession.delete("myCampMapper.deleteMyCampLike",myCampLike); }
	 */
	public int updateMyCampLikecnt(MyCampLike myCampLike) {
		return sqlSession.delete("myCampMapper.updateMyCampLikecnt", myCampLike);
	}

	// 좋아요 업데이트
	public int updateMyCampLike(int mycNo) {
		return sqlSession.update("myCampMapper.updateMyCampLike", mycNo);
	}

	// =============나만의 캠핑 파일

	// 파일 조회 selectMyCampFile
	public ArrayList<MyCampFile> selectMyCampFile(int mycNo) {
		ArrayList<MyCampFile> fileList = new ArrayList<>();

		return (ArrayList) sqlSession.selectList("myCampMapper.selectFileList", mycNo);
	}

	// 나만의 캠핑 파일 입력
	public int insertMyCampFile(MyCampFile myCampFile) {
		return sqlSession.insert("myCampMapper.insertFile", myCampFile);
	}

	// 파일 삭제
	public int deleteMyCampFile(int mycFileNo) {
		// return SqlSession.delete("myCampCommentMapper.deleteMyCampComment", mId);
		return sqlSession.delete("myCampMapper.deleteFile", mycFileNo);
	}

	// 파일 업뎃 updateMyCampFile
	public int updateMyCampFile(MyCampFile myCampFile, int mycNo) {
		// return SqlSession.delete("myCampCommentMapper.deleteMyCampComment", mId);
		System.out.println("인써트 온 mycNo : " + mycNo);
		return sqlSession.insert("myCampMapper.updateFile", myCampFile);
	}
}
