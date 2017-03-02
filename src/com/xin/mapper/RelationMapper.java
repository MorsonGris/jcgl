package com.xin.mapper;

import com.xin.bean.Relation;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 * 
 *联系方式表
 */
public interface RelationMapper {
	List<Relation> selectRelationPage(Pagination page, Map<String, Object> params);
	
	int relationInsert(Relation relation);
	
	Relation selectRelationById(int id);
}