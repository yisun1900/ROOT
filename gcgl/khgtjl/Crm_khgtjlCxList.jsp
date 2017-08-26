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
	String crm_khgtjl_djbh=null;
	String crm_khgtjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khgtjl_gtr=null;
	String crm_khgtjl_gtsj=null;
	String crm_khgtjl_sfxcl=null;
	String crm_khgtjl_clr=null;
	String crm_khgtjl_clsj=null;
	String crm_khgtjl_lrr=null;
	String crm_khgtjl_lrsj=null;
	String crm_khgtjl_lrbm=null;
	crm_khgtjl_djbh=request.getParameter("crm_khgtjl_djbh");
	if (crm_khgtjl_djbh!=null)
	{
		crm_khgtjl_djbh=cf.GB2Uni(crm_khgtjl_djbh);
		if (!(crm_khgtjl_djbh.equals("")))	wheresql+=" and  (crm_khgtjl.djbh='"+crm_khgtjl_djbh+"')";
	}
	crm_khgtjl_khbh=request.getParameter("crm_khgtjl_khbh");
	if (crm_khgtjl_khbh!=null)
	{
		crm_khgtjl_khbh=cf.GB2Uni(crm_khgtjl_khbh);
		if (!(crm_khgtjl_khbh.equals("")))	wheresql+=" and  (crm_khgtjl.khbh='"+crm_khgtjl_khbh+"')";
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
	crm_khgtjl_gtr=request.getParameter("crm_khgtjl_gtr");
	if (crm_khgtjl_gtr!=null)
	{
		crm_khgtjl_gtr=cf.GB2Uni(crm_khgtjl_gtr);
		if (!(crm_khgtjl_gtr.equals("")))	wheresql+=" and  (crm_khgtjl.gtr='"+crm_khgtjl_gtr+"')";
	}
	crm_khgtjl_gtsj=request.getParameter("crm_khgtjl_gtsj");
	if (crm_khgtjl_gtsj!=null)
	{
		crm_khgtjl_gtsj=crm_khgtjl_gtsj.trim();
		if (!(crm_khgtjl_gtsj.equals("")))	wheresql+="  and (crm_khgtjl.gtsj>=TO_DATE('"+crm_khgtjl_gtsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_gtsj=request.getParameter("crm_khgtjl_gtsj2");
	if (crm_khgtjl_gtsj!=null)
	{
		crm_khgtjl_gtsj=crm_khgtjl_gtsj.trim();
		if (!(crm_khgtjl_gtsj.equals("")))	wheresql+="  and (crm_khgtjl.gtsj<=TO_DATE('"+crm_khgtjl_gtsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_sfxcl=request.getParameter("crm_khgtjl_sfxcl");
	if (crm_khgtjl_sfxcl!=null)
	{
		crm_khgtjl_sfxcl=cf.GB2Uni(crm_khgtjl_sfxcl);
		if (!(crm_khgtjl_sfxcl.equals("")))	wheresql+=" and  (crm_khgtjl.sfxcl='"+crm_khgtjl_sfxcl+"')";
	}
	crm_khgtjl_clr=request.getParameter("crm_khgtjl_clr");
	if (crm_khgtjl_clr!=null)
	{
		crm_khgtjl_clr=cf.GB2Uni(crm_khgtjl_clr);
		if (!(crm_khgtjl_clr.equals("")))	wheresql+=" and  (crm_khgtjl.clr='"+crm_khgtjl_clr+"')";
	}
	crm_khgtjl_clsj=request.getParameter("crm_khgtjl_clsj");
	if (crm_khgtjl_clsj!=null)
	{
		crm_khgtjl_clsj=crm_khgtjl_clsj.trim();
		if (!(crm_khgtjl_clsj.equals("")))	wheresql+="  and (crm_khgtjl.clsj>=TO_DATE('"+crm_khgtjl_clsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_clsj=request.getParameter("crm_khgtjl_clsj2");
	if (crm_khgtjl_clsj!=null)
	{
		crm_khgtjl_clsj=crm_khgtjl_clsj.trim();
		if (!(crm_khgtjl_clsj.equals("")))	wheresql+="  and (crm_khgtjl.clsj<=TO_DATE('"+crm_khgtjl_clsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_lrr=request.getParameter("crm_khgtjl_lrr");
	if (crm_khgtjl_lrr!=null)
	{
		crm_khgtjl_lrr=cf.GB2Uni(crm_khgtjl_lrr);
		if (!(crm_khgtjl_lrr.equals("")))	wheresql+=" and  (crm_khgtjl.lrr='"+crm_khgtjl_lrr+"')";
	}
	crm_khgtjl_lrsj=request.getParameter("crm_khgtjl_lrsj");
	if (crm_khgtjl_lrsj!=null)
	{
		crm_khgtjl_lrsj=crm_khgtjl_lrsj.trim();
		if (!(crm_khgtjl_lrsj.equals("")))	wheresql+="  and (crm_khgtjl.lrsj>=TO_DATE('"+crm_khgtjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_lrsj=request.getParameter("crm_khgtjl_lrsj2");
	if (crm_khgtjl_lrsj!=null)
	{
		crm_khgtjl_lrsj=crm_khgtjl_lrsj.trim();
		if (!(crm_khgtjl_lrsj.equals("")))	wheresql+="  and (crm_khgtjl.lrsj<=TO_DATE('"+crm_khgtjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_khgtjl_lrbm=request.getParameter("crm_khgtjl_lrbm");
	if (crm_khgtjl_lrbm!=null)
	{
		crm_khgtjl_lrbm=cf.GB2Uni(crm_khgtjl_lrbm);
		if (!(crm_khgtjl_lrbm.equals("")))	wheresql+=" and  (crm_khgtjl.lrbm='"+crm_khgtjl_lrbm+"')";
	}
	ls_sql="SELECT crm_khgtjl.djbh,DECODE(crm_khgtjl.sfxcl,'N','不需处理','Y','需处理','M','已处理'),crm_khgtjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khgtjl.gtr,crm_khgtjl.gtsj,crm_khgtjl.qksm, crm_khgtjl.clr,crm_khgtjl.clsj,crm_khgtjl.clsm,crm_khgtjl.lrr,crm_khgtjl.lrsj,dwmc";
	ls_sql+=" FROM crm_khxx,crm_khgtjl,sq_dwxx  ";
    ls_sql+=" where crm_khgtjl.khbh=crm_khxx.khbh(+) and crm_khgtjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khgtjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djbh","crm_khgtjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_khgtjl_gtr","crm_khgtjl_gtsj","crm_khgtjl_qksm","crm_khgtjl_sfxcl","crm_khgtjl_clr","crm_khgtjl_clsj","crm_khgtjl_clsm","crm_khgtjl_lrr","crm_khgtjl_lrsj","crm_khgtjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djbh"};
	pageObj.setKey(keyName);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">登记编号</td>
	<td  width="4%">是否需处理</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="3%">沟通人</td>
	<td  width="4%">沟通时间</td>
	<td  width="23%">情况说明</td>
	<td  width="3%">处理人</td>
	<td  width="4%">处理时间</td>
	<td  width="21%">处理说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
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