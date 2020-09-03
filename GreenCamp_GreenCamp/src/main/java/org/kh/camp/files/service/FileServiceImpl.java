package org.kh.camp.files.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.camp.files.domain.Files;
import org.kh.camp.files.store.FileStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service("fileService")
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileStoreLogic fileStore;

	@Override
	public ArrayList<Files> selectFileList(int bNo) {
		return fileStore.selectFileList(bNo);
	}

	@Override
	public int insertFile(Files files, MultipartFile file, HttpServletRequest request) {
		return fileStore.insertFile(files);
	}

	@Override
	public int updateFile(Files files) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(Files files) {
		// TODO Auto-generated method stub
		return 0;
	}

}
