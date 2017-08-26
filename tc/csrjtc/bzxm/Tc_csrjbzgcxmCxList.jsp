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
	String tc_csrjbzgcxm_bjbbh=null;
	String tc_csrjbzgcxm_dqbm=null;
	String tc_csrjbzgcxm_bjjbbm=null;
	String tc_csrjbzgcxm_xmbh=null;
	String sfxzsl=null;
	String tc_csrjbzgcxm_lrr=null;
	String tc_csrjbzgcxm_lrsj=null;


	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	tc_csrjbzgcxm_bjbbh=request.getParameter("tc_csrjbzgcxm_bjbbh");
	if (tc_csrjbzgcxm_bjbbh!=null)
	{
		tc_csrjbzgcxm_bjbbh=cf.GB2Uni(tc_csrjbzgcxm_bjbbh);
		if (!(tc_csrjbzgcxm_bjbbh.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.bjbbh='"+tc_csrjbzgcxm_bjbbh+"')";
	}
	tc_csrjbzgcxm_dqbm=request.getParameter("tc_csrjbzgcxm_dqbm");
	if (tc_csrjbzgcxm_dqbm!=null)
	{
		tc_csrjbzgcxm_dqbm=cf.GB2Uni(tc_csrjbzgcxm_dqbm);
		if (!(tc_csrjbzgcxm_dqbm.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.dqbm='"+tc_csrjbzgcxm_dqbm+"')";
	}
	tc_csrjbzgcxm_bjjbbm=request.getParameter("tc_csrjbzgcxm_bjjbbm");
	if (tc_csrjbzgcxm_bjjbbm!=null)
	{
		tc_csrjbzgcxm_bjjbbm=cf.GB2Uni(tc_csrjbzgcxm_bjjbbm);
		if (!(tc_csrjbzgcxm_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.bjjbbm='"+tc_csrjbzgcxm_bjjbbm+"')";
	}
	tc_csrjbzgcxm_xmbh=request.getParameter("tc_csrjbzgcxm_xmbh");
	if (tc_csrjbzgcxm_xmbh!=null)
	{
		tc_csrjbzgcxm_xmbh=cf.GB2Uni(tc_csrjbzgcxm_xmbh);
		if (!(tc_csrjbzgcxm_xmbh.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.xmbh='"+tc_csrjbzgcxm_xmbh+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.sfxzsl='"+sfxzsl+"')";
	}
	tc_csrjbzgcxm_lrr=request.getParameter("tc_csrjbzgcxm_lrr");
	if (tc_csrjbzgcxm_lrr!=null)
	{
		tc_csrjbzgcxm_lrr=cf.GB2Uni(tc_csrjbzgcxm_lrr);
		if (!(tc_csrjbzgcxm_lrr.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.lrr='"+tc_csrjbzgcxm_lrr+"')";
	}
	tc_csrjbzgcxm_lrsj=request.getParameter("tc_csrjbzgcxm_lrsj");
	if (tc_csrjbzgcxm_lrsj!=null)
	{
		tc_csrjbzgcxm_lrsj=tc_csrjbzgcxm_lrsj.trim();
		if (!(tc_csrjbzgcxm_lrsj.equals("")))	wheresql+="  and (tc_csrjbzgcxm.lrsj>=TO_DATE('"+tc_csrjbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tc_csrjbzgcxm_lrsj=request.getParameter("tc_csrjbzgcxm_lrsj2");
	if (tc_csrjbzgcxm_lrsj!=null)
	{
		tc_csrjbzgcxm_lrsj=tc_csrjbzgcxm_lrsj.trim();
		if (!(tc_csrjbzgcxm_lrsj.equals("")))	wheresql+="  and (tc_csrjbzgcxm.lrsj<=TO_DATE('"+tc_csrjbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_csrjbzgcxm.bjbbh,tc_csrjbzgcxm.dqbm,dm_dqbm.dqmc,tc_csrjbzgcxm.bjjbbm,bjjbmc,tc_csrjbzgcxm.xmbh,bj_jzbjb.xmmc,tc_csrjbzgcxm.bzsl, DECODE(tc_csrjbzgcxm.sfxzsl,'1','可增项','2','不可增项','3','不控制') sfxzsl,tc_csrjbzgcxm.lrr,tc_csrjbzgcxm.lrsj  ";
	ls_sql+=" FROM tc_csrjbzgcxm,dm_dqbm,bdm_bjjbbm,bj_jzbjb  ";
    ls_sql+=" where tc_csrjbzgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and tc_csrjbzgcxm.dqbm=bj_jzbjb.dqbm(+) and tc_csrjbzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tc_csrjbzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjbzgcxm.dqbm,tc_csrjbzgcxm.bjbbh,tc_csrjbzgcxm.bjjbbm,tc_csrjbzgcxm.xmbh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Tc_csrjbzgcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","bjjbmc","xmbh","xmmc","sfxzsl","bzsl","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"bjbbh","dqbm","bjjbbm","xmbh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">套餐标准工程项目－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="8%">报价版本号</td>
	<td  width="8%">地区</td>
	<td  width="8%">报价级别</td>
	<td  width="9%">项目编号</td>
	<td  width="21%">项目名称</td>
	<td  width="6%">是否限制数量</td>
	<td  width="6%">标准数量</td>
	<td  width="5%">录入人</td>
	<td  width="8%">录入时间</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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