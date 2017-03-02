package com.xin.bean;

import java.util.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;


/**
 * <p>
 * 
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public class Student{

	@TableId("s_id")
	private Integer sId;
	@TableField("s_name")
	private String sName;
	@TableField("user_id")
	private Long userId;
	@TableField("id_number")
	private String idNumber;
	@TableField("s_phone")
	private String sPhone;
	@TableField("s_content")
	private String sContent;
	@TableField("academy_id")
	private Integer academyId;
	@TableField("s_gradations")
	private String sGradations;
	@TableField("s_systme")
	private String sSystme;
	@TableField("s_date")
	private Date sDate;


	public Integer getSId() {
		return sId;
	}

	public void setSId(Integer sId) {
		this.sId = sId;
	}

	public String getSName() {
		return sName;
	}

	public void setSName(String sName) {
		this.sName = sName;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getSPhone() {
		return sPhone;
	}

	public void setSPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getSContent() {
		return sContent;
	}

	public void setSContent(String sContent) {
		this.sContent = sContent;
	}

	public Integer getAcademyId() {
		return academyId;
	}

	public void setAcademyId(Integer academyId) {
		this.academyId = academyId;
	}

	public String getSGradations() {
		return sGradations;
	}

	public void setSGradations(String sGradations) {
		this.sGradations = sGradations;
	}

	public String getSSystme() {
		return sSystme;
	}

	public void setSSystme(String sSystme) {
		this.sSystme = sSystme;
	}

	public Date getSDate() {
		return sDate;
	}

	public void setSDate(Date sDate) {
		this.sDate = sDate;
	}
}
