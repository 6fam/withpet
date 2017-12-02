package com.sixfam.withpet.service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.sixfam.withpet.model.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Resource
	CommonDAO common;
	
	@Override
	public void addHits(HttpServletRequest request, HttpServletResponse response, String id, String boardNo) {
		int boardNumber = Integer.parseInt(boardNo);
		String cookieNameId=null;
		if(id.contains("@")) 
			cookieNameId=id.substring(0, id.indexOf("@"))+id.substring(id.indexOf("@")+1, id.indexOf("."));
		else
			cookieNameId=id;
		
		Cookie[] cookies=request.getCookies();
		Cookie c=null;
		if(cookies!=null) {
			for(int i=0;i<cookies.length;i++) {
				if((cookies[i].getName()).equals(boardNo+cookieNameId)){
					c=cookies[i];
				}
			}
			if(c==null) {
				Cookie newCookie=new Cookie(boardNo+cookieNameId,boardNo);
				newCookie.setMaxAge(60*60*24);
				response.addCookie(newCookie);
				//조회 수 업데이트
				common.addHits(boardNumber);
			}	
		}
	}
}
