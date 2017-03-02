package com.xin.service;

import com.xin.bean.Relation;
import com.xin.commons.utils.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IRelationService {
	void selectDataGrid(PageInfo pageInfo);
	
	int addRelation(Relation relaiton);
	
	Relation selectRelationById(int id);
	
	int updateRelation(Relation relation);
	
	void deleteRelation(int id);
}
