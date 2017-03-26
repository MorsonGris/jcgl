package com.xin.mapper;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Relation;

/**
 * 
 *联系方式表
 */
public interface RelationMapper {
	List<Relation> selectRelationPage(Pagination page, Map<String, Object> params);
	
	int relationInsert(Relation relation);
	
	Relation selectRelationById(int id);
	
	int updateRelation(Relation relation);
	
	void deleteRelation(int id);
}