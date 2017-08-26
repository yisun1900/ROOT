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
	String lrjsfs=null;
	String lrbfb=null;
	String jldwmc=null;
	String cldlmc=null;

	String clbm=null;
	clbm=request.getParameter("clbm");
	if (clbm!=null)
	{
		clbm=cf.GB2Uni(clbm);
		if (!(clbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+clbm+"')";
	}

	String clmc=null;
	clmc=request.getParameter("clmc");
	if (clmc!=null)
	{
		clmc=cf.GB2Uni(clmc);
		if (!(clmc.equals("")))	wheresql+=" and  (cl_clbm.clmc like '%"+clmc+"%')";
	}
	String clgg=null;
	clgg=request.getParameter("clgg");
	if (clgg!=null)
	{
		clgg=cf.GB2Uni(clgg);
		if (!(clgg.equals("")))	wheresql+=" and  (cl_clbm.clgg like '%"+clgg+"%')";
	}

	String wxr=null;
	wxr=request.getParameter("wxr");
	if (wxr!=null)
	{
		wxr=cf.GB2Uni(wxr);
		if (!(wxr.equals("")))	wheresql+=" and  (cl_clbm.wxr='"+wxr+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (cl_clbm.lx='"+lx+"')";
	}
	
	
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
		if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
	}
	lrbfb=request.getParameter("lrbfb");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb>="+lrbfb+") ";
	}
	lrbfb=request.getParameter("lrbfb2");
	if (lrbfb!=null)
	{
		lrbfb=lrbfb.trim();
		if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb<="+lrbfb+") ";
	}
	ls_sql="SELECT paixu,DECODE(lx,'1','常用','2','非常用'),clbm,clmc,wxr,clgg,cldlmc,jldwmc,DECODE(lrjsfs,'1','差价方式','2','百分比方式'),lrbfb||'%',lrr,lrsj,bz  ";
	ls_sql+=" FROM cl_clbm";
    ls_sql+=" where (1=1) ";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlmc,clbm ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_clbmList.jsp","","","EditCl_clbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"clbm","clmc","clgg","lrjsfs","lrbfb","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","替换维护人"};//按钮的显示名称
	String[] buttonLink={"Cl_clbmList.jsp?","plthLxr.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
}
else//非第一次进入此页，不需要初始化
{
	String[] clbm = request.getParameterValues("clbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(clbm,"clbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from cl_clbm where "+chooseitem;
		sql[1]="delete from cl_jgmx where "+chooseitem;
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
  <B><font size="3">维护材料编码表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="3%">排序</td>
	<td  width="4%">类型</td>
	<td  width="7%">材料编码</td>
	<td  width="16%">材料名称</td>
	<td  width="4%">维护人</td>
	<td  width="11%">材料规格</td>
	<td  width="9%">材料大类</td>
	<td  width="5%">计量单位</td>
	<td  width="6%">利润计算方式</td>
	<td  width="4%">利润百分比</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="16%">备注</td>
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