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
	
	
	String cw_sgdbgfty_jsjlh=null;
	String cw_sgdbgfty_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_sgdbgfty_sgbz=null;
	String cw_sgdbgfty_jsrq=null;
	String cw_sgdbgfty_jsbl=null;
	String cw_sgdbgfty_jsje=null;
	String cw_sgdbgfty_clf=null;
	String cw_sgdbgfty_gdyp=null;
	String cw_sgdbgfty_sjbk=null;
	String cw_sgdbgfty_lx=null;
	String cw_sgdbgfty_lrr=null;
	String cw_sgdbgfty_lrsj=null;
	String cw_sgdbgfty_lrbm=null;
	String cw_sgdbgfty_jsjs=null;
	cw_sgdbgfty_jsjlh=request.getParameter("cw_sgdbgfty_jsjlh");
	if (cw_sgdbgfty_jsjlh!=null)
	{
		cw_sgdbgfty_jsjlh=cf.GB2Uni(cw_sgdbgfty_jsjlh);
		if (!(cw_sgdbgfty_jsjlh.equals("")))	wheresql+=" and  (cw_sgdbgfty.jsjlh='"+cw_sgdbgfty_jsjlh+"')";
	}
	cw_sgdbgfty_sgd=request.getParameter("cw_sgdbgfty_sgd");
	if (cw_sgdbgfty_sgd!=null)
	{
		cw_sgdbgfty_sgd=cf.GB2Uni(cw_sgdbgfty_sgd);
		if (!(cw_sgdbgfty_sgd.equals("")))	wheresql+=" and  (cw_sgdbgfty.sgd='"+cw_sgdbgfty_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_sgdbgfty_sgbz=request.getParameter("cw_sgdbgfty_sgbz");
	if (cw_sgdbgfty_sgbz!=null)
	{
		cw_sgdbgfty_sgbz=cf.GB2Uni(cw_sgdbgfty_sgbz);
		if (!(cw_sgdbgfty_sgbz.equals("")))	wheresql+=" and  (cw_sgdbgfty.sgbz='"+cw_sgdbgfty_sgbz+"')";
	}
	cw_sgdbgfty_jsrq=request.getParameter("cw_sgdbgfty_jsrq");
	if (cw_sgdbgfty_jsrq!=null)
	{
		cw_sgdbgfty_jsrq=cw_sgdbgfty_jsrq.trim();
		if (!(cw_sgdbgfty_jsrq.equals("")))	wheresql+="  and (cw_sgdbgfty.jsrq>=TO_DATE('"+cw_sgdbgfty_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdbgfty_jsrq=request.getParameter("cw_sgdbgfty_jsrq2");
	if (cw_sgdbgfty_jsrq!=null)
	{
		cw_sgdbgfty_jsrq=cw_sgdbgfty_jsrq.trim();
		if (!(cw_sgdbgfty_jsrq.equals("")))	wheresql+="  and (cw_sgdbgfty.jsrq<=TO_DATE('"+cw_sgdbgfty_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdbgfty_jsbl=request.getParameter("cw_sgdbgfty_jsbl");
	if (cw_sgdbgfty_jsbl!=null)
	{
		cw_sgdbgfty_jsbl=cw_sgdbgfty_jsbl.trim();
		if (!(cw_sgdbgfty_jsbl.equals("")))	wheresql+=" and  (cw_sgdbgfty.jsbl="+cw_sgdbgfty_jsbl+") ";
	}
	cw_sgdbgfty_jsje=request.getParameter("cw_sgdbgfty_jsje");
	if (cw_sgdbgfty_jsje!=null)
	{
		cw_sgdbgfty_jsje=cw_sgdbgfty_jsje.trim();
		if (!(cw_sgdbgfty_jsje.equals("")))	wheresql+=" and  (cw_sgdbgfty.jsje="+cw_sgdbgfty_jsje+") ";
	}
	cw_sgdbgfty_clf=request.getParameter("cw_sgdbgfty_clf");
	if (cw_sgdbgfty_clf!=null)
	{
		cw_sgdbgfty_clf=cw_sgdbgfty_clf.trim();
		if (!(cw_sgdbgfty_clf.equals("")))	wheresql+=" and  (cw_sgdbgfty.clf="+cw_sgdbgfty_clf+") ";
	}
	cw_sgdbgfty_gdyp=request.getParameter("cw_sgdbgfty_gdyp");
	if (cw_sgdbgfty_gdyp!=null)
	{
		cw_sgdbgfty_gdyp=cw_sgdbgfty_gdyp.trim();
		if (!(cw_sgdbgfty_gdyp.equals("")))	wheresql+=" and  (cw_sgdbgfty.gdyp="+cw_sgdbgfty_gdyp+") ";
	}
	cw_sgdbgfty_sjbk=request.getParameter("cw_sgdbgfty_sjbk");
	if (cw_sgdbgfty_sjbk!=null)
	{
		cw_sgdbgfty_sjbk=cw_sgdbgfty_sjbk.trim();
		if (!(cw_sgdbgfty_sjbk.equals("")))	wheresql+=" and  (cw_sgdbgfty.sjbk="+cw_sgdbgfty_sjbk+") ";
	}
	cw_sgdbgfty_lx=request.getParameter("cw_sgdbgfty_lx");
	if (cw_sgdbgfty_lx!=null)
	{
		cw_sgdbgfty_lx=cf.GB2Uni(cw_sgdbgfty_lx);
		if (!(cw_sgdbgfty_lx.equals("")))	wheresql+=" and  (cw_sgdbgfty.gdjsjd='"+cw_sgdbgfty_lx+"')";
	}
	cw_sgdbgfty_lrr=request.getParameter("cw_sgdbgfty_lrr");
	if (cw_sgdbgfty_lrr!=null)
	{
		cw_sgdbgfty_lrr=cf.GB2Uni(cw_sgdbgfty_lrr);
		if (!(cw_sgdbgfty_lrr.equals("")))	wheresql+=" and  (cw_sgdbgfty.lrr='"+cw_sgdbgfty_lrr+"')";
	}
	cw_sgdbgfty_lrsj=request.getParameter("cw_sgdbgfty_lrsj");
	if (cw_sgdbgfty_lrsj!=null)
	{
		cw_sgdbgfty_lrsj=cw_sgdbgfty_lrsj.trim();
		if (!(cw_sgdbgfty_lrsj.equals("")))	wheresql+="  and (cw_sgdbgfty.lrsj>=TO_DATE('"+cw_sgdbgfty_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdbgfty_lrsj=request.getParameter("cw_sgdbgfty_lrsj2");
	if (cw_sgdbgfty_lrsj!=null)
	{
		cw_sgdbgfty_lrsj=cw_sgdbgfty_lrsj.trim();
		if (!(cw_sgdbgfty_lrsj.equals("")))	wheresql+="  and (cw_sgdbgfty.lrsj<=TO_DATE('"+cw_sgdbgfty_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdbgfty_lrbm=request.getParameter("cw_sgdbgfty_lrbm");
	if (cw_sgdbgfty_lrbm!=null)
	{
		cw_sgdbgfty_lrbm=cf.GB2Uni(cw_sgdbgfty_lrbm);
		if (!(cw_sgdbgfty_lrbm.equals("")))	wheresql+=" and  (cw_sgdbgfty.lrbm='"+cw_sgdbgfty_lrbm+"')";
	}
	cw_sgdbgfty_jsjs=request.getParameter("cw_sgdbgfty_jsjs");
	if (cw_sgdbgfty_jsjs!=null)
	{
		cw_sgdbgfty_jsjs=cf.GB2Uni(cw_sgdbgfty_jsjs);
		if (!(cw_sgdbgfty_jsjs.equals("")))	wheresql+=" and  (cw_sgdbgfty.jsjs='"+cw_sgdbgfty_jsjs+"')";
	}

	ls_sql="SELECT cw_sgdbgfty.jsjlh,cw_sgdbgfty.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_sgdbgfty.sgbz,cw_sgdbgfty.spr,cw_sgdbgfty.spsj,gdjsjdmc,cw_sgdbgfty.jsrq,cw_sgdbgfty.htje,cw_sgdbgfty.zjxje, DECODE(cw_sgdbgfty.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','最新工程施工成本价','A','最新工程施工成本价＋其它费施工成本','D','合同工程施工成本价','E','合同工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),cw_sgdbgfty.jsjsze,cw_sgdbgfty.jsbl||'%',cw_sgdbgfty.jsje,cw_sgdbgfty.clf,cw_sgdbgfty.gdyp,cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.lrsj,dwmc,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,sq_sgd,dm_gdjsjd,sq_dwxx,crm_khxx  ";
    ls_sql+=" where cw_sgdbgfty.sgd=sq_sgd.sgd(+) and cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) and cw_sgdbgfty.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdbgfty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdbgfty.spzt='2'";//1：未审批；2：审批同意；3：审批不同意
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdbgfty.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdbgftyXgShList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sgdbgfty_khbh","sq_sgd_sgdmc","cw_sgdbgfty_sgbz","cw_sgdbgfty_jsrq","cw_sgdbgfty_jsbl","cw_sgdbgfty_jsje","cw_sgdbgfty_clf","cw_sgdbgfty_gdyp","cw_sgdbgfty_sjbk","cw_sgdbgfty_lx","cw_sgdbgfty_lrr","cw_sgdbgfty_lrsj","cw_sgdbgfty_lrbm","cw_sgdbgfty_bz","cw_sgdbgfty_jsjs","cw_sgdbgfty_htje","cw_sgdbgfty_zjxje","cw_sgdbgfty_jsjsze"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");
//设置按钮参数
	String[] buttonName={"删除审核"};//按钮的显示名称
	String[] buttonLink={"DeleteSh.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_sgdbgfty.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">拨工费－修改审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">拨工费记录号</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="3%">施工队</td>
	<td  width="3%">现场负责人</td>
	<td  width="3%">审批人</td>
	<td  width="4%">审批时间</td>
	<td  width="6%">类型</td>
	<td  width="4%">结算日期</td>
	<td  width="5%">合同金额</td>
	<td  width="4%">增减项金额</td>
	<td  width="5%">结算基数</td>
	<td  width="5%">结算基数总额</td>
	<td  width="3%">结算比例</td>
	<td  width="5%">结算金额</td>
	<td  width="4%">材料费</td>
	<td  width="4%">工地用品</td>
	<td  width="5%">实际拨款</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="54%">备注</td>
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