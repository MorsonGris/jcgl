package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@TableName("stu_file")
public class StuFile extends Model<StuFile> {

    private static final long serialVersionUID = 1L;

	@TableId("sf_id")
	private Integer sfId;
	@TableField("stu_id")
	private Integer stuId;
	@TableField("sf_photo")
	private String sfPhoto;
	@TableField("sf_voucher")
	private String sfVoucher;
	@TableField("sf_paper")
	private String sfPaper;
	@TableField("sf_date")
	private Date sfDate;


	public Integer getSfId() {
		return sfId;
	}

	public void setSfId(Integer sfId) {
		this.sfId = sfId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getSfPhoto() {
		return sfPhoto;
	}

	public void setSfPhoto(String sfPhoto) {
		this.sfPhoto = sfPhoto;
	}

	public String getSfVoucher() {
		return sfVoucher;
	}

	public void setSfVoucher(String sfVoucher) {
		this.sfVoucher = sfVoucher;
	}

	public String getSfPaper() {
		return sfPaper;
	}

	public void setSfPaper(String sfPaper) {
		this.sfPaper = sfPaper;
	}

	public Date getSfDate() {
		return sfDate;
	}

	public void setSfDate(Date sfDate) {
		this.sfDate = sfDate;
	}

	@Override
	protected Serializable pkVal() {
		return this.sfId;
	}

}
