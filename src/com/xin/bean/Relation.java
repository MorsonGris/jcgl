package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public class Relation extends Model<Relation> {

    private static final long serialVersionUID = 1L;

	@TableId("r_id")
	private Integer rId;
	@TableField("r_qq")
	private String rQq;
	@TableField("r_content")
	private String rContent;
	@TableField("r_effect")
	private String rEffect;


	public Integer getRId() {
		return rId;
	}

	public void setRId(Integer rId) {
		this.rId = rId;
	}

	public String getRQq() {
		return rQq;
	}

	public void setRQq(String rQq) {
		this.rQq = rQq;
	}

	public String getRContent() {
		return rContent;
	}

	public void setRContent(String rContent) {
		this.rContent = rContent;
	}

	public String getREffect() {
		return rEffect;
	}

	public void setREffect(String rEffect) {
		this.rEffect = rEffect;
	}

	@Override
	protected Serializable pkVal() {
		return this.rId;
	}

}
