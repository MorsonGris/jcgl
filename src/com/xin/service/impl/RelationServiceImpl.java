package com.xin.service.impl;

import com.xin.bean.Relation;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.RelationMapper;
import com.xin.service.IRelationService;
import com.baomidou.mybatisplus.plugins.Page;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class RelationServiceImpl implements IRelationService {
	
	@Autowired
	private RelationMapper relationMapper;

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Relation> page = new Page<Relation>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<Relation> list = relationMapper.selectRelationPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public int addRelation(Relation relation) {
		return relationMapper.relationInsert(relation);
	}

	@Override
	public Relation selectRelationById(int id) {
		return relationMapper.selectRelationById(id);
	}

	@Override
	public int updateRelation(Relation relation) {
		return relationMapper.updateRelation(relation);
	}

	@Override
	public void deleteRelation(int id) {
		relationMapper.deleteRelation(id);
	}
	
	
}
