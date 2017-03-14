package com.xin.commons.utils;

import java.util.List;
public class PageJson<T> {
	private List<T> rows;
	private int page;//当前页(第几页)
	private long total;//记录总条数
	
	public PageJson() {
		// TODO Auto-generated constructor stub
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
}

