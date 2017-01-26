package com.engineers.moyeo.two.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.SuggestionDTO;

@Repository
public class TwoDAOImpl implements TwoDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관
	
	@Override
	public int writeSuggestion(SuggestionDTO dto) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.writeSuggestion(dto);
		return cnt;
	}

	@Override
	public int getSuggetionCount(String sug_status) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getSuggetionCount(sug_status);
		return cnt;
	}

	@Override
	public ArrayList<SuggestionDTO> getSuggestionList(Map<String, Object> daoMap) {
		ArrayList<SuggestionDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getSuggestionList(daoMap);
		return dtos;
	}

	@Override
	public SuggestionDTO readSuggestion(int sug_num) {
		SuggestionDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.readSuggestion(sug_num);
		return dto;
	}

	@Override
	public int checkSuggestion(SuggestionDTO dto) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.checkSuggestion(dto);
		return cnt;
	}
	
	public int getPlaceCount() {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPlaceCount();
		return cnt;
	}
	

	@Override
	public ArrayList<Place_infoDTO> getPlaceList(Map<String, Object> daoMap) {
		ArrayList<Place_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceList(daoMap);
		return dtos;
	}
	

	@Override
	public ArrayList<Place_picDTO> getPlacePictureList(Map<String, Object> daoMap) {
		ArrayList<Place_picDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlacePictureList(daoMap);
		return dtos;
	}
	
	@Override
	public Place_infoDTO readPlace(int place_num) {
		Place_infoDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.readPlace(place_num);
		return dto;
	}

	@Override
	public Place_picDTO readPlacePicture(int place_num) {
		Place_picDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.readPlacePicture(place_num);
		return dto;
	}
	
	@Override
	public int inputPlace(Place_infoDTO dto) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.inputPlace(dto);
		return cnt;
	}

	@Override
	public void inputPictures(Place_picDTO ppdto) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.inputPictures(ppdto);
	}

	@Override
	public int getPlaceNum() {
		int place_num = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		place_num = dao.getPlaceNum();
		return place_num;
	}
	
	@Override
	public void deletePlacePicture(int place_num) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.deletePlacePicture(place_num);
	}
	
	@Override
	public int deletePlace(int place_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.deletePlace(place_num);
		return cnt;
	}
	
	@Override
	public int modifyPlace(Place_infoDTO dto) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.modifyPlace(dto);
		return cnt;
	}

	@Override
	public void modifyPictures(Place_picDTO ppdto) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.modifyPictures(ppdto);
	}
	
	@Override
	public ArrayList<Rec_placeDTO> getRecPlaceList(Map<String, Object> daoMap) {
		ArrayList<Rec_placeDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getRecPlaceList(daoMap);
		return dtos;
	}

	@Override
	public Rec_placeDTO readRecPlace(int recplace_num) {
		Rec_placeDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.readRecPlace(recplace_num);
		return dto;
	}

	@Override
	public int writeRecPlace(Rec_placeDTO dto) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.writeRecPlace(dto);
		return cnt;
	}

	@Override
	public int deleteRecPlace(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.deleteRecPlace(daoMap);
		return cnt;
	}

	@Override
	public int modifyRecPlace(Rec_placeDTO dto) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.modifyRecPlace(dto);
		return cnt;
	}

	@Override
	public int readPlaceLike(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.readPlaceLike(daoMap);
		return cnt;
	}

	@Override
	public int plusPlaceLike(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.plusPlaceLike(daoMap);
		return cnt;
	}

	@Override
	public int minusPlaceLike(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.minusPlaceLike(daoMap);
		return cnt;
	}

}
