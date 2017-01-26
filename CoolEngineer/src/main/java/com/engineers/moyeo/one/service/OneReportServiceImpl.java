package com.engineers.moyeo.one.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class OneReportServiceImpl implements OneReportService{

	@Override
	public String moimMain(Model model) {
		
		return "one/report/moimMain";
	}
	
	@Override
	public String moimReport(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int group_num = 1;
		
		System.out.println("group_num: " + group_num);
		
		return "one/report/moimReportMain";
	}

	@Override
	public String moimReportPro(Model model) {
		
		return "one/report/moimReportPro";
	}

	

}
