package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;


/**
 * <p>
 * 热门专业表
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@TableName("stu_file")
public class HotMajor extends Model<HotMajor> {

    private static final long serialVersionUID = 1L;

	@TableId("hm_id")
	private Integer hmId;
	@TableField("hm_title")
	private String hmTitle;
	@TableField("hm_picture")
	private String hmPicture;
	@TableField("hm_content")
	private String hmContent;

	public Integer getHmId() {
		return hmId;
	}

	public void setHmId(Integer hmId) {
		this.hmId = hmId;
	}

	public String getHmTitle() {
		return hmTitle;
	}

	public void setHmTitle(String hmTitle) {
		this.hmTitle = hmTitle;
	}

	public String getHmPicture() {
		return hmPicture;
	}

	public void setHmPicture(String hmPicture) {
		this.hmPicture = hmPicture;
	}

	public String getHmContent() {
		return hmContent;
	}

	public void setHmContent(String hmContent) {
		this.hmContent = hmContent;
	}

	@Override
	protected Serializable pkVal() {
		return this.hmId;
	}

}
