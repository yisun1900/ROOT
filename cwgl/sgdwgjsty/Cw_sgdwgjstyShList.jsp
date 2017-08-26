<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}



	String jsjlh=null;
	String sgd=null;
	String sgbz=null;
	String jsrq=null;
	String spzt=null;
	String spr=null;
	String spsj=null;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=cf.GB2Uni(jsjlh);
		if (!(jsjlh.equals("")))	wheresql+=" and  (cw_sgdwgjsty.jsjlh='"+jsjlh+"')";
	}
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sgd='"+sgd+"')";
	}
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (cw_sgdwgjsty.sgbz='"+sgbz+"')";
	}
	jsrq=request.getParameter("jsrq");
	if (jsrq!=null)
	{
		jsrq=jsrq.trim();
		if (!(jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsty.jsrq>=TO_DATE('"+jsrq+"','YYYY/MM/DD'))";
	}
	jsrq=request.getParameter("jsrq2");
	if (jsrq!=null)
	{
		jsrq=jsrq.trim();
		if (!(jsrq.equals("")))	wheresql+="  and (cw_sgdwgjsty.jsrq<=TO_DATE('"+jsrq+"','YYYY/MM/DD'))";
	}

	spzt=request.getParameter("spzt");
	if (spzt!=null)
	{
		spzt=cf.GB2Uni(spzt);
		if (!(spzt.equals("")))	wheresql+=" and  (cw_sgdwgjsty.spzt='"+spzt+"')";
	}
	spr=request.getParameter("spr");
	if (spr!=null)
	{
		spr=cf.GB2Uni(spr);
		if (!(spr.equals("")))	wheresql+=" and  (cw_sgdwgjsty.spr='"+spr+"')";
	}
	spsj=request.getParameter("spsj");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.spsj>=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	spsj=request.getParameter("spsj2");
	if (spsj!=null)
	{
		spsj=spsj.trim();
		if (!(spsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.spsj<=TO_DATE('"+spsj+"','YYYY/MM/DD'))";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (cw_sgdwgjsty.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (cw_sgdwgjsty.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (cw_sgdwgjsty.lrbm='"+lrbm+"')";
	}
	ls_sql =" SELECT cw_sgdwgjsty.jsjlh,cw_sgdwgjsty.khbh,sgdmc,cw_sgdwgjsty.sgbz,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,cw_sgdwgjsty.htgcf,cw_sgdwgjsty.htqtsf,cw_sgdwgjsty.gcfzjx,cw_sgdwgjsty.qtsfzjx,cw_sgdwgjsty.qtfsm";
	ls_sql+=" ,cw_sgdwgjsty.htsgcb,cw_sgdwgjsty.zjxsgcb,cw_sgdwgjsty.ljclf,cw_sgdwgjsty.ljrgf,cw_sgdwgjsty.ssk,cw_sgdwgjsty.jsyh";
	ls_sql+=" ,cw_sgdwgjsty.khpck,cw_sgdwgjsty.yqf,cw_sgdwgjsty.khqk,dm_jsjsbm.jsjsmc,cw_sgdwgjsty.htjsjs,cw_sgdwgjsty.zjxjsjs,cw_sgdwgjsty.jsjsxjje";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.sdljsfs,'1','不独立结算','2','独立比例不可改','3','独立比例可改','4','手工录入结算金额') sdljsfs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.sdlqz ,'1','折前','2','折后','3','施工成本价') sdlqz,cw_sgdwgjsty.sdlje,cw_sgdwgjsty.sdljsbl";
	ls_sql+=" ,cw_sgdwgjsty.sdljsje,DECODE(cw_sgdwgjsty.zjxjffs,'1','不奖罚','2','累计折后增减项金额','3','累计增减项施工成本','4','折后增项金额减项金额','5','增项施工成本减项施工成本','6','增项施工成本折后减项金额','7','折后增项金额减项施工成本') zjxjffs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zjxbhfw,'1','工程','2','其它费','3','工程＋其它费','4','工程(含水电)','5','工程＋其它费(含水电)') zjxbhfw";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zjxsjd,'1','全部','2','开工前','3','开工后') zjxsjd,cw_sgdwgjsty.ljzjxxs,cw_sgdwgjsty.ljzjxje";
	ls_sql+=" ,cw_sgdwgjsty.zxxs,cw_sgdwgjsty.zxje,cw_sgdwgjsty.jxxs,cw_sgdwgjsty.jxje,DECODE(cw_sgdwgjsty.sfkyqpc,'Y','自动获取','S','人工录入','N','否') sfkyqpc";
	ls_sql+=" ,cw_sgdwgjsty.kyqf,cw_sgdwgjsty.kkhpck,cw_sgdwgjsty.kkhqk,DECODE(cw_sgdwgjsty.zcsfjs,'1','不结算','2','按比例结算','3','人工录入') zcsfjs";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.zcjehqfs,'1','自动获取','2','人工录入') zcjehqfs,DECODE(cw_sgdwgjsty.zcjsblkg,'1','可修改','2','不可修改') zcjsblkg";
	ls_sql+=" ,cw_sgdwgjsty.zcjsbl,cw_sgdwgjsty.zcje,cw_sgdwgjsty.zcjsje,cw_sgdwgjsty.jsjsze,cw_sgdwgjsty.jsbl,cw_sgdwgjsty.tzjsbl";
	ls_sql+=" ,cw_sgdwgjsty.jsje,cw_sgdwgjsty.rgfjse,cw_sgdwgjsty.flfjse,DECODE(cw_sgdwgjsty.sfkclk,'Y','是','N','否') sfkclk";
	ls_sql+=" ,cw_sgdwgjsty.clf,DECODE(cw_sgdwgjsty.sfkgdyp,'Y','是','N','否') sfkgdyp,cw_sgdwgjsty.gdyp,DECODE(cw_sgdwgjsty.sfkyfgf,'Y','是','N','否') sfkyfgf";
	ls_sql+=" ,cw_sgdwgjsty.yfgf,DECODE(cw_sgdwgjsty.sfkzbj,'Y','扣质保金比例不可改','M','扣质保金比例可改','N','不扣质保金') sfkzbj";
	ls_sql+=" ,DECODE(cw_sgdwgjsty.kzbjjs,'1','结算基数','2','结算总额') kzbjjs,cw_sgdwgjsty.kzbjbl,cw_sgdwgjsty.kzbj,DECODE(cw_sgdwgjsty.sfkclfk,'Y','自动获取','S','人工录入','N','否') sfkclfk ";
	ls_sql+=" ,cw_sgdwgjsty.clfk,DECODE(cw_sgdwgjsty.sfkclyf,'Y','自动获取','S','人工录入','N','否') sfkclyf,cw_sgdwgjsty.clyf,DECODE(cw_sgdwgjsty.sfkzckk,'Y','自动获取','S','人工录入','N','否') sfkzckk,cw_sgdwgjsty.zckk,DECODE(cw_sgdwgjsty.sfjzcjl,'Y','自动获取','S','人工录入','N','否') sfjzcjl";
	ls_sql+=" ,cw_sgdwgjsty.zcjl,DECODE(cw_sgdwgjsty.sfkfkje,'Y','自动获取','S','人工录入','N','否') sfkfkje,cw_sgdwgjsty.fkje,DECODE(cw_sgdwgjsty.sfjjlje,'Y','自动获取','S','人工录入','N','否') sfjjlje,cw_sgdwgjsty.jlje,DECODE(cw_sgdwgjsty.sfjqtje,'Y','自动获取','S','人工录入','N','否') sfjqtje,cw_sgdwgjsty.qtje,cw_sgdwgjsty.yfje";
	ls_sql+=" ,cw_sgdwgjsty.jsrq,DECODE(cw_sgdwgjsty.spzt,'1','未审批','2','审批同意','3','审批不同意') spztmc,cw_sgdwgjsty.spr,cw_sgdwgjsty.spsj,cw_sgdwgjsty.spyj,cw_sgdwgjsty.lrr,cw_sgdwgjsty.lrsj,sq_dwxx.dwmc,cw_sgdwgjsty.bz  ";
	ls_sql+=" FROM crm_khxx,cw_sgdwgjsty,sq_sgd,sq_dwxx,bdm_bjjbbm,dm_jsjsbm  ";
    ls_sql+=" where cw_sgdwgjsty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdwgjsty.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjsty.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and cw_sgdwgjsty.jsjs=dm_jsjsbm.jsjsbm(+)";
    ls_sql+=" and cw_sgdwgjsty.spzt='1'";
    ls_sql+=" and crm_khxx.gdjsjd='Y'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdwgjsty.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdwgjstyShList.jsp","","","ShCw_sgdwgjsty.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","sgd","sgbz","jsrq","ysglk","zjsge","cfje","jsglk","rgfbfb","yfrgf","bcrgf","flkbfb","ycflk","bcflk","gsfl","psfl","kzbjbl","kzbj","fk","kqtk","kqtksm","bcfkhj","lx","spzt","spr","spsj","spyj","lrr","lrsj","lrbm","bz","bx","pck"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");
