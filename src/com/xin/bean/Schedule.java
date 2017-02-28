package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
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
public class Schedule extends Model<Schedule> {

    private static final long serialVersionUID = 1L;

	@TableId("s_id")
	private Integer sId;
	@TableField("user_id")
	private Long userId;
	@TableField("s_content")
	private String sContent;
	@TableField("s_date")
	private Date sDate;
	@TableField("s_flag")
	private Integer sFlag;


	public Integer getSId() {
		return sId;
	}

	public void setSId(Integer sId) {
		this.sId = sId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getSContent() {
		return sContent;
	}

	public void setSContent(String sContent) {
		this.sContent = sContent;
	}

	public Date getSDate() {
		return sDate;
	}

	public void setSDate(Date sDate) {
		this.sDate = sDate;
	}

	public Integer getSFlag() {
		return sFlag;
	}

	public void setSFlag(Integer sFlag) {
		this.sFlag = sFlag;
	}

	@Override
	protected Serializable pkVal() {
		return this.sId;
	}

}
