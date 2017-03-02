package com.xin.bean;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * <p>
 * 报名分类
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@TableName("apply_type")
public class ApplyType {

	@TableId("at_id")
	private Integer atId;
	@TableField("at_name")
	private String atName;
	@TableField("at_icon")
	private String atIcon;

	public Integer getAtId() {
		return atId;
	}

	public void setAtId(Integer atId) {
		this.atId = atId;
	}

	public String getAtName() {
		return atName;
	}

	public void setAtName(String atName) {
		this.atName = atName;
	}

	public String getAtIcon() {
		return atIcon;
	}

	public void setAtIcon(String atIcon) {
		this.atIcon = atIcon;
	}

}
