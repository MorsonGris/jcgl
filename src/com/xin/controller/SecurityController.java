package com.xin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cloopen.rest.sdk.CCPRestSmsSDK;
import com.xin.commons.base.BaseController;

@Controller
@RequestMapping("/Security")
public class SecurityController extends BaseController{
	
	private static final String APP_ID = "8aaf07085aabcbbd015ac54829f40725"; // 8a48b5514efd1c3a014f01bb44d7067b
	private static final String ACOUNT_SID = "8aaf07085aabcbbd015ac548296c0720";// aaf98f894032b237014051abc35700f0
	private static final String AUTH_TOKEN = "be4423c769ec47eeb4c2835cb49010c1";// 6c19475e5fa14fe3bf4cccc60e23c8ad
	private static final String TEMPLATE_ID = "166140";//模板1ID(用于成人教育、国家开发大学、远程教育)
	private static final String TEMPLATE_ID2 = "166141";//模板2ID(用于艺考、会计、教师资格培训)
	private static final String TIME_LEN = "5";//通知时间（5分钟内有效）
	
	/**
	 * @param name
	 * @param phone
	 * @param school
	 * @param sContent
	 * @param sGradations
	 * @param code
	 * @return
	 */
	@RequestMapping("/security")
	@ResponseBody
	public Object security(int stype,String phone,String school,String sContent,String sGradations,String code,String type){
		HashMap<String, Object> result = null;
		CCPRestSmsSDK restAPI = new CCPRestSmsSDK();//初始化SDK
		//*初始化服务器地址和端口 *
		//*沙盒环境（用于应用开发调试）：restAPI.init("sandboxapp.cloopen.com", "8883");*
		//*生产环境（用户应用上线使用）：restAPI.init("app.cloopen.com", "8883"); *
		restAPI.init("app.cloopen.com", "8883");
		//*初始化主帐号和主帐号令牌,对应官网开发者主账号下的ACCOUNT SID和AUTH TOKEN *
		//*ACOUNT SID和AUTH TOKEN在登陆官网后，在“应用-管理控制台”中查看开发者主账号获取*
		//*参数顺序：第一个参数是ACOUNT SID，第二个参数是AUTH TOKEN。 *
		restAPI.setAccount(ACOUNT_SID, AUTH_TOKEN);
		//*初始化应用ID *
		//*测试开发可使用“测试Demo”的APP ID，正式上线需要使用自己创建的应用的App ID *
		//*应用ID的获取：登陆官网，在“应用-应用列表”，点击应用名称，看应用详情获取APP ID*
		restAPI.setAppId(APP_ID);
		//*调用发送模板短信的接口发送短信 *
		//*参数顺序说明： *
		//*第一个参数:是要发送的手机号码，可以用逗号分隔，一次最多支持100个手机号 *
		//*第二个参数:是模板ID，在平台上创建的短信模板的ID值；测试的时候可以使用系统的默认模板，id为1。 *
		//*系统默认模板的内容为“【云通讯】您使用的是云通讯短信模板，您的验证码是{1}，请于{2}分钟内正确输入”*
		//*第三个参数是要替换的内容数组。 *

		//**************************************举例说明***********************************************************************
		//*假设您用测试Demo的APP ID，则需使用默认模板ID 1，发送手机号是13800000000，传入参数为6532和5，则调用方式为
		//*
		//*result = restAPI.sendTemplateSMS("13800000000","1" ,new
		//String[]{"6532","5"}); *
		//*则13800000000手机号收到的短信内容是：【云通讯】您使用的是云通讯短信模板，您的验证码是6532，请于5分钟内正确输入 *
		//*********************************************************************************************************************
		if(type != null && type.equals("1")){
			String name = null;
			if(stype == 1){
				name = "成人教育报名";
			}else if(stype == 2){
				name = "国家开发大学报名";
			}else if(stype == 6){
				name = "远程教育报名";
			}
			result = restAPI.sendTemplateSMS(phone, TEMPLATE_ID, new String[] {name,school,sContent,sGradations,"招生管理公共平台",code,TIME_LEN });
		}else{
			String s = null;
			if(stype == 3){
				s = "会计报名";
			}else if(stype == 4){
				s = "艺考报名";
			}else if(stype == 5){
				s = "职业资格培训";
			}
			result = restAPI.sendTemplateSMS(phone, TEMPLATE_ID2, new String[] {s,"招生管理公共平台",code,TIME_LEN });
		}
		if("000000".equals(result.get("statusCode"))) {
			// 正常返回输出data包体信息（map）
			@SuppressWarnings("unchecked")
			HashMap<String, Object> retData = (HashMap<String, Object>)result.get("data");
			Set<String> keySet = retData.keySet();
			for (String key : keySet) {
				Object object = retData.get(key);
				System.out.println(key+"="+object);
			}
			return renderSuccess("发送成功");
		} else {
			// 异常返回输出错误码和错误信息
			String msg = "错误码=" + result.get("statusCode") + " 错误信息= "
					+ result.get("statusMsg");
			System.out.println(msg);
			return renderError(msg);
		}
	}
}
