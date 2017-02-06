package com.engineers.moyeo.main.common;

import java.io.File;

public class Test {

	public static void main(String[] args) {
		
		File file = new File("src\\main\\webapp\\resources\\resource\\assets\\images\\gallery\\nature-7.jpg");
		if(file.exists()){
			System.out.println("존재함.");
		}
		
	}
	
}
