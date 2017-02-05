package com.engineers.moyeo.main.dto;

public class WordDTO {

	// 단어
	private String word;
	// 카운트 수
	private String count;
	
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "[ word : " + word + ", count : " + count +" ]";
	}
	
}
