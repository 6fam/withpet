package com.sixidiot.doingtogether.model.dto;

import java.util.List;

import com.sixidiot.doingtogether.model.PagingBean;

public class ListDTO<T> {
	private List<T> list;
	private PagingBean pagingBean;

	public ListDTO() {
		super();
	}

	public ListDTO(List<T> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListDTO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}

}
