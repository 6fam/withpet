package com.sixfam.withpet.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.dto.ServiceIntroDTO;

@Repository
public class ServiceIntroDAOImpl implements ServiceIntroDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override 
	public void insertIntro(ServiceIntroDTO dto) {
		template.insert("service.insertIntro",dto);
	}

	@Override
	public int getIntroCount() {
		return template.selectOne("service.getIntroCount");
	}
	
	@Override
	public List<ServiceIntroDTO> getIntroBoardNo() {
		return template.selectList("service.getIntroBoardNo");
	}
	
	@Override
	public void updateIntro(ServiceIntroDTO dto) {
		template.update("service.updateIntro",dto);
	}
	
	@Override
	public ServiceIntroDTO detailIntro(int boardNo) {
		return template.selectOne("service.detailIntro",boardNo);
	}
	
	/*@Override 
	public void registerIntro(ServiceIntroDTO dto) {
		template.insert("service.serviceIntroInsert",dto);
	}*/
	
	/*@Override
	public void updateServiceIntro(ServiceIntroDTO dto) {
		System.out.println("DAO updateServiceIntro1"+dto);
		template.update("service.UpdateServiceIntro",dto);
		System.out.println("DAO updateServiceIntro2"+dto);
	}	*/
}