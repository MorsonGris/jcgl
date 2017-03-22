<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${path }/static/proscenium/logo/favicon2.ico" /> 
    <link href="${path }/static/proscenium/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path }/static/proscenium/css/style.css" rel="stylesheet">
<title>聚成教育-招生简章</title>
</head>
<body>
<jsp:include page="/static/proscenium/commons/head.jsp"></jsp:include>

<img alt="" src="${path }/static/proscenium/images/eguide.jpg" style="width: 100%;">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-680011">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-about" data-toggle="tab">关于我们</a>
					</li>
					<li>
						 <a href="#panel-friends" data-toggle="tab">合作院校</a>
					</li>
					
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-about" style="margin-top: 20px;">
						<p style="text-indent: 20px;">
							赣州聚成教育以打造学历培训等全方位教育服务类网站为中心，
							为广大学员提供更专业、更贴心、更灵活、更高效、更优秀的学
							习与培训指导。聚成教育是以学业规划、成人教育、职业培训为
							主的民办教育机构，经过多年的摸索和努力，学校把“厚于德，诚
							于信，敏于行”作为学校校训，秉承“打造国内优秀教育品牌，用心
							服务好每位学生”的办学服务理念。
						</p>
						<p style="text-indent: 20px;">
							本校以成人高考、自学考试、远程教育、在职研究生及职业资格证
							书为办学主体，多年来深得当地教育主管部门、各合作高校以及社
							会各界的一致好评，连续多年被评为“先进集体”、“优秀单位”、“先
							进函授站”等荣誉称号。
						</p>
						<p style="text-indent: 20px;">
							目前，在赣州聚成教育顺利毕业的学生已达4千多人，上万余学员
							选择赣州聚成教育就读，我们的学员分布于社会各个阶层，针对不
							同需求的学员，制定全面客观的具体学习方案，提供优质、便捷的
							学习服务平台，解决学员在学习过程中的疑点、难点问题，真正让
							学员顺利稳定地学习、深造和提升学历，轻松实现找工作、升职、
							加薪、出国留学、评职称、考公务员、晋级和考研等愿望。
						</p>
					</div>
					<div class="tab-pane" id="panel-friends" style="margin-top: 20px;">
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s1">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s1.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s2">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s2.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s3">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s3.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s4">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s4.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s5">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s5.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s6">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s6.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s7">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s7.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s8">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s8.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s9">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s9.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s10">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s10.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s11">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s11.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s12">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s12.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s13">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s13.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s14">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s14.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s15">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s15.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s16">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s16.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s17">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s17.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s18">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s18.png">
							</a>
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<div class="col-xs-4">
							<a href="#s19">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s19.png">
							</a>
							</div>
							<div class="col-xs-4">
							<a href="#s20">
							<img alt="" style="width: 100%;" src="${path }/static/proscenium/images/school/s20.png">
							</a>
							</div>
							<div class="col-xs-4">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="border-top: 2px solid #ddd;">
				<div id="s1" style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/1/school.jpg">
                    <h3>北京外国语大学</h3>
                    <p style="text-indent: 20px;">北京外国语大学，简称北外，由中华人民共和国教育部直属，位列国家首批“211工程”，入选“985工程优势学科创新平台”、“2011计划”</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 北京外国语大学（Beijing Foreign Studies University），简称北外，由中华人民共和国教育部直属，位列国家首批“211工程”，入选“985工程优势学科创新平台”、“2011计划”，为财政部6所“小规模试点高校“之一，国际大学翻译学院联合会成员，设有研究生院，是中国外国语类高等院校中历史悠久、教授语种最多、办学层次齐全的全国重点大学，被誉为“共和国外交官摇篮”。
    				</p>
    				<p style="text-indent: 20px;">
    					北京外国语大学前身是1941年成立于延安的中国人民抗日军事政治大学三分校俄文大队，后发展为延安外国语学校，建校始隶属于中国共产党领导。新中国成立后，学校归外交部领导。1954年，更名为北京外国语学院；1959年，与北京俄语学院合并组建新的北京外国语学院。1980年后直属国家教育部领导。1994年，正式更名为北京外国语大学。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/1/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/1/byz.jpg">
                </div>
			</div>
			<div id="s2" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/2/school.jpg">
                    <h3>电子科技大学</h3>
                    <p style="text-indent: 20px;">电子科技大学简称电子科大，坐落于有“天府之国”之称的成都市，由中华人民共和国教育部直属，位列“211工程”、“985工程”，入选国家“2011计划”、“111计划”、“卓越工程师教育培养计划”</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 电子科技大学（University of Electronic Science and Technology of China）简称电子科大，坐落于有“天府之国”之称的成都市，由中华人民共和国教育部直属，位列“211工程”、“985工程”，入选国家“2011计划”、“111计划”、“卓越工程师教育培养计划”，两电一邮成员，设有研究生院，是一所以电子信息科学技术为核心的全国重点大学，被誉为“中国电子类院校的排头兵”。
    				</p>
    				<p style="text-indent: 20px;">
    					电子科技大学原名成都电讯工程学院，是1956年在周恩来总理的亲自部署下，由交通大学（现上海交通大学、西安交通大学）、南京工学院（现东南大学）、华南工学院（现华南理工大学）的电讯工程有关专业合并创建而成。1960年，被中共中央列为全国重点高等学校；1961年，被中共中央确定为七所国防工业院校之一。1988年，更名为电子科技大学。1997年，被确定为国家首批“211工程”建设的重点大学。2000年，由原信息产业部主管划转为教育部主管。2001年，进入国家“985工程”重点建设大学行列。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/2/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/2/byz.jpg">
                </div>
			</div>
			<div id="s3" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/3/school.jpg">
                    <h3>东华理工大学</h3>
                    <p style="text-indent: 20px;">涵盖法学 、行政管理 、会计学 、英语 、汉语言文学 、体育教育 、艺术设计学 、市场营销 、电子信息工程 、计算机科学与技术 、通信工程 、自动化 、资源勘查工程 、土木工程 、测绘工程广告学</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 东华理工大学位于著名的“才子之乡”——江西省抚州市，是江西省人民政府与工业和信息化部国防科技工业局（原国防科工委）共建的一所具有地学和核科学特色，以理工为主，文、管、经、法、教兼备的综合性大学。
					</p>
					<p style="text-indent: 20px;">	
						学校现有在校生29000余人（含留学生），是全国首批学士学位和第四批硕士学位授权单位。现有57个本科专业，其中11个国防军工专业、1个国防重点专业、1个国防紧缺专业、3个国家级特色专业、14个江西省品牌专业、8个省级特色专业，14个省部级重点学科，65个硕士点，有4个专业合作培养博士生，有10个领域的工程硕士学位授予权，具有在职人员以同等学历申请硕士学位授权资格。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/3/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/3/byz.jpg">
                </div>
			</div>
			<div id="s4" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/4/school.jpg">
                    <h3>赣南师范大学</h3>
                    <p style="text-indent: 20px;">北京外国语大学，简称北外，由中华人民共和国教育部直属，位列国家首批“211工程”，入选“985工程优势学科创新平台”、“2011计划”</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 北京外国语大学（Beijing Foreign Studies University），简称北外，由中华人民共和国教育部直属，位列国家首批“211工程”，入选“985工程优势学科创新平台”、“2011计划”，为财政部6所“小规模试点高校“之一，国际大学翻译学院联合会成员，设有研究生院，是中国外国语类高等院校中历史悠久、教授语种最多、办学层次齐全的全国重点大学，被誉为“共和国外交官摇篮”。
    					北京外国语大学前身是1941年成立于延安的中国人民抗日军事政治大学三分校俄文大队，后发展为延安外国语学校，建校始隶属于中国共产党领导。新中国成立后，学校归外交部领导。1954年，更名为北京外国语学院；1959年，与北京俄语学院合并组建新的北京外国语学院。1980年后直属国家教育部领导。1994年，正式更名为北京外国语大学。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/4/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/4/byz.jpg">
                </div>
			</div>
			<div id="s5" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/5/school.jpg">
                    <h3>赣南医学院</h3>
                    <p style="text-indent: 20px;">赣南医学院是江西省唯一独立设置的普通高等本科医学院，坐落在江西南部、京九铁路线上的历史文化名城---赣州市内。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 江西省唯一独立设置的普通高等本科医学院，坐落在江西南部、京九铁路线上的历史文化名城---赣州市内。中国科学院院士韩济生教授担任名誉院长。学校创办于1941年，先后经历了江西省赣县高级助产职业学校、江西省赣县高级医事职业学校、江西省赣州护士助产学校、江西省赣州卫生学校等时期；1958年8月建立赣南医学专科学校，1988年4月升格为赣南医学院并开始招收本科生。1997年通过教育部本科教学工作合格评估，2007年获教育部普通高等学校本科教学工作水平评估优良成绩。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/5/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/5/byz.jpg">
                </div>
			</div>
			<div id="s6" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/6/school.jpg">
                    <h3>国家开放大学</h3>
                    <p style="text-indent: 20px;">国家开放大学直属教育部，以现代信息技术为支撑，学历教育与非学历教育并举，实施远程开放教育的新型高等学校。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 国家开放大学是教育部直属的，以现代信息技术为支撑，学历教育与非学历教育并举，实施远程开放教育的新型高等学校。学校在广播电视大学基础上组建，面向全体社会成员，强调优质教育资源的集聚、整合和共享，强调以现代信息技术为支撑，探索现代信息技术与教育的深度融合。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/6/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/6/byz.jpg">
                </div>
			</div>
			<div id="s7" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/7/school.jpg">
                    <h3>华南师范大学</h3>
                    <p style="text-indent: 20px;">华南师范大学（South China Normal University），简称“华师”，坐落于南方名城广州市，由中华人民共和国教育部和广东省人民政府共建，入选中国首批“211工程”、“卓越教师培养计划”，为广东省省属重点大学、中国100 所首批联入CERNET和INTERNET网的高等院校之一。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 华南师范大学（South China Normal University），简称“华师”，坐落于南方名城广州市，由中华人民共和国教育部和广东省人民政府共建，入选中国首批“211工程”、“卓越教师培养计划”，为广东省省属重点大学、中国100 所首批联入CERNET和INTERNET网的高等院校之一。
					</p>
					<p style="text-indent: 20px;">	
						华南师范大学始建于1933年，前身是当代著名教育家林砺儒先生创建的广东省立勷勤大学师范学院；1982年10月，易名为华南师范大学；2006年，学校通过“十五”“211工程”建设整体验收。2004年，原中共中央总书记、国家主席胡锦涛出席澳门回归五周年庆典期间，称该校是中国数家名牌师范大学之一。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/7/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/7/byz.jpg">
                </div>
			</div>
			<div id="s8" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/8/school.jpg">
                    <h3>江西广播电视大学</h3>
                    <p style="text-indent: 20px;">创建于1979年1月，是经江西省人民政府批准创办的直属高校，主要运用广播、电视、文字教材、音像教材和计算机课件及网络等多种媒体进行现代远程开放教育的新型高等学校</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 创建于1979年1月，是经江西省人民政府批准创办的直属高校，主要运用广播、电视、文字教材、音像教材和计算机课件及网络等多种媒体进行现代远程开放教育的新型高等学校，自办学以来，学校先后开设了60个科类专业，开设课程340多门。今天，江西广播电视大学已形成了具有中国特色的现代远距离教育系统和模式，截止2012年底，全省各类学历教育在校生111976人，其中开放教育89791人，高职教育4354人，网络教育10332人，自考3379人，成人大专1439人，中专教育2681人。在校生规模和年度招生规模位居全国省级电大前列。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/8/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/8/byz.jpg">
                </div>
			</div>
			<div id="s9" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/9/school.jpg">
                    <h3>江西科技师范大学</h3>
                    <p style="text-indent: 20px;">江西科技师范大学坐落于具有“物华天宝、人杰地灵”声誉的历史文化名城——南昌，是我国首批建立的高等职业技术师范院校</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 江西科技师范大学坐落于具有“物华天宝、人杰地灵”声誉的历史文化名城——南昌，是我国首批建立的高等职业技术师范院校，是教育部重点建设的培养职业教育师资的高等院校，也是江西省唯一一所培养职业教育师资的多科性本科院校，主要培养职教师资、普教师资和应用型专门人才。经过60多年的建设与发展，学校形成了以本科、研究生教育为主体，统筹发展继续教育的多学科、多层次的办学格局。2008年，学校以“优秀”成绩通过教育部本科教学工作水平评估。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/9/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/9/byz.jpg">
                </div>
			</div>
			<div id="s10" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/10/school.jpg">
                    <h3>江西师范大学</h3>
                    <p style="text-indent: 20px;">江西师范大学是教育部、江西省人民政府共建高校和中西部高校基础能力建设工程高校，是江西省人民政府确定为优先发展的省属重点(师范)大学。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 教育部、江西省人民政府共建高校和中西部高校基础能力建设工程高校，是江西省人民政府确定为优先发展省属重点(师范)大学。学校为博士学位授予权单位，融教育学、哲学、文学、历史学、法学、经济学、管理学、理学、工学、艺术学等十大学科门类于一体，属师范与非师范并举的省属综合性重点大学。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/10/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/10/byz.jpg">
                </div>
			</div>
			<div id="s11" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/11/school.jpg">
                    <h3>江西中医药大学</h3>
                    <p style="text-indent: 20px;">江西中医学院成人教育创办于1959年，是全国最早举办成人教育的院校之一。50年来，依托江西中医学院普通高等教育优良的教学资源和雄厚的师资力量</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 江西中医学院成人教育创办于1959年，是全国最早举办成人教育的院校之一。50年来，依托江西中医学院普通高等教育优良的教学资源和雄厚的师资力量，共培养医药类本、专科毕业生11600多人，培训各类中医药专业技术人员及乡村医师3.3万余人次。
					</p>
					<p style="text-indent: 20px;">
						学院成人高等学历教育目前开设有业余（夜大学）、函授两种学习形式，有专科起点升本科、高中起点升本科、高中起点达专科三个学历层次，现有各类在校生5500余人。

                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/11/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/11/byz.jpg">
                </div>
			</div>
			<div id="s12" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/12/school.jpg">
                    <h3>井冈山大学</h3>
                    <p style="text-indent: 20px;">井冈山大学是一所全日制多科性普通高等本科学校。学校位于革命摇篮井冈山所在地——江西省吉安市中心城区，占地面积2554亩，校舍建筑面积52.74万平方米。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		井冈山大学是一所全日制多科性普通高等本科学校。学校位于革命摇篮井冈山所在地——江西省吉安市中心城区，占地面积2554亩，校舍建筑面积52.74万平方米。教学科研设备总值9036.81万元，图书馆藏书130余万册，拥有外文数据库、光盘数据库、试用数据库等各类数据库17个，拥有电子图书28.45万册。现有全日制在校本专科学生1.7万余人，其中本科生9000余人，外国留学生193人，各类成人教育学生1万余人。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/12/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/12/byz.jpg">
                </div>
			</div>
			<div id="s13" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/13/school.jpg">
                    <h3>九江学院</h3>
                    <p style="text-indent: 20px;">九江学院是经国家教育部批准设立的国有公办全日制本科普通高等院校, 办学历史可上溯至1901年由美国基督教卫理公会创办的但福德学校。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
              		 	九江学院是经国家教育部批准设立的国有公办全日制本科普通高等院校, 办学历史可上溯至1901年由美国基督教卫理公会创办的但福德学校。学校位于庐山之麓、鄱阳湖之畔，占地2850多亩，现有五个校区，设有1所直辖“三级甲等”医院。
