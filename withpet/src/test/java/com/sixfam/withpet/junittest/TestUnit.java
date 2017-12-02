package com.sixfam.withpet.junittest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sixfam.withpet.model.PagingBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-*.xml" })
public class TestUnit {

	PagingBean pagingbean;
	
	
	//@Resource
	//에러가 나야 되는 코드
	//BoardTDAO<ReplyDTO> replyboard;

	@Test
	public void unitTest() {		
		// ShareBoardType 글작성하기
	}
}
