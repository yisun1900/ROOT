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
	String crm_tdjdj_tdjxh=null;
	String crm_tdjdj_khbh=null;
	String crm_tdjdj_khxm=null;
	String crm_tdjdj_fwdz=null;
	String crm_tdjdj_dh=null;
	String crm_tdjdj_sjs=null;
	String crm_tdjdj_tdjyybm=null;
	String crm_tdjdj_tdjyysm=null;
	String crm_tdjdj_ytje=null;
	String crm_tdjdj_stje=null;
	String crm_tdjdj_dwbh=null;
	String crm_tdjdj_lrr=null;
	String crm_tdjdj_lrsj=null;
	crm_tdjdj_tdjxh=request.getParameter("crm_tdjdj_tdjxh");
	if (crm_tdjdj_tdjxh!=null)
	{
		crm_tdjdj_tdjxh=cf.GB2Uni(crm_tdjdj_tdjxh);
		if (!(crm_tdjdj_tdjxh.equals("")))	wheresql+=" and  (crm_tdjdj.tdjxh='"+crm_tdjdj_tdjxh+"')";
	}
	crm_tdjdj_khbh=request.getParameter("crm_tdjdj_khbh");
	if (crm_tdjdj_khbh!=null)
	{
		crm_tdjdj_khbh=cf.GB2Uni(crm_tdjdj_khbh);
		if (!(crm_tdjdj_khbh.equals("")))	wheresql+=" and  (crm_tdjdj.khbh='"+crm_tdjdj_khbh+"')";
	}
	crm_tdjdj_khxm=request.getParameter("crm_tdjdj_khxm");
	if (crm_tdjdj_khxm!=null)
	{
		crm_tdjdj_khxm=cf.GB2Uni(crm_tdjdj_khxm);
		if (!(crm_tdjdj_khxm.equals("")))	wheresql+=" and  (crm_tdjdj.khxm='"+crm_tdjdj_khxm+"')";
	}
	crm_tdjdj_fwdz=request.getParameter("crm_tdjdj_fwdz");
	if (crm_tdjdj_fwdz!=null)
	{
		crm_tdjdj_fwdz=cf.GB2Uni(crm_tdjdj_fwdz);
		if (!(crm_tdjdj_fwdz.equals("")))	wheresql+=" and  (crm_tdjdj.fwdz='"+crm_tdjdj_fwdz+"')";
	}
	crm_tdjdj_dh=request.getParameter("crm_tdjdj_dh");
	if (crm_tdjdj_dh!=null)
	{
		crm_tdjdj_dh=cf.GB2Uni(crm_tdjdj_dh);
		if (!(crm_tdjdj_dh.equals("")))	wheresql+=" and  (crm_tdjdj.dh='"+crm_tdjdj_dh+"')";
	}
	crm_tdjdj_sjs=request.getParameter("crm_tdjdj_sjs");
	if (crm_tdjdj_sjs!=null)
	{
		crm_tdjdj_sjs=cf.GB2Uni(crm_tdjdj_sjs);
		if (!(crm_tdjdj_sjs.equals("")))	wheresql+=" and  (crm_tdjdj.sjs='"+crm_tdjdj_sjs+"')";
	}
	crm_tdjdj_tdjyybm=request.getParameter("crm_tdjdj_tdjyybm");
	if (crm_tdjdj_tdjyybm!=null)
	{
		crm_tdjdj_tdjyybm=cf.GB2Uni(crm_tdjdj_tdjyybm);
		if (!(crm_tdjdj_tdjyybm.equals("")))	wheresql+=" and  (crm_tdjdj.tdjyybm='"+crm_tdjdj_tdjyybm+"')";
	}
	crm_tdjdj_tdjyysm=request.getParameter("crm_tdjdj_tdjyysm");
	if (crm_tdjdj_tdjyysm!=null)
	{
		crm_tdjdj_tdjyysm=cf.GB2Uni(crm_tdjdj_tdjyysm);
		if (!(crm_tdjdj_tdjyysm.equals("")))	wheresql+=" and  (crm_tdjdj.tdjyysm='"+crm_tdjdj_tdjyysm+"')";
	}
	crm_tdjdj_ytje=request.getParameter("crm_tdjdj_ytje");
	if (crm_tdjdj_ytje!=null)
	{
		crm_tdjdj_ytje=crm_tdjdj_ytje.trim();
		if (!(crm_tdjdj_ytje.equals("")))	wheresql+=" and  (crm_tdjdj.ytje="+crm_tdjdj_ytje+") ";
	}
	crm_tdjdj_stje=request.getParameter("crm_tdjdj_stje");
	if (crm_tdjdj_stje!=null)
	{
		crm_tdjdj_stje=crm_tdjdj_stje.trim();
		if (!(crm_tdjdj_stje.equals("")))	wheresql+=" and  (crm_tdjdj.stje="+crm_tdjdj_stje+") ";
	}
	crm_tdjdj_dwbh=request.getParameter("crm_tdjdj_dwbh");
	if (crm_tdjdj_dwbh!=null)
	{
		crm_tdjdj_dwbh=cf.GB2Uni(crm_tdjdj_dwbh);
		if (!(crm_tdjdj_dwbh.equals("")))	wheresql+=" and  (crm_tdjdj.dwbh='"+crm_tdjdj_dwbh+"')";
	}
	crm_tdjdj_lrr=request.getParameter("crm_tdjdj_lrr");
	if (crm_tdjdj_lrr!=null)
	{
		crm_tdjdj_lrr=cf.GB2Uni(crm_tdjdj_lrr);
		if (!(crm_tdjdj_lrr.equals("")))	wheresql+=" and  (crm_tdjdj.lrr='"+crm_tdjdj_lrr+"')";
	}
	crm_tdjdj_lrsj=request.getParameter("crm_tdjdj_lrsj");
	if (crm_tdjdj_lrsj!=null)
	{
		crm_tdjdj_lrsj=crm_tdjdj_lrsj.trim();
		if (!(crm_tdjdj_lrsj.equals("")))	wheresql+="  and (crm_tdjdj.lrsj>=TO_DATE('"+crm_tdjdj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tdjdj_lrsj=request.getParameter("crm_tdjdj_lrsj2");
	if (crm_tdjdj_lrsj!=null)
	{
		crm_tdjdj_lrsj=crm_tdjdj_lrsj.trim();
		if (!(crm_tdjdj_lrsj.equals("")))	wheresql+="  and (crm_tdjdj.lrsj<=TO_DATE('"+crm_tdjdj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_tdjdj.tdjxh,crm_tdjdj.khbh,crm_tdjdj.khxm,crm_tdjdj.fwdz,crm_tdjdj.dh,crm_tdjdj.sjs,dm_tdjyybm.tdjyymc,crm_tdjdj.tdjyysm,crm_tdjdj.ytje,crm_tdjdj.stje,crm_tdjdj.dwbh,crm_tdjdj.lrr,crm_tdjdj.lrsj  ";
	ls_sql+=" FROM crm_tdjdj,dm_tdjyybm  ";
    ls_sql+=" where crm_tdjdj.tdjyybm=dm_tdjyybm.tdjyybm";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tdjdjCxList.jsp","SelectCxCrm_tdjdj.jsp","ViewCrm_tdjdj.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tdjxh","crm_tdjdj_khbh","crm_tdjdj_khxm","crm_tdjdj_fwdz","crm_tdjdj_dh","crm_tdjdj_sjs","dm_tdjyybm_tdjyymc","crm_tdjdj_tdjyysm","crm_tdjdj_ytje","crm_tdjdj_stje","crm_tdjdj_dwbh","crm_tdjdj_lrr","crm_tdjdj_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tdjxh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="6%">退订金序号</td>
	<td  width="6%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="6%">电话</td>
	<td  width="6%">设计师</td>
	<td  width="6%">退订金原因</td>
	<td  width="6%">退订金原因说明</td>
	<td  width="6%">应退金额</td>
	<td  width="6%">实退金额</td>
	<td  width="6%">录入单位</td>
	<td  width="6%">录入人</td>
	<td  width="6%">录入时间</td>
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