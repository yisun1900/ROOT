<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String wheresql="";

	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计师（<%=sjs%>）(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>

1、工程签约明细
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">设计师</td>
	<td  width="4%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="3%">家装标志</td>
	<td  width="5%">促销活动</td>
	<td  width="6%">工程原报价</td>
	<td  width="3%">折扣率</td>
	<td  width="6%">工程签约额</td>
	<td  width="5%">增减项</td>
	<td  width="6%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="2%">是否返卷</td>
	<td  width="4%">返卷总金额</td>
	<td  width="4%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="5%">认证市场</td>
	<td  width="6%">签约店面</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检员</td>
</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fwdz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


2、木门签约明细
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">序号</td>
	<td  width="2%">预订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">工程进度</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">客户类型</td>
	<td  width="4%">签约店面</td>
	<td  width="2%">家装设计师</td>
	<td  width="2%">合同号</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="5%">联系电话</td>
	<td  width="8%">房屋地址</td>
    <td  width="4%">促销活动</td>
	<td  width="3%">初测日期</td>
	<td  width="3%">签约日期</td>
	<td  width="3%">合同安装日期</td>
	<td  width="3%">协商安装时间</td>
	<td  width="3%">通知安装时间</td>
	<td  width="3%">安装开始日期</td>
	<td  width="3%">安装结束日期</td>
	<td  width="3%">确认退单日期</td>
	<td  width="4%">派单工厂</td>
	<td  width="3%">收取定金</td>
	<td  width="4%">合同金额</td>
	<td  width="4%">增减后总额</td>
	<td  width="3%">五金情况</td>
	<td  width="3%">自购五金件送到公司</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="2%">客户编号</td>
</tr>
<%
	ls_sql="SELECT '', yddbh,clztmc,ysgcjdmc,crm_khxx.khxm,DECODE(jc_mmydd.khlx,'2','家装','4','非家装') khlx,c.dwmc,crm_khxx.sjs,crm_khxx.hth,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,crm_khxx.lxfs,crm_khxx.fwdz,cxhdbm,jc_mmydd.sccsj,jc_mmydd.htrq,jc_mmydd.jhazsj,kazsj,aztzsj,jc_mmydd.azkssj,jc_mmydd.azjssj,jc_mmydd.tdsj,gysmc pdgc,jc_mmydd.sqdj,jc_mmydd.htje,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,DECODE(jc_mmydd.wjsgsbz,'Y','已送公司','N','未送公司') wjsgsbz,jc_mmydd.lrsj,a.dwmc lrdw,jc_mmydd.khbh ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx a,sq_gysxx,sq_dwxx c,jdm_mmyddzt,dm_gcjdbm  ";
    ls_sql+=" where jc_mmydd.dwbh=a.dwbh(+) and jc_mmydd.pdgc=sq_gysxx.gysbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=c.dwbh(+) and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=wheresql;
	ls_sql+=" and jc_mmydd.htrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_mmydd.htrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_mmydd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"yddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


3、橱柜签约明细
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="2%">订单编号</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">工程进度</td>
	<td  width="2%">客户类型</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">合同号</td>
	<td  width="3%">联系电话</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">班长</td>
	<td  width="3%">班长电话</td>
	<td  width="2%">家装设计师</td>
	<td  width="2%">是否需派设计师 </td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">签约店面</td>
    <td  width="2%">促销活动</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">初测日期</td>
	<td  width="2%">复测日期</td>
	<td  width="2%">签约日期</td>
	<td  width="2%">合同安装日期</td>
	<td  width="2%">安装开始日期</td>
	<td  width="2%">安装完成日期</td>
	<td  width="2%">确认退单日期</td>
    <td  width="3%">所派工厂</td>
    <td  width="2%">橱柜款式</td>
    <td  width="2%">箱体板材</td>
    <td  width="2%">橱柜花色</td>
    <td  width="2%">台面品牌</td>
    <td  width="2%">台面花色</td>
    <td  width="2%">玻璃材质</td>
    <td  width="2%">铰链</td>
	<td  width="2%">收取定金</td>
	<td  width="2%">增减后总额</td>
	<td  width="2%">合同总额</td>
	<td  width="2%">柜体合同金额</td>
	<td  width="2%">台面合同金额</td>
	<td  width="2%">五金合同金额</td>
	<td  width="2%">电器合同金额</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="2%">客户编号</td>
</tr>
<%
	ls_sql="SELECT '',jc_cgdd.ddbh,clztmc,ysgcjdmc,DECODE(jc_cgdd.khlx,'2','家装客户','4','非家装客户'),crm_khxx.khxm,crm_khxx.hth,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh,crm_khxx.sjs,DECODE(jc_cgdd.sfpsjs,'1','是','2','否') sfpsjs, jc_cgdd.cgsjs,c.dwmc dm,cxhdbm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,gysmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,jc_cgdd.zjhze,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.lrr,jc_cgdd.lrsj,a.dwmc lrdw,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx a ,sq_dwxx c ,crm_khxx,sq_gysxx,dm_gcjdbm,sq_bzxx";
    ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and jc_cgdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)  ";
	ls_sql+=" and jc_cgdd.pdgc=sq_gysxx.gysbh(+)  and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";

	ls_sql+=wheresql;
	ls_sql+=" and jc_cgdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_cgdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_cgdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


