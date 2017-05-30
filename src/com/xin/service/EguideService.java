package com.xin.service;

import com.xin.bean.Eguide;
import com.xin.commons.utils.PageInfo;

public interface EguideService {
	String add(Eguide eguide);
	String update(Eguide eguide);
	String delete(int id);
	Eguide selectById(int id);
	void selectPage(PageInfo pageInfo);
}
