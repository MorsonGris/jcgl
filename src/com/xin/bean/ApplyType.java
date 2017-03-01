package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 报名分类
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@TableName("apply_type")
public class ApplyType extends Model<ApplyType> {

    private static final long serialVersionUID = 1L;

	@TableId("at_id")
	private Integer atId;
	@TableField("at_name")
	private String atName;
	@TableField("at_icon")
	private String aticon;

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

	@Override
	protected Serializable pkVal() {
		return this.atId;
	}

	public String getAticon() {
		return aticon;
	}

	public void setAticon(String aticon) {
		this.aticon = aticon;
	}

}
