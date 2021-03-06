package com.engineers.moyeo.five.dao;

import java.util.List;
import java.util.Map;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.MeetingPostViewDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostReplyDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;
import com.engineers.moyeo.main.dto.GroupLeaderNotiDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;

public interface FiveDAO {

	// 모임후기의 글 개수 구하기
	public int getPostCnt(int group_num);
	// 모임후기의 글목록 가져오기
	public List<MeetingPostDTO> getPostList(Map<String, Integer> map);
	
	// 모임후기 등록
	public int insertPost(MeetingPostDTO dto);
	// 모임후기번호 조회
	public int getPostNum(Map<String, Object> dataMap);
	// 모임후기의 사진파일을 등록
	public int insertPostPic(PostPictureDTO dto);
	// 모임후기의 동영상 파일을 등록
	public int insertPostVideo(PostVideoDTO dto);
	// 모임후기의 상세정보를 조회
	public MeetingPostViewDTO getPostDetail(int post_num);
	// 모임후기의 사진을 조회
	public List<PostPictureDTO> getPostPics(int post_num);
	// 모임후기의 동영상을 조회
	public List<PostVideoDTO> getPostVideos(int post_num);
	// 모임후기의 조회수를 증가시킴
	public int updatePostHit(int post_num);
	// 모임후기 좋아요 여부 확인
	public int likeCheck(Map<String, Object> likeMap);
	// 모임후기의 댓글을 불러옴
	public List<PostReplyDTO> getPostReplys(int post_num);
	// 모임후기 수정
	public int updatePost(MeetingPostDTO dto);
	// 모임후기 사진삭제
	public int deletePostPic(int pic_num);
	// 모임후기 동영상삭제
	public int deletePostVideo(int video_num);
	// 모임후기 삭제
	public int deletePost(int post_num);
	// 모임후기 좋아요 추가
	public int likePost(Map<String, Object> map);
	// 모임후기 좋아요 수 증가
	public int updateLikeNum(int post_num);
	// 모임후기 좋아요 취소
	public int unLikePost(Map<String, Object> map);
	// 모임후기 좋아요 수 감소
	public int downDateLikeNum(int post_num);
	// 모임후기 좋아요 수 검색
	public int getLikeNum(int post_num);
	// 모임후기 댓글 추가
	public int addPostReply(PostReplyDTO dto);
	// 모임후기 번호로 모임후기 조회
	public PostReplyDTO getPostReply(Map<String, Object> map);
	// 모임후기 댓글 삭제
	public int deletePostReply(int postrep_num);
	
	// 모임의 사진 개수 구하기
	public int getGroupPicsCnt(int group_num);
	// 모임의 사진리스트를 불러옴
	public List<PostPictureDTO> getGroupPics(Map<String, Integer> map);
	// 모임의 동영상 개수 불러옴
	public int getGroupVideosCnt(int group_num);
	// 모임의 동영상리스트를 불러옴
	public List<PostVideoDTO> getGroupVideos(Map<String, Integer> map);
	// 모임의 권한을 조회
	public String getGroupPer(MyGroupDTO dto);
	// 모임의 알림을 조회
	public List<GroupLeaderNotiDTO> getGroupNoti(int group_num);
	// 조회한 알림을 읽음 처리
	public int updateGroupNoti(int group_num);
}
