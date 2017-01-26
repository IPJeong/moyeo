package com.engineers.moyeo.two.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.SuggestionDTO;

public interface TwoDAO {
	//건의사항
	public int writeSuggestion(SuggestionDTO dto); //회원 : 건의사항 작성
	public int getSuggetionCount(String sug_status); //관리자 : 건의사항 정보의 개수를 파악한다
	public ArrayList<SuggestionDTO> getSuggestionList(Map<String, Object> daoMap); //관리자 : 건의사항 정보들을 받아서 리스트를 본다
	public SuggestionDTO readSuggestion(int sug_num); //관리자 : 건의사항 한개를 읽는다
	public int checkSuggestion(SuggestionDTO dto); //관리자 : 건의사항을 확인하고 확인처리를 한다
	
	//장소정보&장소사진
	public int getPlaceCount();
	public ArrayList<Place_infoDTO> getPlaceList(Map<String, Object> daoMap);
	public ArrayList<Place_picDTO> getPlacePictureList(Map<String, Object> daoMap);
	public Place_infoDTO readPlace(int place_num);
	public Place_picDTO readPlacePicture(int place_num);
	public int inputPlace(Place_infoDTO piDTO);
	public void inputPictures(Place_picDTO ppdto);
	public int getPlaceNum();
	public int deletePlace(int place_num);
	public void deletePlacePicture(int place_num);
	public int modifyPlace(Place_infoDTO dto);
	public void modifyPictures(Place_picDTO ppdto);
	
	//추천장소&추천장소 좋아요
	public ArrayList<Rec_placeDTO> getRecPlaceList(Map<String, Object> daoMap);
	public Rec_placeDTO readRecPlace(int recplace_num);
	public int writeRecPlace(Rec_placeDTO dto);
	public int deleteRecPlace(Map<String, Object> daoMap);
	public int modifyRecPlace(Rec_placeDTO dto);
	public int readPlaceLike(Map<String, Object> daoMap);
	public int plusPlaceLike(Map<String, Object> daoMap);
	public int minusPlaceLike(Map<String, Object> daoMap);

}
