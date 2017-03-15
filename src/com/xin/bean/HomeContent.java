package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import java.io.Serializable;


/**
 *首页内容
 * @author com.xin
 * @since 2017-02-28
 */
public class HomeContent extends Model<HomeContent> {

    private static final long serialVersionUID = 1L;

	@TableId("hc_id")
	private Integer hcId;
	@TableField("picture_one")
	private String pictureOne;
	@TableField("picture_two")
	private String pictureTwo;
	@TableField("picture_three")
	private String pictureThree;
	@TableField("qrcode_one")
	private String qrcodeOne;
	@TableField("qrcode_two")
	private String qrcodeTwo;
	@TableField("hc_phone")
	private String hcPhone;
	@TableField("hc_address")
	private String hcAddress;
	@TableField("interlinkage_one")
	private String interlinkageOne;
	@TableField("interlinkage_two")
	private String interlinkageTwo;
	@TableField("interlinkage_three")
	private String interlinkageThree;
	@TableField("interlinkage_four")
	private String interlinkageFour;

	public Integer getHcId() {
		return hcId;
	}

	public void setHcId(Integer hcId) {
		this.hcId = hcId;
	}

	public String getPictureOne() {
		return pictureOne;
	}

	public void setPictureOne(String pictureOne) {
		this.pictureOne = pictureOne;
	}

	public String getPictureTwo() {
		return pictureTwo;
	}

	public void setPictureTwo(String pictureTwo) {
		this.pictureTwo = pictureTwo;
	}

	public String getPictureThree() {
		return pictureThree;
	}

	public void setPictureThree(String pictureThree) {
		this.pictureThree = pictureThree;
	}

	public String getQrcodeOne() {
		return qrcodeOne;
	}

	public void setQrcodeOne(String qrcodeOne) {
		this.qrcodeOne = qrcodeOne;
	}

	public String getQrcodeTwo() {
		return qrcodeTwo;
	}

	public void setQrcodeTwo(String qrcodeTwo) {
		this.qrcodeTwo = qrcodeTwo;
	}

	public String getHcPhone() {
		return hcPhone;
	}

	public void setHcPhone(String hcPhone) {
		this.hcPhone = hcPhone;
	}

	public String getHcAddress() {
		return hcAddress;
	}

	public void setHcAddress(String hcAddress) {
		this.hcAddress = hcAddress;
	}

	public String getInterlinkageOne() {
		return interlinkageOne;
	}

	public void setInterlinkageOne(String interlinkageOne) {
		this.interlinkageOne = interlinkageOne;
	}

	public String getInterlinkageTwo() {
		return interlinkageTwo;
	}

	public void setInterlinkageTwo(String interlinkageTwo) {
		this.interlinkageTwo = interlinkageTwo;
	}

	public String getInterlinkageThree() {
		return interlinkageThree;
	}

	public void setInterlinkageThree(String interlinkageThree) {
		this.interlinkageThree = interlinkageThree;
	}

	public String getInterlinkageFour() {
		return interlinkageFour;
	}

	public void setInterlinkageFour(String interlinkageFour) {
		this.interlinkageFour = interlinkageFour;
	}

	@Override
	protected Serializable pkVal() {
		return this.hcId;
	}

	@Override
	public String toString() {
		return "HomeContent [hcId=" + hcId + ", pictureOne=" + pictureOne + ", pictureTwo=" + pictureTwo
				+ ", pictureThree=" + pictureThree + ", qrcodeOne=" + qrcodeOne + ", qrcodeTwo=" + qrcodeTwo
				+ ", hcPhone=" + hcPhone + ", hcAddress=" + hcAddress + ", interlinkageOne=" + interlinkageOne
				+ ", interlinkageTwo=" + interlinkageTwo + ", interlinkageThree=" + interlinkageThree
				+ ", interlinkageFour=" + interlinkageFour + "]";
	}

}
