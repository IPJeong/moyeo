package com.engineers.moyeo.two.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.two.dto.Join_requestDTO;
import com.engineers.moyeo.two.dto.Member_infoDTO;
import com.engineers.moyeo.two.dto.Moim_infoDTO;
import com.engineers.moyeo.two.dto.Moim_pictureDTO;
import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.StatisticsDTO;
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
	public int getPlaceMainLocCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPlaceMainLocCount(daoMap);
		return cnt;
	}

	@Override
	public int getPlaceMainRecplaCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPlaceMainRecplaCount(daoMap);
		return cnt;
	}
	

	@Override
	public int getPlaceLikeCount() {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPlaceLikeCount();
		return cnt;
	}

	@Override
	public ArrayList<Place_infoDTO> getPlaceLocList(Map<String, Object> daoMap) {
		ArrayList<Place_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceLocList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_picDTO> getPlaceLocPictureList(Map<String, Object> daoMap) {
		ArrayList<Place_picDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceLocPictureList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_infoDTO> getPlaceRecplaList(Map<String, Object> daoMap) {
		ArrayList<Place_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceRecplaList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_picDTO> getPlaceRecplaPictureList(Map<String, Object> daoMap) {
		ArrayList<Place_picDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceRecplaPictureList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_infoDTO> getPlaceLikeList() {
		ArrayList<Place_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceLikeList();
		return dtos;
	}

	@Override
	public ArrayList<Place_picDTO> getPlaceLikePictureList() {
		ArrayList<Place_picDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceLikePictureList();
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
	public int getRecPlaceCount(int place_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getRecPlaceCount(place_num);
		return cnt;
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
	public int checkMyPlaceLike(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.checkMyPlaceLike(daoMap);
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
	public int checkPlalikeNum(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.checkPlalikeNum(daoMap);
		return cnt;
	}

	@Override
	public int minusPlaceLike(int plalike_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.minusPlaceLike(plalike_num);
		return cnt;
	}

	@Override
	public Moim_infoDTO readMoimInfo(int group_num) {
		Moim_infoDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.readMoimInfo(group_num);
		return dto;
	}

	@Override
	public int identifyMoimMember(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.identifyMoimMember(daoMap);
		return cnt;
	}

	@Override
	public int moimJoinCheck(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.moimJoinCheck(daoMap);	
		return cnt;
	}
	

	@Override
	public int moimBanishCheck(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.moimBanishCheck(daoMap);	
		return cnt;
	}

	@Override
	public int moimJoin(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.moimJoin(daoMap);	
		return cnt;
	}
	
	@Override
	public int moimWithdraw(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.moimWithdraw(daoMap);
		return cnt;
	}

	@Override
	public int getMoimJoinCount(int group_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getMoimJoinCount(group_num);	
		return cnt;
	}

	@Override
	public ArrayList<Join_requestDTO> getMoimJoinList(Map<String, Object> daoMap) {
		ArrayList<Join_requestDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimJoinList(daoMap);
		return dtos;
	}
	
	@Override
	public ArrayList<Member_infoDTO> getMoimJoinMemberInfoList(Map<String, Object> daoMap) {
		ArrayList<Member_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimJoinMemberInfoList(daoMap);
		return dtos;
	}
	
	@Override
	public Join_requestDTO getMoimJoinInfo(int request_num) {
		Join_requestDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.getMoimJoinInfo(request_num);
		return dto;
	}

	@Override
	public void moimJoinOK(Map<String, Object> daoMap) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.moimJoinOK(daoMap);
	}
	
	@Override
	public void moimJoinPro(Map<String, Object> daoMap) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.moimJoinPro(daoMap);
	}

	@Override
	public void moimJoinNO(Map<String, Object> daoMap) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.moimJoinNO(daoMap);
	}

	@Override
	public int getMoimMemberCount(int group_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getMoimMemberCount(group_num);
		return cnt;
	}

	@Override
	public ArrayList<MyGroupDTO> getMoimMemberList(Map<String, Object> daoMap) {
		ArrayList<MyGroupDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimMemberList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Member_infoDTO> getMoimMemberInfoList(Map<String, Object> daoMap) {
		ArrayList<Member_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimMemberInfoList(daoMap);
		return dtos;
	}

	@Override
	public MyGroupDTO getMoimMemberInfo(int my_group_num) {
		MyGroupDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.getMoimMemberInfo(my_group_num);
		return dto;
	}
	

	@Override
	public MyGroupDTO getMoimMemberInfo2(Map<String, Object> daoMap) {
		MyGroupDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.getMoimMemberInfo2(daoMap);
		return dto;
	}
	
	@Override
	public String checkMoimMemberRank(int my_group_num) {
		String group_per = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		group_per = dao.checkMoimMemberRank(my_group_num);
		return group_per;
	}

	@Override
	public int changeMoimMemberRank(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.changeMoimMemberRank(daoMap);
		return cnt;
	}

	@Override
	public int banishMoimMember(int my_group_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.banishMoimMember(my_group_num);
		return cnt;
	}
	

	@Override
	public void moimJoinOut(Map<String, Object> daoMap) {
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dao.moimJoinOut(daoMap);
	}

	@Override
	public int getNoticeBoardCount(int group_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getNoticeBoardCount(group_num);
		return cnt;
	}

	@Override
	public int getGreetingBoardCount(int group_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getGreetingBoardCount(group_num);
		return cnt;
	}

	@Override
	public int getPostBoardCount(int group_num) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPostBoardCount(group_num);
		return cnt;
	}

	@Override
	public ArrayList<GroupNoticeDTO> getNoticeBoardArticles(Map<String, Object> daoMap) {
		ArrayList<GroupNoticeDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getNoticeBoardArticles(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<GreetingBoardDTO> getGreetingBoardArticles(Map<String, Object> daoMap) {
		ArrayList<GreetingBoardDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getGreetingBoardArticles(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<MeetingPostDTO> getPostBoardArticles(Map<String, Object> daoMap) {
		ArrayList<MeetingPostDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPostBoardArticles(daoMap);
		return dtos;
	}

	@Override
	public int deleteNoticeBoardArticle(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.deleteNoticeBoardArticle(daoMap);
		return cnt;
	}

	@Override
	public int deleteGreetingBoardArticle(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.deleteGreetingBoardArticle(daoMap);
		return cnt;
	}

	@Override
	public int deletePostBoardArticle(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.deletePostBoardArticle(daoMap);
		return cnt;
	}

	@Override
	public int getMoimSearchCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getMoimSearchCount(daoMap);
		return cnt;
	}

	@Override
	public int getMoimPostSearchCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getMoimPostSearchCount(daoMap);
		return cnt;
	}

	@Override
	public int getMoimPostByTagSearchCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getMoimPostByTagSearchCount(daoMap);
		return cnt;
	}

	@Override
	public ArrayList<Moim_infoDTO> getMoimSearchList(Map<String, Object> daoMap) {
		ArrayList<Moim_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Moim_pictureDTO> getMoimPictureSearchList(Map<String, Object> daoMap) {
		ArrayList<Moim_pictureDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimPictureSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<MeetingPostDTO> getMoimPostSearchList(Map<String, Object> daoMap) {
		ArrayList<MeetingPostDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimPostSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<PostPictureDTO> getMoimPostPictureSearchList(Map<String, Object> daoMap) {
		ArrayList<PostPictureDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimPostPictureSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<MeetingPostDTO> getMoimPostByTagSearchList(Map<String, Object> daoMap) {
		ArrayList<MeetingPostDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimPostByTagSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<PostPictureDTO> getMoimPostPictureByTagSearchList(Map<String, Object> daoMap) {
		ArrayList<PostPictureDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getMoimPostPictureByTagSearchList(daoMap);
		return dtos;
	}

	@Override
	public int getPlaceSearchCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPlaceSearchCount(daoMap);
		return cnt;
	}

	@Override
	public int getPlaceByAddressSearchCount(Map<String, Object> daoMap) {
		int cnt = 0;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		cnt = dao.getPlaceByAddressSearchCount(daoMap);
		return cnt;
	}

	@Override
	public ArrayList<Place_infoDTO> getPlaceSearchList(Map<String, Object> daoMap) {
		ArrayList<Place_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_picDTO> getPlacePictureSearchList(Map<String, Object> daoMap) {
		ArrayList<Place_picDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlacePictureSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_infoDTO> getPlaceByAddressSearchList(Map<String, Object> daoMap) {
		ArrayList<Place_infoDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlaceByAddressSearchList(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<Place_picDTO> getPlacePictureByAddressSearchList(Map<String, Object> daoMap) {
		ArrayList<Place_picDTO> dtos = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dtos = dao.getPlacePictureByAddressSearchList(daoMap);
		return dtos;
	}

	@Override
	public StatisticsDTO chartByGender(int group_num) {
		StatisticsDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.chartByGender(group_num);
		return dto;
	}

	@Override
	public StatisticsDTO chartByAge(int group_num) {
		StatisticsDTO dto = null;
		TwoDAO dao = this.sqlSession.getMapper(TwoDAO.class);
		dto = dao.chartByAge(group_num);
		return dto;
	}

}
