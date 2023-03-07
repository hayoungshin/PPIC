package com.ppicachu.ppic.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	public static String saveFile(MultipartFile upfile, HttpSession session, String folderPath) {
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);	// 10000~99999
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath(folderPath);
		
		try {
			// 파일객체 호출 : java.io패키지에 있는 걸로
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		// 경로+수정된파일명
		return folderPath + changeName;
	}

}
