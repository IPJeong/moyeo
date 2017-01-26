package com.engineers.moyeo.four.service;



import org.springframework.ui.Model;

public interface FourService {
	
	//공지사항 게시판
	public String execute(Model model);
	//Model로부터 맵가져오는 것. 맵의 키를 이용하여 req의 값을 가져오기 위하여.
	
	public String writeExecute(Model model);
	
	public String writeproExecute(Model model);
	
	public String moimContentExecute(Model model);		
		
	
	
	public String moimDeleteExecute(Model model);
	
	
	public String moimDeleteproExecute(Model model);
	
	public String moimModifyFormExecute(Model model);
	
	public String moimModifyViewExecute(Model model);
	
	public String moimModifyProExecute(Model model);
	
	
	//가입인사 게시판
	
	public String greetinglistExecute(Model model);
	
	public String greetintwriteExecute(Model model);
	
	public String greetingWriteproExecute(Model model);
	
	
	
	
	
	
}
