<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_sfbl_xh=null;
	String bj_sfbl_sfxmbm=null;
	String bj_sfbl_sfbfb=null;
	String bj_sfbl_qsz=null;
	String bj_sfbl_jzz=null;
	String bj_sfbl_dqbm=null;
	bj_sfbl_xh=request.getParameter("bj_sfbl_xh");
	if (bj_sfbl_xh!=null)
	{
		bj_sfbl_xh=bj_sfbl_xh.trim();
		if (!(bj_sfbl_xh.equals("")))	wheresql+=" and (bj_sfbl.xh="+bj_sfbl_xh+") ";
	}
	bj_sfbl_sfxmbm=request.getParameter("bj_sfbl_sfxmbm");
	if (bj_sfbl_sfxmbm!=null)
	{
		bj_sfbl_sfxmbm=cf.GB2Uni(bj_sfbl_sfxmbm);
		if (!(bj_sfbl_sfxmbm.equals("")))	wheresql+=" and  (bj_sfbl.sfxmbm='"+bj_sfbl_sfxmbm+"')";
	}
	bj_sfbl_sfbfb=request.getParameter("bj_sfbl_sfbfb");
	if (bj_sfbl_sfbfb!=null)
	{
		bj_sfbl_sfbfb=bj_sfbl_sfbfb.trim();
		if (!(bj_sfbl_sfbfb.equals("")))	wheresql+=" and  (bj_sfbl.sfbfb="+bj_sfbl_sfbfb+") ";
	}
	bj_sfbl_qsz=request.getParameter("bj_sfbl_qsz");
	if (bj_sfbl_qsz!=null)
	{
		bj_sfbl_qsz=bj_sfbl_qsz.trim();
		if (!(bj_sfbl_qsz.equals("")))	wheresql+=" and  (bj_sfbl.qsz="+bj_sfbl_qsz+") ";
	}
	bj_sfbl_jzz=request.getParameter("bj_sfbl_jzz");
	if (bj_sfbl_jzz!=null)
	{
		bj_sfbl_jzz=bj_sfbl_jzz.trim();
		if (!(bj_sfbl_jzz.equals("")))	wheresql+=" and  (bj_sfbl.jzz="+bj_sfbl_jzz+") ";
	}
	bj_sfbl_dqbm=request.getParameter("bj_sfbl_dqbm");
	if (bj_sfbl_dqbm!=null)
	{
		bj_sfbl_dqbm=cf.GB2Uni(bj_sfbl_dqbm);
		if (!(bj_sfbl_dqbm.equals("")))	wheresql+=" and  (bj_sfbl.dqbm='"+bj_sfbl_dqbm+"')";
	}
	ls_sql="SELECT bj_sfbl.xh,dm_dqbm.dqmc,bdm_sfxmbm.sfxmbm,bdm_sfxmbm.sfxmmc,bj_sfbl.sfbfb||'%',bj_sfbl.qsz,bj_sfbl.jzz  ";
	ls_sql+=" FROM bdm_sfxmbm,bj_sfbl,dm_dqbm  ";
    ls_sql+=" where bj_sfbl.dqbm=bdm_sfxmbm.dqbm(+) and bj_sfbl.sfxmbm=bdm_sfxmbm.sfxmbm(+) and bj_sfbl.dqbm=dm_dqbm.dqbm(+)";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and bdm_sfxmbm.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by bj_sfbl.dqbm,bj_sfbl.sfxmbm,bj_sfbl.qsz";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_sfblCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

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
  <B><font size="3">收费比率－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">序号</td>
	<td  width="10%">地区名称</td>
	<td  width="12%">收费项目编码</td>
	<td  width="23%">收费项目</td>
	<td  width="10%">收费百分比</td>
	<td  width="15%">起始值></td>
	<td  width="15%">截止值<=</td>
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