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
public class Academy extends Model<Academy> {

    private static final long serialVersionUID = 1L;

	@TableId("a_id")
	private Integer aId;
	@TableField("a_school")
	private String aSchool;
	@TableField("a_major")
	private String aMajor;
	@TableField("a_flag")
	private Integer aFlag;


	public Integer getAId() {
		return aId;
	}

	public void setAId(Integer aId) {
		this.aId = aId;
	}

	public String getASchool() {
		return aSchool;
	}

	public void setASchool(String aSchool) {
		this.aSchool = aSchool;
	}

	public String getAMajor() {
		return aMajor;
	}

	public void setAMajor(String aMajor) {
		this.aMajor = aMajor;
	}

	public Integer getAFlag() {
		return aFlag;
	}

	public void setAFlag(Integer aFlag) {
		this.aFlag = aFlag;
	}

	@Override
	protected Serializable pkVal() {
		return this.aId;
	}

}
