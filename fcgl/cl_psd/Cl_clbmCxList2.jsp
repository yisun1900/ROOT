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

	String ssfgs=cf.GB2Uni(request.getParameter("dwbh"));
	String psdh=cf.GB2Uni(request.getParameter("psdh"));
	String khbh=cf.GB2Uni(request.getParameter("khbh"));


	String clbm=null;
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
	}

	String clmc=null;
	String clgg=null;
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc like '%"+clmc+"%')";
	}
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg like '%"+clgg+"%')";
	}

	String lrjsfs=null;
	String lrbfb=null;
	String jldwmc=null;
	String cldlmc=null;
	cldlmc=request.getParameter("cldlmc");
	if (cldlmc!=null)
	{
		cldlmc=cf.GB2Uni(cldlmc);
		if (!(cldlmc.equals("")))	wheresql+=" and  (cl_clbm.cldlmc='"+cldlmc+"')";
	}

	jldwmc=request.getParameter("jldwmc");
	if (jldwmc!=null)
	{
		jldwmc=cf.GB2Uni(jldwmc);
		if (!(jldwmc.equals("")))	wheresql+=" and  (cl_clbm.jldwmc='"+jldwmc+"')";
	}
	lrjsfs=request.getParameter("lrjsfs");
	if (lrjsfs!=null)
	{
		lrjsfs=cf.GB2Uni(lrjsfs);
		if (!(lrjsfs.equals("")))	wheresql+=" and  (lrjsfs='"+lrjsfs+"')";
	}
	lrbfb=request.getParameter("lrbfb");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (lrbfb>="+lrbfb+") ";
	}
	lrbfb=request.getParameter("lrbfb2");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (lrbfb<="+lrbfb+") ";
	}
	ls_sql="SELECT cl_clbm.clbm clbm,clmc,clgg,cldlmc,jldwmc,gdj,bz ";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) ";
	ls_sql+=" and cl_jgmx.dwbh='"+ssfgs+"' ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_clbmCxList.jsp","","","");
//	pageObj.setEditStr("申购 ");
//	pageObj.setPageRow(30);//设置每页显示记录数

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);


//设置按钮参数
	String[] buttonName={"批量保存"};//按钮的显示名称
	String[] buttonLink={"SavePlxzCl_clbm.jsp?psdh="+psdh+"&dwbh="+ssfgs};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置主键的显示方式
	//pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px' >
<CENTER >
  <B><font size="3">材料配送单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="12%">材料编码</td>
	<td  width="20%">材料名称</td>
	<td  width="15%">材料规格</td>
	<td  width="12%">材料大类</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">工队价</td>
	<td  width="20%">备注</td>
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