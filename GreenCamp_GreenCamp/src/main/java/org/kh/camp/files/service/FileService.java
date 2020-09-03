package org.kh.camp.files.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.camp.files.domain.Files;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	public ArrayList<Files> selectFileList(int bNo);

	public int insertFile(Files files, MultipartFile file, HttpServletRequest request);
	
	public int updateFile(Files files);
	
	public int deleteFile(Files files);
	
}
