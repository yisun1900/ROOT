<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String crm_khwtclgz_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khwtclgz_wtbh=null;
	String crm_khwtclgz_wtflbm=null;
	String crm_khwtclgz_yqjjsj=null;
	String crm_khwtclgz_slr=null;
	String crm_khwtclgz_slsj=null;
	String crm_khwtclgz_slbm=null;
	String crm_khwtclgz_clzt=null;
	String crm_khwtclgz_clr=null;
	String crm_khwtclgz_clkssj=null;
	String crm_khwtclgz_cljssj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khwtclgz.slbm in(select dwbh from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+fgs+"'))";


	crm_khwtclgz_khbh=request.getParameter("crm_khwtclgz_khbh");
	if (crm_khwtclgz_khbh!=null)
	{
		crm_khwtclgz_khbh=cf.GB2Uni(crm_khwtclgz_khbh);
		if (!(crm_khwtclgz_khbh.equals("")))	wheresql+=" and  (crm_khwtclgz.khbh='"+crm_khwtclgz_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khwtclgz_wtbh=request.getParameter("crm_khwtclgz_wtbh");
	if (crm_khwtclgz_wtbh!=null)
	{
		crm_khwtclgz_wtbh=cf.GB2Uni(crm_khwtclgz_wtbh);
		if (!(crm_khwtclgz_wtbh.equals("")))	wheresql+=" and  (crm_khwtclgz.wtbh='"+crm_khwtclgz_wtbh+"')";
	}
	crm_khwtclgz_wtflbm=request.getParameter("crm_khwtclgz_wtflbm");
	if (crm_khwtclgz_wtflbm!=null)
	{
		crm_khwtclgz_wtflbm=cf.GB2Uni(crm_khwtclgz_wtflbm);
		if (!(crm_khwtclgz_wtflbm.equals("")))	wheresql+=" and  (crm_khwtclgz.wtflbm='"+crm_khwtclgz_wtflbm+"')";
	}
	crm_khwtclgz_yqjjsj=request.getParameter("crm_khwtclgz_yqjjsj");
	if (crm_khwtclgz_yqjjsj!=null)
	{
		crm_khwtclgz_yqjjsj=crm_khwtclgz_yqjjsj.trim();
		if (!(crm_khwtclgz_yqjjsj.equals("")))	wheresql+="  and (crm_khwtclgz.yqjjsj>=TO_DATE('"+crm_khwtclgz_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_khwtclgz_yqjjsj=request.getParameter("crm_khwtclgz_yqjjsj2");
	if (crm_khwtclgz_yqjjsj!=null)
	{
		crm_khwtclgz_yqjjsj=crm_khwtclgz_yqjjsj.trim();
		if (!(crm_khwtclgz_yqjjsj.equals("")))	wheresql+="  and (crm_khwtclgz.yqjjsj<=TO_DATE('"+crm_khwtclgz_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_khwtclgz_slr=request.getParameter("crm_khwtclgz_slr");
	if (crm_khwtclgz_slr!=null)
	{
		crm_khwtclgz_slr=cf.GB2Uni(crm_khwtclgz_slr);
		if (!(crm_khwtclgz_slr.equals("")))	wheresql+=" and  (crm_khwtclgz.slr='"+crm_khwtclgz_slr+"')";
	}
	crm_khwtclgz_slsj=request.getParameter("crm_khwtclgz_slsj");
	if (crm_khwtclgz_slsj!=null)
	{
		crm_khwtclgz_slsj=crm_khwtclgz_slsj.trim();
		if (!(crm_khwtclgz_slsj.equals("")))	wheresql+="  and (crm_khwtclgz.slsj>=TO_DATE('"+crm_khwtclgz_slsj+"','YYYY/MM/DD'))";
	}
	crm_khwtclgz_slsj=request.getParameter("crm_khwtclgz_slsj2");
	if (crm_khwtclgz_slsj!=null)
	{
		crm_khwtclgz_slsj=crm_khwtclgz_slsj.trim();
		if (!(crm_khwtclgz_slsj.equals("")))	wheresql+="  and (crm_khwtclgz.slsj<=TO_DATE('"+crm_khwtclgz_slsj+"','YYYY/MM/DD'))";
	}
	crm_khwtclgz_slbm=request.getParameter("crm_khwtclgz_slbm");
	if (crm_khwtclgz_slbm!=null)
	{
		crm_khwtclgz_slbm=cf.GB2Uni(crm_khwtclgz_slbm);
		if (!(crm_khwtclgz_slbm.equals("")))	wheresql+=" and  (crm_khwtclgz.slbm='"+crm_khwtclgz_slbm+"')";
	}
	crm_khwtclgz_clzt=request.getParameter("crm_khwtclgz_clzt");
	if (crm_khwtclgz_clzt!=null)
	{
		crm_khwtclgz_clzt=cf.GB2Uni(crm_khwtclgz_clzt);
		if (!(crm_khwtclgz_clzt.equals("")))	wheresql+=" and  (crm_khwtclgz.clzt='"+crm_khwtclgz_clzt+"')";
	}
	crm_khwtclgz_clr=request.getParameter("crm_khwtclgz_clr");
	if (crm_khwtclgz_clr!=null)
	{
		crm_khwtclgz_clr=cf.GB2Uni(crm_khwtclgz_clr);
		if (!(crm_khwtclgz_clr.equals("")))	wheresql+=" and  (crm_khwtclgz.clr='"+crm_khwtclgz_clr+"')";
	}
	crm_khwtclgz_clkssj=request.getParameter("crm_khwtclgz_clkssj");
	if (crm_khwtclgz_clkssj!=null)
	{
		crm_khwtclgz_clkssj=crm_khwtclgz_clkssj.trim();
		if (!(crm_khwtclgz_clkssj.equals("")))	wheresql+="  and (crm_khwtclgz.clkssj=TO_DATE('"+crm_khwtclgz_clkssj+"','YYYY/MM/DD'))";
	}
	crm_khwtclgz_cljssj=request.getParameter("crm_khwtclgz_cljssj");
	if (crm_khwtclgz_cljssj!=null)
	{
		crm_khwtclgz_cljssj=crm_khwtclgz_cljssj.trim();
		if (!(crm_khwtclgz_cljssj.equals("")))	wheresql+="  and (crm_khwtclgz.cljssj=TO_DATE('"+crm_khwtclgz_cljssj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_khwtclgz.wtbh,crm_khxx.khxm,crm_khxx.hth,DECODE(crm_khwtclgz.clzt,'1','未处理','2','在处理','3','已解决'),dm_wtflbm.wtflmc,crm_khwtclgz.yqjjsj,crm_khwtclgz.slr,crm_khwtclgz.slsj,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.qyrq,b.dwmc qydm,sgdmc sgd,crm_khxx.zjxm,crm_khwtclgz.wtsm,a.dwmc slbm  ";
	ls_sql+=" FROM crm_khwtclgz,crm_khxx,dm_wtflbm,sq_dwxx a,sq_dwxx b,sq_sgd ";
    ls_sql+=" where crm_khwtclgz.wtflbm=dm_wtflbm.wtflbm(+) and crm_khwtclgz.khbh=crm_khxx.khbh";
	ls_sql+=" and crm_khwtclgz.slbm=a.dwbh and crm_khxx.dwbh=b.dwbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khwtclgz.wtbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khwtclgzClList.jsp","SelectClCrm_khwtclgz.jsp","","ClCrm_khwtclgz.jsp");
	pageObj.setEditStr("处理");//设置每页显示记录数
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_dwbh","crm_khxx_sgd","crm_khxx_zjxm","wtbh","dm_wtflbm_wtflmc","crm_khwtclgz_wtsm","crm_khwtclgz_yqjjsj","crm_khwtclgz_slr","crm_khwtclgz_slsj","crm_khwtclgz_slbm","crm_khwtclgz_clzt"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"wtbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"wtbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_khwtclgz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("wtbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] wtbh = request.getParameterValues("wtbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(wtbh,"wtbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_khwtclgz where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">处理客户问题</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">问题编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="5%">合同号</td>
	<td  width="4%">处理状态</td>
	<td  width="6%">问题分类</td>
	<td  width="4%">要求解决时间</td>
	<td  width="3%">客服受理人</td>
	<td  width="4%">客服受理时间</td>
	<td  width="14%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="4%">签约日期</td>
	<td  width="6%">签约店面</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="25%">问题说明</td>
	<td  width="7%">录入部门</td>
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