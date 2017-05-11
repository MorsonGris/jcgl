package com.xin.service;

import java.util.List;
import com.xin.bean.Share;
import com.xin.commons.utils.PageInfo;

public interface ShareService {
	void selectPage(PageInfo page);
	List<Share> queryall(int id);
	int insert(Share share);
	int update(Share share);
	int delete(int id);
}
