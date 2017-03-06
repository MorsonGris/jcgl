package com.xin.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import java.math.BigDecimal;
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
public class Finance extends Model<Finance> {

    private static final long serialVersionUID = 1L;

	@TableId("f_id")
	private Integer fId;
	@TableField("stu_no")
	private String stuNo;
	@TableField("tea_class")
	private String teaClass;
	@TableField("need_money")
	private BigDecimal needMoney;
	@TableField("practical_money")
	private BigDecimal practicalMoney;
	@TableField("f_date")
	private Date fDate;
	@TableField("f_way")
	private Integer fWay;
	@TableField("f_accumulative")
	private BigDecimal fAccumulative;
	@TableField("f_state")
	private Integer fState;
	@TableField("f_obligate")
	private String fObligate;
	private Date createdateStart;
	private Date createdateEnd;

	private Student student;
	
	private User user;

	public Integer getFId() {
		return fId;
	}

	public void setFId(Integer fId) {
		this.fId = fId;
	}

	public String getStuNo() {
		return stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public String getTeaClass() {
		return teaClass;
	}

	public void setTeaClass(String teaClass) {
		this.teaClass = teaClass;
	}

	public BigDecimal getNeedMoney() {
		return needMoney;
	}

	public void setNeedMoney(BigDecimal needMoney) {
		this.needMoney = needMoney;
	}

	public BigDecimal getPracticalMoney() {
		return practicalMoney;
	}

	public void setPracticalMoney(BigDecimal practicalMoney) {
		this.practicalMoney = practicalMoney;
	}

	public Date getFDate() {
		return fDate;
	}

	public void setFDate(Date fDate) {
		this.fDate = fDate;
	}

	public Integer getFWay() {
		return fWay;
	}

	public void setFWay(Integer fWay) {
		this.fWay = fWay;
	}

	public BigDecimal getFAccumulative() {
		return fAccumulative;
	}

	public void setFAccumulative(BigDecimal fAccumulative) {
		this.fAccumulative = fAccumulative;
	}

	public Integer getFState() {
		return fState;
	}

	public void setFState(Integer fState) {
		this.fState = fState;
	}

	public String getFObligate() {
		return fObligate;
	}

	public void setFObligate(String fObligate) {
		this.fObligate = fObligate;
	}

	public Date getCreatedateStart() {
		return createdateStart;
	}

	public void setCreatedateStart(Date createdateStart) {
		this.createdateStart = createdateStart;
	}

	public Date getCreatedateEnd() {
		return createdateEnd;
	}

	public void setCreatedateEnd(Date createdateEnd) {
		this.createdateEnd = createdateEnd;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	protected Serializable pkVal() {
		return this.fId;
	}
	
}
