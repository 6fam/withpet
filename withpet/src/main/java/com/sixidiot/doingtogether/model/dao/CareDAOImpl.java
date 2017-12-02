package com.sixidiot.doingtogether.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dto.Authority;
import com.sixidiot.doingtogether.model.dto.CareDTO;
import com.sixidiot.doingtogether.model.dto.DateDTO;
import com.sixidiot.doingtogether.model.dto.DogDTO;

@Repository
public class CareDAOImpl extends BoardDAOImpl<CareDTO> implements CareDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override					     
	public List<Authority> selectAuthorityById(String id) {
		List<String> category=template.selectList("sh.selectAuthorityById", id);
		List<Authority> authList=new ArrayList<Authority>();
		for(int i=0;i<category.size();i++) {
			switch (category.get(i)) {
			case "27":
				authList.add(new Authority(id, "ROLE_MEMBER"));
				break;
			case "28":
				authList.add(new Authority(id, "ROLE_STANDBY"));
				break;
			case "29":
				authList.add(new Authority(id, "ROLE_DOGMOM"));
				break;
			case "30":
				authList.add(new Authority(id, "ROLE_ADMIN"));
				break;
			case "26":
				authList.add(new Authority(id, "ROLE_EXCEPT"));
				break;
			default:				
				break;
			}
		}
		return authList;
	}
	
	@Override			
	public DogDTO selectDogById(String id) {
		System.out.println(id);
		return template.selectOne("sh.selectDogById", id);
	}
	
	@Override
	public CareDTO careDetail(int boardNo) {
		System.out.println("DAO: "+boardNo);
		CareDTO careDTO=template.selectOne("sh.careDetail",boardNo);
		System.out.println("DAO 상세정보: "+careDTO);
		return careDTO;
	}

	@Override
	@Transactional
	public void insertCare(CareDTO careDTO, DateDTO dateDTO) {
		template.insert("sh.insertCarerBoardList",careDTO);	
		template.insert("sh.insertCarerDate",dateDTO);
		template.insert("sh.insertCarerWrite",careDTO);
	}
	
	/*
	 * 돌보미 dateNo 조회(삭제시필요)
	 */
	@Override
	public int selectDateByBoardNo(int boardNo) {
		return template.selectOne("sh.selectDateByBoardNo", boardNo);
	}
	/*
	 * 돌보미 게시글 삭제
	 */
	@Override
	public void deleteBoardByBoardNo(int boardNo) {
		template.delete("sh.deleteBoardByBoardNo", boardNo);
	}
	/*
	 * 돌보미 날짜 삭제
	 */
	@Override
	public void deleteGatheringDateByBoardNo(int dateNo) {
		template.delete("sh.deleteGatheringDateByBoardNo", dateNo);
	}
	/*
	 * 돌보미 수정
	 */
	@Override
	public void updateCareBoard(CareDTO careDTO) {
		template.update("sh.updateCareBoard",careDTO);	
	}
	@Override
	public void updateCare(CareDTO careDTO) {
		template.update("sh.updateCare",careDTO);	
	}
	@Override
	public void updateCareDate(DateDTO dateDTO) {
		template.update("sh.updateCareDate",dateDTO);	
	}

	@Override
	public int getTotalCountCare() {
		return template.selectOne("sh.getTotalCountCare");
	}

	@Override
	public List<CareDTO> getCareList(PagingBean pagingBean) {
		HashMap<String, Object> param=new HashMap<String,Object>();
		param.put("startRNum", pagingBean.getStartRowNumber());
		System.out.println(pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		System.out.println(pagingBean.getEndRowNumber());
		System.out.println(param.get("startRNum")+" "+param.get("endRNum"));
		List<CareDTO> cate=template.selectList("sh.getAllList", param);
		for(CareDTO d: cate)
			System.out.println(d);
		return template.selectList("sh.getAllList", param);
	}
	
	

}