　　					</p>
					<p style="text-indent: 20px;">
						学校现有专任教师1900余人，副高以上830余人，博士230余人;研究生导师70余人;赣鄱英才555工程3人;国务院特殊津贴和省政府特殊津贴10人;江西省高校学科带头人和青年骨干教师44人;江西省高校名师6人;江西省“百千万人才工程”14人。
　　					</p>
					<p style="text-indent: 20px;">
						学校现有21个二级学院。设有经济学、法学、教育学、文学、理学、工学、农学、医学、管理学等十一大学科门类，涵盖82个本科专业。有35个国家级、省级“质量工程”项目;86个国家级、省级“本科教学工程”项目;10个省级重点学科，并设立了“流域管理与生态保护”博士后科研工作站和杨叔子院士工作站。2015年，学校完成的课题成果获江西省政府自然科学二等奖。
　　					</p>
					<p style="text-indent: 20px;">
						学校建有庐山文化研究中心、鄱阳湖生态经济研究中心、沿江产业开发研究中心、社会系统学研究中心、数控技术研究所等32个科研机构。2015年，学校获得国家自然科学基金和社会科学基金项目27项，各类科研项目经费达3000多万元。
　　					</p>
					<p style="text-indent: 20px;">
						学校现有各类实验教学中心/综合实验室28个。其中，5个省级重点实验室/工程中心，5个省级实验教学示范中心、2个省高校人文社科重点研究基地。有37个中央与地方共建实验室、中央与地方共建特色优势学科实验室。现有教学科研仪器设备总值2.27亿元。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/13/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/13/byz.jpg">
                </div>
			</div>
			<div id="s14" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/14/school.jpg">
                    <h3>南昌师范学院</h3>
                    <p style="text-indent: 20px;">省属普通高等师范本科院校，2013年由江西教育学院改制而成。该校是江西省最早举办的八所本科高校之一</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 南昌师范学院属普通高等师范本科院校，2013年由江西教育学院改制而成。该校是江西省最早举办的八所本科高校之一，前身是成立于1952年的江西省中等师资进修学校，1956年更名为南昌师范专科学校，1958年创办江西教育学院，江西省第一任省长邵式平为学院亲笔题写了校名。学院学习环境优美、教学风气优良、学术氛围浓郁、文化品位高雅，现有青山湖、昌北两个校区，各类在籍学生近2万人。61年来，为社会培养、培训各类专门人才16万余人。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/14/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/14/byz.jpg">
                </div>
			</div>
			<div id="s15" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/15/school.jpg">
                    <h3>陕西师范大学</h3>
                    <p style="text-indent: 20px;">陕西师范大学是教育部直属，国家“211工程”重点建设大学，国家教师教育“985”优势学科创新平台建设高校，是国家培养高等院校</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 陕西师范大学是国家“211工程”重点建设大学，国家教师教育“985”优势学科创新平台建设高校，是国家培养高等院校，中等学校师资和教育管理干部以及其他高级专门人才的重要基地被誉为西北地区“教师的摇篮”。陕西师范大学有五十多年的成人教育历史，是西北地区普通高等学校中最早设立成人教育的机构。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/15/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/15/byz.jpg">
                </div>
			</div>
			<div id="s16" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/16/school.jpg">
                    <h3>四川农业大学</h3>
                    <p style="text-indent: 20px;">是四川省人民政府主管的一所以生物科技为特色、农业科技为优势，农、理、工、经、管、医、文、教、法、艺多学科协调发展的省部共建重点大学，是国家“211工程”建设院校之一</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 四川农业大学是四川省人民政府主管的一所以生物科技为特色、农业科技为优势，农、理、工、经、管、医、文、教、法、艺多学科协调发展的省部共建重点大学，是国家“211工程”建设院校之一，四川省“2011协同创新中心”高校，是全国首批高等学校新农村发展研究院试点单位，具有自主招生资格。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/16/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/16/byz.jpg">
                </div>
			</div>
			<div id="s17" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/17/school.jpg">
                    <h3>天津大学</h3>
                    <p style="text-indent: 20px;">天津大学坐落于历史文化名城、中国北方经济中心天津，始建于1895年10月2日，是中国第一所现代大学，开中国现代高等教育之先河，素以“实事求是”的校训、“严谨治学”的校风和“爱国奉献”的传统享誉海内外。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 天津大学坐落于历史文化名城、中国北方经济中心天津，始建于1895年10月2日，是中国第一所现代大学，开中国现代高等教育之先河，素以“实事求是”的校训、“严谨治学”的校风和“爱国奉献”的传统享誉海内外。1951年经国家院系调整定名为“天津大学”，沿用至今。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/17/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/17/byz.jpg">
                </div>
			</div>
			<div id="s18" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/18/school.jpg">
                    <h3>西北工业大学</h3>
                    <p style="text-indent: 20px;">西北工业大学，简称“西工大”，位于古都西安，是中华人民共和国工业和信息化部直属的一所航空、航天、航海工程为特色。</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 西北工业大学，简称“西工大”，位于古都西安，是中华人民共和国工业和信息化部直属的一所航空、航天、航海工程为特色。工、理为主，管、文、经、法协调发展的研究型、多科性、开放试全国重点大学，是国家“985”、“211工程”重点建设高校，入选“2011计划”、“111计划”、“卓越工程师教育培养计划”，是“卓越大学联盟”、“中俄工科大学联盟”成员，中管副部级建制，设有研究生院。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/18/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/18/byz.jpg">
                </div>
			</div>
			<div id="s19" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/19/school.jpg">
                    <h3>郑州大学</h3>
                    <p style="text-indent: 20px;">郑州大学（Zhengzhou University），简称郑大，是中华人民共和国教育部与河南省人民政府共建高校，国家“211工程”重点建设高校</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		 郑州大学（Zhengzhou University），简称郑大，是中华人民共和国教育部与河南省人民政府共建高校，国家“211工程”重点建设高校，“中西部高校综合实力提升工程”入选高校，也是“卓越工程师教育培养计划”、“卓越法律人才教育培养计划”和“卓越医生教育培养划”入选高校。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/19/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/19/byz.jpg">
                </div>
			</div>
			<div id="s20" style="border-top: 2px solid #ddd;">
				<div style="margin-top: 20px;margin-bottom: 10px;">
					<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/20/school.jpg">
                    <h3>中国石油大学</h3>
                    <p style="text-indent: 20px;">中国石油大学是一所石油特色鲜明，以工为主，理工管文相结合的全国重点大学</p>
                </div>
                <div style="margin-bottom: 40px;">
                    <h3>学校简介</h3>
                    <p style="text-indent: 20px;">
                   		中国石油大学是一所石油特色鲜明，以工为主，理工管文相结合的国重点大学。它的前身是1953年创建的北京石油学院；1960年被确定为全国重点高等院校；1997年11月，经国家计划委员会批准，正式进入国家“211工程”首批重点建设的高等学校行列；2000年2月划归教育部直属；2000年6月，经国家教育部批准，成立研究生院。
    					中国石油大学远程教育学院成立于2001年。学院依托学校优秀的教学资源，采用基于计算机互联网的远程教学模式和学分制教学管理模式，面向社会自主招生，开展高起专、专升本两个层次的学历教育，颁发国家承认的学历证书。
                    </p>
                    <img style="width: 100%;height: 150%;" alt="" src="${path }/static/proscenium/images/school/20/zy.png">
                	
                </div>
                <div style="margin-bottom: 20px;">
                    <h4 style="text-align: center;color: red;"> 国家承认学历   教育部网上可查</h4>
                    <h4>毕业证样本：</h4>
                    <img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/20/byz.jpg">
                </div>
               	<div style="margin-bottom: 10px;">
               		<div class="row">
               			<div class="col-xs-6">
               			<img style="width: 100%;" alt="" src="${path }/static/proscenium/images/school/20/ewm.jpg">
               			</div>
               			<div class="col-xs-6">
               			<span>微信公众号</span><br>
               			<span style="color: red;">PKW8385168</span><br>
               			<span>报名热线</span><br>
               			<span style="color: red;">0797-8385168</span><br>
               			<span>地址：赣州市章贡区红旗大道55号（华钨大厦旁）</span>
               			</div>
               		</div>
                </div>
			</div>
			
		</div>
	</div>
</div>
<%-- <jsp:include page="/static/proscenium/commons/bottom.jsp"></jsp:include> --%>

<jsp:include page="/static/proscenium/commons/scroll.jsp"></jsp:include>
<!--	***********************************************  -->
<script src="${path }/static/proscenium/js/jquery.min.js"></script>
<script src="${path }/static/proscenium/js/bootstrap.min.js"></script>
<script src="${path }/static/proscenium/plugin/goup/jquery.goup.min.js"></script>
<script src="${path }/static/proscenium/js/app.js"></script>
</body>
</html>