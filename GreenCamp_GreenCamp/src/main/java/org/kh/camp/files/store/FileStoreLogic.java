package org.kh.camp.files.store;

import java.util.ArrayList;

import org.kh.camp.files.domain.Files;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fileStore")
public class FileStoreLogic {
		@Autowired
		private SqlSessionTemplate sqlSession;

		public ArrayList<Files> selectFileList(int bNo) {
			return (ArrayList)sqlSession.selectList("filesMapper.selectFileList", bNo);
		}
		
		public int insertFile(Files files) {
			return sqlSession.insert("filesMapper.insertFiles", files);
		}
		
		public int updateFile(Files files) {
			return sqlSession.update("filesMapper.updateFiles", files);
		}

		public int deleteFile(Files files) {
			return sqlSession.delete("filesMapper.deleteFiles", files);
		}
}
