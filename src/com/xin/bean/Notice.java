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
public class Notice extends Model<Notice> {

    private static final long serialVersionUID = 1L;

	@TableId("n_id")
	private Integer nId;
	@TableField("n_title")
	private String nTitle;
	@TableField("n_content")
	private String nContent;
	@TableField("n_date")
	private Date nDate;
	@TableField("n_flag")
	private Integer nFlag;


	public Integer getNId() {
		return nId;
	}

	public void setNId(Integer nId) {
		this.nId = nId;
	}

	public String getNTitle() {
		return nTitle;
	}

	public void setNTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getNContent() {
		return nContent;
	}

	public void setNContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getNDate() {
		return nDate;
	}

	public void setNDate(Date nDate) {
		this.nDate = nDate;
	}

	public Integer getNFlag() {
		return nFlag;
	}

	public void setNFlag(Integer nFlag) {
		this.nFlag = nFlag;
	}

	@Override
	protected Serializable pkVal() {
		return this.nId;
	}

}