//设置按钮参数
	String[] buttonName={"批量审核"};//按钮的显示名称
	String[] buttonLink={"SavePlSh.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/sgdwgjsty/ViewCw_sgdwgjsty.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">结算审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(900);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="1%">结算记录号</td>
	<td  width="1%">客户编号</td>
	<td  width="1%">施工队</td>
	<td  width="1%">现场负责人</td>
	<td  width="1%">客户姓名</td>
	<td  width="3%">房屋地址</td>
	<td  width="1%">合同工程额</td>
	<td  width="1%">合同其它收费</td>
	<td  width="1%">工程费增减项</td>
	<td  width="1%">其它费增减项</td>
	<td  width="3%">其它费说明</td>
	<td  width="1%">合同工施工成本</td>
	<td  width="1%">增减项施工成本</td>
	<td  width="1%">累计材料费</td>
	<td  width="1%">累计人工费</td>
	<td  width="1%">实收款</td>
	<td  width="1%">客户结算优惠</td>
	<td  width="1%">客户赔偿款</td>
	<td  width="1%">延期费</td>
	<td  width="1%">客户欠款</td>
	<td  width="2%">结算基数</td>
	<td  width="1%">合同结算基数</td>
	<td  width="1%">增减项结算基数</td>
	<td  width="1%">结算基数金额</td>
	<td  width="1%">水电路结算方式</td>
	<td  width="1%">水电路取值</td>
	<td  width="1%">水电路金额</td>
	<td  width="1%">水电路结算比例</td>
	<td  width="1%">水电路结算金额</td>
	<td  width="1%">增减项奖罚方式</td>
	<td  width="1%">增减项包含范围</td>
	<td  width="1%">增减项时间点</td>
	<td  width="1%">累计增减项系数</td>
	<td  width="1%">累计增减项</td>
	<td  width="1%">增项系数</td>
	<td  width="1%">增项金额</td>
	<td  width="1%">减项系数</td>
	<td  width="1%">减项金额</td>
	<td  width="1%">是否扣延期费赔偿款</td>
	<td  width="1%">扣延期费</td>
	<td  width="1%">扣客户赔偿款</td>
	<td  width="1%">扣客户欠款</td>
	<td  width="1%">主材是否结算</td>
	<td  width="1%">主材金额获取方式</td>
	<td  width="1%">主材结算比例可修改</td>
	<td  width="1%">主材结算比例</td>
	<td  width="1%">主材金额</td>
	<td  width="1%">主材结算金额</td>
	<td  width="1%">结算基数总额</td>
	<td  width="1%">结算比例</td>
	<td  width="1%">调整结算比例</td>
	<td  width="1%">结算总额</td>
	<td  width="1%">人工费结算额</td>
	<td  width="1%">辅料费结算额</td>
	<td  width="1%">是否扣材料款</td>
	<td  width="1%">材料费</td>
	<td  width="1%">是否扣工地用品</td>
	<td  width="1%">工地用品</td>
	<td  width="1%">是否扣已付工费</td>
	<td  width="1%">已付工费</td>
	<td  width="1%">是否扣质保金</td>
	<td  width="1%">扣质保金基数</td>
	<td  width="1%">扣质保金比例</td>
	<td  width="1%">扣质保金</td>
	<td  width="1%">是否扣辅材罚款</td>
	<td  width="1%">辅材罚款</td>
	<td  width="1%">是否扣材料运费</td>
	<td  width="1%">材料运费</td>
	<td  width="1%">是否扣主材扣款</td>
	<td  width="1%">主材扣款</td>
	<td  width="1%">是否加主材奖励</td>
	<td  width="1%">主材奖励</td>
	<td  width="1%">是否扣罚款金额</td>
	<td  width="1%">罚款金额</td>
	<td  width="1%">是否加奖励金额</td>
	<td  width="1%">奖励金额</td>
	<td  width="1%">是否加其它金额</td>
	<td  width="1%">其它金额</td>
	<td  width="1%">应付金额</td>
	<td  width="1%">结算日期</td>
	<td  width="1%">审批状态</td>
	<td  width="1%">审批人</td>
	<td  width="1%">审批时间</td>
	<td  width="2%">审批意见</td>
	<td  width="1%">录入人</td>
	<td  width="1%">录入时间</td>
	<td  width="2%">录入部门</td>
	<td  width="81%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>