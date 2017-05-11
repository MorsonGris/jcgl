package com.xin.bean;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("Share")
public class Share {
	
	@TableId("share_id")
	private int shareid;
	@TableField("share_title")
	private String sharetitle;
	@TableField("share_phone")
	private String sharephone;
	@TableField("share_content")
	private String sharecontent;
	@TableField("share_picture")
	private String sharepicture;

	public int getShareid() {
		return shareid;
	}

	public void setShareid(int shareid) {
		this.shareid = shareid;
	}

	public String getSharetitle() {
		return sharetitle;
	}

	public void setSharetitle(String sharetitle) {
		this.sharetitle = sharetitle;
	}

	public String getSharephone() {
		return sharephone;
	}

	public void setSharephone(String sharephone) {
		this.sharephone = sharephone;
	}

	public String getSharecontent() {
		return sharecontent;
	}

	public void setSharecontent(String sharecontent) {
		this.sharecontent = sharecontent;
	}

	public String getSharepicture() {
		return sharepicture;
	}

	public void setSharepicture(String sharepicture) {
		this.sharepicture = sharepicture;
	}
}
