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
	String cw_sgdwgjs_jsjlh=null;
	String cw_sgdwgjs_khbh=null;
	String cw_sgdwgjs_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_sgdwgjs_sgbz=null;
	String cw_sgdwgjs_htjcbj=null;
	String cw_sgdwgjs_zjxjcbj=null;
	String cw_sgdwgjs_ljqyf=null;
	String cw_sgdwgjs_djazf=null;
	String cw_sgdwgjs_jsjs=null;
	String cw_sgdwgjs_jsbl=null;
	String cw_sgdwgjs_tzjsbl=null;
	String cw_sgdwgjs_sdlje=null;
	String cw_sgdwgjs_sdljsbl=null;
	String cw_sgdwgjs_jsje=null;
	String cw_sgdwgjs_clf=null;
	String cw_sgdwgjs_clyf=null;
	String cw_sgdwgjs_gdyp=null;
	String cw_sgdwgjs_yfgck=null;
	String cw_sgdwgjs_kzbjjbl=null;
	String cw_sgdwgjs_kzbj=null;
	String cw_sgdwgjs_clfk=null;
	String cw_sgdwgjs_jfje=null;
	String cw_sgdwgjs_yfje=null;
	String cw_sgdwgjs_jsrq=null;
	String cw_sgdwgjs_clzt=null;
	String cw_sgdwgjs_lrr=null;
	String cw_sgdwgjs_lrsj=null;
	String cw_sgdwgjs_lrbm=null;
	cw_sgdwgjs_jsjlh=request.getParameter("cw_sgdwgjs_jsjlh");
	if (cw_sgdwgjs_jsjlh!=null)
	{
		cw_sgdwgjs_jsjlh=cf.GB2Uni(cw_sgdwgjs_jsjlh);
		if (!(cw_sgdwgjs_jsjlh.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsjlh='"+cw_sgdwgjs_jsjlh+"')";
	}
	cw_sgdwgjs_khbh=request.getParameter("cw_sgdwgjs_khbh");
	if (cw_sgdwgjs_khbh!=null)
	{
		cw_sgdwgjs_khbh=cf.GB2Uni(cw_sgdwgjs_khbh);
		if (!(cw_sgdwgjs_khbh.equals("")))	wheresql+=" and  (cw_sgdwgjs.khbh='"+cw_sgdwgjs_khbh+"')";
	}
	cw_sgdwgjs_sgd=request.getParameter("cw_sgdwgjs_sgd");
	if (cw_sgdwgjs_sgd!=null)
	{
		cw_sgdwgjs_sgd=cf.GB2Uni(cw_sgdwgjs_sgd);
		if (!(cw_sgdwgjs_sgd.equals("")))	wheresql+=" and  (cw_sgdwgjs.sgd='"+cw_sgdwgjs_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_sgdwgjs_sgbz=request.getParameter("cw_sgdwgjs_sgbz");
	if (cw_sgdwgjs_sgbz!=null)
	{
		cw_sgdwgjs_sgbz=cf.GB2Uni(cw_sgdwgjs_sgbz);
		if (!(cw_sgdwgjs_sgbz.equals("")))	wheresql+=" and  (cw_sgdwgjs.sgbz='"+cw_sgdwgjs_sgbz+"')";
	}
	cw_sgdwgjs_htjcbj=request.getParameter("cw_sgdwgjs_htjcbj");
	if (cw_sgdwgjs_htjcbj!=null)
	{
		cw_sgdwgjs_htjcbj=cw_sgdwgjs_htjcbj.trim();
		if (!(cw_sgdwgjs_htjcbj.equals("")))	wheresql+=" and  (cw_sgdwgjs.htjcbj="+cw_sgdwgjs_htjcbj+") ";
	}
	cw_sgdwgjs_zjxjcbj=request.getParameter("cw_sgdwgjs_zjxjcbj");
	if (cw_sgdwgjs_zjxjcbj!=null)
	{
		cw_sgdwgjs_zjxjcbj=cw_sgdwgjs_zjxjcbj.trim();
		if (!(cw_sgdwgjs_zjxjcbj.equals("")))	wheresql+=" and  (cw_sgdwgjs.zjxjcbj="+cw_sgdwgjs_zjxjcbj+") ";
	}
	cw_sgdwgjs_ljqyf=request.getParameter("cw_sgdwgjs_ljqyf");
	if (cw_sgdwgjs_ljqyf!=null)
	{
		cw_sgdwgjs_ljqyf=cw_sgdwgjs_ljqyf.trim();
		if (!(cw_sgdwgjs_ljqyf.equals("")))	wheresql+=" and  (cw_sgdwgjs.ljqyf="+cw_sgdwgjs_ljqyf+") ";
	}
	cw_sgdwgjs_djazf=request.getParameter("cw_sgdwgjs_djazf");
	if (cw_sgdwgjs_djazf!=null)
	{
		cw_sgdwgjs_djazf=cw_sgdwgjs_djazf.trim();
		if (!(cw_sgdwgjs_djazf.equals("")))	wheresql+=" and  (cw_sgdwgjs.djazf="+cw_sgdwgjs_djazf+") ";
	}
	cw_sgdwgjs_jsjs=request.getParameter("cw_sgdwgjs_jsjs");
	if (cw_sgdwgjs_jsjs!=null)
	{
		cw_sgdwgjs_jsjs=cw_sgdwgjs_jsjs.trim();
		if (!(cw_sgdwgjs_jsjs.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsjs="+cw_sgdwgjs_jsjs+") ";
	}
	cw_sgdwgjs_jsbl=request.getParameter("cw_sgdwgjs_jsbl");
	if (cw_sgdwgjs_jsbl!=null)
	{
		cw_sgdwgjs_jsbl=cw_sgdwgjs_jsbl.trim();
		if (!(cw_sgdwgjs_jsbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsbl="+cw_sgdwgjs_jsbl+") ";
	}
	cw_sgdwgjs_tzjsbl=request.getParameter("cw_sgdwgjs_tzjsbl");
	if (cw_sgdwgjs_tzjsbl!=null)
	{
		cw_sgdwgjs_tzjsbl=cw_sgdwgjs_tzjsbl.trim();
		if (!(cw_sgdwgjs_tzjsbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.tzjsbl="+cw_sgdwgjs_tzjsbl+") ";
	}
	cw_sgdwgjs_sdlje=request.getParameter("cw_sgdwgjs_sdlje");
	if (cw_sgdwgjs_sdlje!=null)
	{
		cw_sgdwgjs_sdlje=cw_sgdwgjs_sdlje.trim();
		if (!(cw_sgdwgjs_sdlje.equals("")))	wheresql+=" and  (cw_sgdwgjs.sdlje="+cw_sgdwgjs_sdlje+") ";
	}
	cw_sgdwgjs_sdljsbl=request.getParameter("cw_sgdwgjs_sdljsbl");
	if (cw_sgdwgjs_sdljsbl!=null)
	{
		cw_sgdwgjs_sdljsbl=cw_sgdwgjs_sdljsbl.trim();
		if (!(cw_sgdwgjs_sdljsbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.sdljsbl="+cw_sgdwgjs_sdljsbl+") ";
	}
	cw_sgdwgjs_jsje=request.getParameter("cw_sgdwgjs_jsje");
	if (cw_sgdwgjs_jsje!=null)
	{
		cw_sgdwgjs_jsje=cw_sgdwgjs_jsje.trim();
		if (!(cw_sgdwgjs_jsje.equals("")))	wheresql+=" and  (cw_sgdwgjs.jsje="+cw_sgdwgjs_jsje+") ";
	}
	cw_sgdwgjs_clf=request.getParameter("cw_sgdwgjs_clf");
	if (cw_sgdwgjs_clf!=null)
	{
		cw_sgdwgjs_clf=cw_sgdwgjs_clf.trim();
		if (!(cw_sgdwgjs_clf.equals("")))	wheresql+=" and  (cw_sgdwgjs.clf="+cw_sgdwgjs_clf+") ";
	}
	cw_sgdwgjs_clyf=request.getParameter("cw_sgdwgjs_clyf");
	if (cw_sgdwgjs_clyf!=null)
	{
		cw_sgdwgjs_clyf=cw_sgdwgjs_clyf.trim();
		if (!(cw_sgdwgjs_clyf.equals("")))	wheresql+=" and  (cw_sgdwgjs.clyf="+cw_sgdwgjs_clyf+") ";
	}
	cw_sgdwgjs_gdyp=request.getParameter("cw_sgdwgjs_gdyp");
	if (cw_sgdwgjs_gdyp!=null)
	{
		cw_sgdwgjs_gdyp=cw_sgdwgjs_gdyp.trim();
		if (!(cw_sgdwgjs_gdyp.equals("")))	wheresql+=" and  (cw_sgdwgjs.gdyp="+cw_sgdwgjs_gdyp+") ";
	}
	cw_sgdwgjs_yfgck=request.getParameter("cw_sgdwgjs_yfgck");
	if (cw_sgdwgjs_yfgck!=null)
	{
		cw_sgdwgjs_yfgck=cw_sgdwgjs_yfgck.trim();
		if (!(cw_sgdwgjs_yfgck.equals("")))	wheresql+=" and  (cw_sgdwgjs.yfgck="+cw_sgdwgjs_yfgck+") ";
	}
	cw_sgdwgjs_kzbjjbl=request.getParameter("cw_sgdwgjs_kzbjjbl");
	if (cw_sgdwgjs_kzbjjbl!=null)
	{
		cw_sgdwgjs_kzbjjbl=cw_sgdwgjs_kzbjjbl.trim();
		if (!(cw_sgdwgjs_kzbjjbl.equals("")))	wheresql+=" and  (cw_sgdwgjs.kzbjbl="+cw_sgdwgjs_kzbjjbl+") ";
	}
	cw_sgdwgjs_kzbj=request.getParameter("cw_sgdwgjs_kzbj");
	if (cw_sgdwgjs_kzbj!=null)
	{
		cw_sgdwgjs_kzbj=cw_sgdwgjs_kzbj.trim();
		if (!(cw_sgdwgjs_kzbj.equals("")))	wheresql+=" and  (cw_sgdwgjs.kzbj="+cw_sgdwgjs_kzbj+") ";
	}
	cw_sgdwgjs_clfk=request.getParameter("cw_sgdwgjs_clfk");
	if (cw_sgdwgjs_clfk!=null)
	{
		cw_sgdwgjs_clfk=cw_sgdwgjs_clfk.trim();
		if (!(cw_sgdwgjs_clfk.equals("")))	wheresql+=" and  (cw_sgdwgjs.clfk="+cw_sgdwgjs_clfk+") ";
	}
	cw_sgdwgjs_jfje=request.getParameter("cw_sgdwgjs_jfje");
	if (cw_sgdwgjs_jfje!=null)
	{
		cw_sgdwgjs_jfje=cw_sgdwgjs_jfje.trim();
		if (!(cw_sgdwgjs_jfje.equals("")))	wheresql+=" and  (cw_sgdwgjs.jfje="+cw_sgdwgjs_jfje+") ";
	}
	cw_sgdwgjs_yfje=request.getParameter("cw_sgdwgjs_yfje");
	if (cw_sgdwgjs_yfje!=null)
	{
		cw_sgdwgjs_yfje=cw_sgdwgjs_yfje.trim();
		if (!(cw_sgdwgjs_yfje.equals("")))	wheresql+=" and  (cw_sgdwgjs.yfje="+cw_sgdwgjs_yfje+") ";
	}
	cw_sgdwgjs_jsrq=request.getParameter("cw_sgdwgjs_jsrq");
	if (cw_sgdwgjs_jsrq!=null)
	{
		cw_sgdwgjs_jsrq=cw_sgdwgjs_jsrq.trim();
		if (!(cw_sgdwgjs_jsrq.equals("")))	wheresql+="  and (cw_sgdwgjs.jsrq=TO_DATE('"+cw_sgdwgjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjs_clzt=request.getParameter("cw_sgdwgjs_clzt");
	if (cw_sgdwgjs_clzt!=null)
	{
		cw_sgdwgjs_clzt=cf.GB2Uni(cw_sgdwgjs_clzt);
		if (!(cw_sgdwgjs_clzt.equals("")))	wheresql+=" and  (cw_sgdwgjs.clzt='"+cw_sgdwgjs_clzt+"')";
	}
	cw_sgdwgjs_lrr=request.getParameter("cw_sgdwgjs_lrr");
	if (cw_sgdwgjs_lrr!=null)
	{
		cw_sgdwgjs_lrr=cf.GB2Uni(cw_sgdwgjs_lrr);
		if (!(cw_sgdwgjs_lrr.equals("")))	wheresql+=" and  (cw_sgdwgjs.lrr='"+cw_sgdwgjs_lrr+"')";
	}
	cw_sgdwgjs_lrsj=request.getParameter("cw_sgdwgjs_lrsj");
	if (cw_sgdwgjs_lrsj!=null)
	{
		cw_sgdwgjs_lrsj=cw_sgdwgjs_lrsj.trim();
		if (!(cw_sgdwgjs_lrsj.equals("")))	wheresql+="  and (cw_sgdwgjs.lrsj=TO_DATE('"+cw_sgdwgjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdwgjs_lrbm=request.getParameter("cw_sgdwgjs_lrbm");
	if (cw_sgdwgjs_lrbm!=null)
	{
		cw_sgdwgjs_lrbm=cf.GB2Uni(cw_sgdwgjs_lrbm);
		if (!(cw_sgdwgjs_lrbm.equals("")))	wheresql+=" and  (cw_sgdwgjs.lrbm='"+cw_sgdwgjs_lrbm+"')";
	}
	ls_sql="SELECT cw_sgdwgjs.jsjlh,DECODE(cw_sgdwgjs.clzt,'1','未审批','2','审批'),cw_sgdwgjs.jsrq,cw_sgdwgjs.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_sgdwgjs.sgbz, DECODE(cw_sgdwgjs.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','工程施工成本价','A','工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),cw_sgdwgjs.jsjsze,cw_sgdwgjs.jsbl||'%',cw_sgdwgjs.tzjsbl||'%',DECODE(cw_sgdwgjs.sdljsfs,'1','统一比例结算','2','独立比例结算','3','手工录入结算金额','9','不结算'),cw_sgdwgjs.sdlje,cw_sgdwgjs.sdljsbl||'%',cw_sgdwgjs.sdljsje,cw_sgdwgjs.jsje, DECODE(cw_sgdwgjs.sfkclk,'Y','是','N','否'),cw_sgdwgjs.clf,cw_sgdwgjs.clyf,cw_sgdwgjs.clfk, DECODE(cw_sgdwgjs.sfkgdyp,'Y','是','N','否'),cw_sgdwgjs.gdyp, DECODE(cw_sgdwgjs.sfkyfgf,'Y','是','N','否'),cw_sgdwgjs.yfgck, DECODE(cw_sgdwgjs.sfkzbj,'Y','是','N','否'), DECODE(cw_sgdwgjs.kzbjjs,'1','结算基数','2','结算总额'),cw_sgdwgjs.kzbjbl||'%',cw_sgdwgjs.kzbj,cw_sgdwgjs.fkje,cw_sgdwgjs.jlje,cw_sgdwgjs.qtje,cw_sgdwgjs.yfje,cw_sgdwgjs.htje,cw_sgdwgjs.zjxje,cw_sgdwgjs.qtf,cw_sgdwgjs.qtfsm,cw_sgdwgjs.ssk, cw_sgdwgjs.lrr,cw_sgdwgjs.lrsj,dwmc,cw_sgdwgjs.bz  ";
	ls_sql+=" FROM sq_sgd,cw_sgdwgjs,crm_khxx,sq_dwxx  ";
    ls_sql+=" where cw_sgdwgjs.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdwgjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdwgjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdwgjs.clzt='1'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdwgjs.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdwgjsList.jsp","","","ShCw_sgdwgjs.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sgdwgjs_khbh","sq_sgd_sgdmc","cw_sgdwgjs_sgbz","cw_sgdwgjs_htjcbj","cw_sgdwgjs_zjxjcbj","cw_sgdwgjs_ljqyf","cw_sgdwgjs_djazf","cw_sgdwgjs_jsjs","cw_sgdwgjs_jsbl","cw_sgdwgjs_tzjsbl","cw_sgdwgjs_sdlje","cw_sgdwgjs_sdljsbl","cw_sgdwgjs_jsje","cw_sgdwgjs_clf","cw_sgdwgjs_clyf","cw_sgdwgjs_gdyp","cw_sgdwgjs_yfgck","cw_sgdwgjs_kzbjjbl","cw_sgdwgjs_kzbj","cw_sgdwgjs_clfk","cw_sgdwgjs_jfje","cw_sgdwgjs_yfje","cw_sgdwgjs_jsrq","cw_sgdwgjs_clzt","cw_sgdwgjs_lrr","cw_sgdwgjs_lrsj","cw_sgdwgjs_lrbm","cw_sgdwgjs_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_sgdwgjs.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">施工队完工结算－审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">结算记录号</td>
	<td  width="2%">处理状态</td>
	<td  width="3%">结算日期</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="2%">施工队</td>
	<td  width="2%">现场负责人</td>
	<td  width="4%">结算基数</td>
	<td  width="2%">结算基数总额</td>
	<td  width="2%">结算比例</td>
	<td  width="2%">调整结算比例</td>
	<td  width="3%">水电路结算方式</td>
	<td  width="2%">水电路金额</td>
	<td  width="2%">水电路结算比例</td>
	<td  width="2%">水电路结算金额</td>
	<td  width="2%">结算总额</td>
	<td  width="2%">是否扣材料款</td>
	<td  width="2%">材料费</td>
	<td  width="2%">材料运费</td>
	<td  width="2%">材料罚款</td>
	<td  width="2%">是否扣工地用品</td>
	<td  width="2%">工地用品</td>
	<td  width="2%">是否扣已付工费</td>
	<td  width="2%">已付工程款</td>
	<td  width="2%">是否扣质保金</td>
	<td  width="2%">扣质保金基数</td>
	<td  width="2%">应扣质保金比例</td>
	<td  width="2%">扣质保金</td>
	<td  width="2%">罚款金额</td>
	<td  width="2%">奖励金额</td>
	<td  width="2%">其它金额</td>
	<td  width="2%">应付金额</td>
	<td  width="2%">工程合同额</td>
	<td  width="2%">工程增减项</td>
	<td  width="2%">其它费</td>
	<td  width="7%">其它费说明</td>
	<td  width="2%">实收款</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">录入部门</td>
	<td  width="118%">备注</td>
</tr>
<%
	pageObj.displayDate();
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