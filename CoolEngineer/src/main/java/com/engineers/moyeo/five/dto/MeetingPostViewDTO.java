package com.engineers.moyeo.five.dto;

import java.util.List;

public class MeetingPostViewDTO extends MeetingPostDTO{
	
	private List<String> post_tags;

	public List<String> getPost_tags() {
		return post_tags;
	}

	public void setPost_tags(List<String> post_tags) {
		this.post_tags = post_tags;
	}
	
}
