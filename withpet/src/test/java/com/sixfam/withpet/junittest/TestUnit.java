package com.sixfam.withpet.junittest;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.AdminDAO;
import com.sixfam.withpet.model.dto.DonationDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-*.xml" })
public class TestUnit {

	PagingBean pagingBean =new PagingBean(4,4,4);
	
	@Resource
	AdminDAO dao;
	
	//@Resource
	//에러가 나야 되는 코드
	//BoardTDAO<ReplyDTO> replyboard;

	@Test
	public void unitTest() {		
		// ShareBoardType 글작성하기
		List<DonationDTO> list=dao.getAllDonationList(pagingBean);
		for(int i=0;i<list.size();i++)
		System.out.println(list.get(i).getTitle());
	}
}
