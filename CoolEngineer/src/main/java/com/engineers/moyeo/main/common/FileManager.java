package com.engineers.moyeo.main.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	// 유니크한 파일명을 중복되지 않게 체크하는 메서드
	public static String makeUniqueFileName(String pathath, String fileName) {
		
		String extension = fileName.substring(fileName.lastIndexOf("."));
		String uniqueFileName = null;
		boolean isFile = true;
		
		while (isFile) {
			uniqueFileName = getUniqueFileName();
			isFile = doCheckFileExists(pathath+uniqueFileName+extension);
		}
		return uniqueFileName+extension;
	}

	// 해당 경로에 해당이름의 파일이 존재하지는 확인하는 메서드
	private static boolean doCheckFileExists(String fullPath) {
		return new File(fullPath).exists();
	}

	// 유니크한 파일명을 임의로 생성하는 메서드
	private static String getUniqueFileName() {
		return  UUID.randomUUID().toString();
	}
	
	// 해당경로에 해당이름으로 파일을 저장 후 저장된 파일명을 리턴하는 메서드
	public static String saveFile(MultipartFile multipartFile, String path, String fileName) {
		
		File f = new File(path);
		
		//파일의 저장경로에 폴더가 없을 경우 생성
		if(!f.exists())	f.mkdirs();
		
		File file = null;
		
		String filename = makeUniqueFileName(path, fileName);
		
		file = new File(path+filename);
			
		try{
			multipartFile.transferTo(file);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return filename;
	}
	
	// 파일의 이름을 통해 파일의 타입을 확인 후 숫자를 통해 파일타입을 리턴하는 메서드
	// 리턴 0 : 기타파일(필요하지않음)
	// 리턴 1 : 이미지
	// 리턴 2 : 동영상
	public static int checkFileType(String filename) {
		
		String[] imgs = {"jpg", "png", "gif", "bmp", "rel", "psd", "pdd", "tif", "pdf", "raw", "pct", "pic"};
		String[] videos = {"mpg", "mpeg", "mpe", "wmv", "asf", "asx", "flv", "rm", "mov", "dat", "avi", "mp4"};
		
		String extension = filename.substring(filename.lastIndexOf(".")+1);
		for(String img : imgs) {
			if(img.equals(extension.toLowerCase()))return 1;
		}
		for(String video : videos) {
			if(video.equals(extension.toLowerCase()))return 2;
		}
		
		return 0;
	}

}