4、家具签约明细
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="2%">订单编号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">工程进度</td>
	<td  width="2%">客户类型</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">合同号</td>
	<td  width="4%">联系电话</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">班长</td>
	<td  width="4%">班长电话</td>
	<td  width="2%">家装设计师</td>
	<td  width="2%">需派设计师</td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">签约店面</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
    <td  width="3%">促销活动</td>
	<td  width="4%">家具工厂</td>
	<td  width="4%">型材门工厂</td>
	<td  width="2%">签约日期</td>
	<td  width="2%">初测日期</td>
	<td  width="2%">合同安装日期</td>
	<td  width="2%">开始安装时间</td>
	<td  width="2%">安装完成日期</td>
	<td  width="2%">确认退单日期</td>
	<td  width="2%">订金</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">家具合同金额</td>
	<td  width="3%">型材门合同金额</td>
	<td  width="3%">增减后总额</td>
	<td  width="3%">家具增减后金额</td>
	<td  width="3%">型材门增减后金额</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="2%">客户编号</td>
</tr>
<%
	ls_sql="SELECT '',jc_jjdd.ddbh,clztmc,ysgcjdmc,DECODE(jc_jjdd.khlx,'2','家装客户','4','非家装客户') as jc_jjdd_khlx ,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.lxfs,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh ,crm_khxx.sjs,DECODE(jc_jjdd.sfpsjs,'1','需要','2','否') sfpsjs,jc_jjdd.jjsjs,b.dwmc dm ,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,cxhdbm,c.gysmc pdgc,d.gysmc xcmgc,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.lrr,jc_jjdd.lrsj,a.dwmc as lrbm,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx a,sq_dwxx b,crm_khxx,sq_gysxx c,sq_gysxx d,sq_bzxx,dm_gcjdbm";
    ls_sql+=" where jc_jjdd.dwbh=a.dwbh(+) and jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=b.dwbh(+) and jc_jjdd.pdgc=c.gysbh(+)and jc_jjdd.xcmgc=d.gysbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";

	ls_sql+=wheresql;
	ls_sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_jjdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_jjdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey3={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey3;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>


5、主材签约明细
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%"> 序号</td>
   	<td  width="2%">订单编号</td>
   	<td  width="3%">订单类型</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">工程进度</td>
	<td  width="3%">主材大类</td>
	<td  width="2%">主材小类</td>
	<td  width="4%">品牌</td>
	<td  width="2%">合同号</td>
	<td  width="2%">客户姓名</td>
	<td  width="5%">联系方式</td>
	<td  width="6%">房屋地址</td>
	<td  width="3%">参加促销活动</td>
	<td  width="2%">家装设计师</td>
	<td  width="3%">签约店面</td>
	<td  width="2%">施工班长</td>
	<td  width="3%">班长电话</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="2%">家居设计师</td>
	<td  width="3%">合同总额</td>
	<td  width="3%">增减项金额</td>
	<td  width="3%">计入促销活动金额</td>
	<td  width="2%">客户交款性质</td>
	<td  width="3%">交款地点</td>
	<td  width="2%">订货日期</td>
	<td  width="2%">合同送货时间</td>
	<td  width="2%">计划送货时间</td>
	<td  width="2%">发送货通知时间</td>
	<td  width="2%">实送货时间</td>
	<td  width="2%">完结时间</td>
	<td  width="2%">通知人员</td>
	<td  width="3%">送货情况</td>
	<td  width="2%">等待送货通知</td>
	<td  width="2%">产品类型</td>
	<td  width="2%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="4%">备注</td>
</tr>
<%
	ls_sql="SELECT '',jc_zcdd.ddbh,DECODE(jc_zcdd.ddlx,'1','系统存在品牌订单','2','不存在品牌订单'),clztmc,ysgcjdmc,zcdlbm,zcxlbm,ppbm,crm_khxx.hth,crm_khxx.khxm,crm_khxx.lxfs,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.htcxhdje, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'),jc_zcdd.qhtsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制','2','定制式产品'),jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";

	ls_sql+=wheresql;
	ls_sql+=" and jc_zcdd.qhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.qhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by jc_zcdd.lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey4={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey4;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>



</body>
</html>