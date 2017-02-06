package com.engineers.moyeo.main.dto;

import java.sql.Timestamp;

public class WordDTO {

	// 단어
	private String word;
	// 카운트 수
	private int count;
	// 단어의 품사
	private String part_of_speech;
	// 단어 수정일
	private Timestamp update_date;
	// 단어 최종 등록일
	private Timestamp reg_date;
	
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getPart_of_speech() {
		return part_of_speech;
	}
	public void setPart_of_speech(String part_of_speech) {
		this.part_of_speech = part_of_speech;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "[ word : " + word + ", count : " + count +", part_of_speech : " + part_of_speech + ", update_date : " + update_date + ", reg_date : " + reg_date +" ]";
	}
	
}
