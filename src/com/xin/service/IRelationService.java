package com.xin.service;

import java.util.List;

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
	List<Relation> selectDataGrid(PageInfo pageInfo);
	
	int addRelation(Relation relaiton);
	
	Relation selectRelationById(int id);
	
	int updateRelation(Relation relation);
	
	void deleteRelation(int id);
}
