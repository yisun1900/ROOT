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
	String jc_jjpjbj_gtpjbh=null;
	String jc_jjpjbj_gtpjmc=null;
	String jc_jjpjbj_xinghao=null;
	String jc_jjpjbj_guige=null;
	String jc_jjpjbj_dj=null;
	String jc_jjpjbj_bz=null;
	String jc_jjpjbj_jjpjflbm=null;
	String jc_jjpjbj_jldwbm=null;
	jc_jjpjbj_gtpjbh=request.getParameter("jc_jjpjbj_gtpjbh");
	if (jc_jjpjbj_gtpjbh!=null)
	{
		jc_jjpjbj_gtpjbh=cf.GB2Uni(jc_jjpjbj_gtpjbh);
		if (!(jc_jjpjbj_gtpjbh.equals("")))	wheresql+=" and  (jc_jjpjbj.gtpjbh='"+jc_jjpjbj_gtpjbh+"')";
	}
	jc_jjpjbj_gtpjmc=request.getParameter("jc_jjpjbj_gtpjmc");
	if (jc_jjpjbj_gtpjmc!=null)
	{
		jc_jjpjbj_gtpjmc=cf.GB2Uni(jc_jjpjbj_gtpjmc);
		if (!(jc_jjpjbj_gtpjmc.equals("")))	wheresql+=" and  (jc_jjpjbj.gtpjmc='"+jc_jjpjbj_gtpjmc+"')";
	}
	jc_jjpjbj_xinghao=request.getParameter("jc_jjpjbj_xinghao");
	if (jc_jjpjbj_xinghao!=null)
	{
		jc_jjpjbj_xinghao=cf.GB2Uni(jc_jjpjbj_xinghao);
		if (!(jc_jjpjbj_xinghao.equals("")))	wheresql+=" and  (jc_jjpjbj.xinghao='"+jc_jjpjbj_xinghao+"')";
	}
	jc_jjpjbj_guige=request.getParameter("jc_jjpjbj_guige");
	if (jc_jjpjbj_guige!=null)
	{
		jc_jjpjbj_guige=cf.GB2Uni(jc_jjpjbj_guige);
		if (!(jc_jjpjbj_guige.equals("")))	wheresql+=" and  (jc_jjpjbj.guige='"+jc_jjpjbj_guige+"')";
	}
	jc_jjpjbj_dj=request.getParameter("jc_jjpjbj_dj");
	if (jc_jjpjbj_dj!=null)
	{
		jc_jjpjbj_dj=jc_jjpjbj_dj.trim();
		if (!(jc_jjpjbj_dj.equals("")))	wheresql+=" and  (jc_jjpjbj.dj="+jc_jjpjbj_dj+") ";
	}
	jc_jjpjbj_bz=request.getParameter("jc_jjpjbj_bz");
	if (jc_jjpjbj_bz!=null)
	{
		jc_jjpjbj_bz=cf.GB2Uni(jc_jjpjbj_bz);
		if (!(jc_jjpjbj_bz.equals("")))	wheresql+=" and  (jc_jjpjbj.bz='"+jc_jjpjbj_bz+"')";
	}
	jc_jjpjbj_jjpjflbm=request.getParameter("jc_jjpjbj_jjpjflbm");
	if (jc_jjpjbj_jjpjflbm!=null)
	{
		jc_jjpjbj_jjpjflbm=cf.GB2Uni(jc_jjpjbj_jjpjflbm);
		if (!(jc_jjpjbj_jjpjflbm.equals("")))	wheresql+=" and  (jc_jjpjbj.jjpjflbm='"+jc_jjpjbj_jjpjflbm+"')";
	}
	jc_jjpjbj_jldwbm=request.getParameter("jc_jjpjbj_jldwbm");
	if (jc_jjpjbj_jldwbm!=null)
	{
		jc_jjpjbj_jldwbm=cf.GB2Uni(jc_jjpjbj_jldwbm);
		if (!(jc_jjpjbj_jldwbm.equals("")))	wheresql+=" and  (jc_jjpjbj.jldwbm='"+jc_jjpjbj_jldwbm+"')";
	}
	ls_sql="SELECT jdm_jjpjflbm.jjpjflmc,jc_jjpjbj.gtpjbh,jc_jjpjbj.gtpjmc,jc_jjpjbj.xinghao,jc_jjpjbj.guige,jdm_jldwbm.jldwmc,jc_jjpjbj.dj,jc_jjpjbj.bz";
	ls_sql+=" FROM jc_jjpjbj,jdm_jjpjflbm,jdm_jldwbm  ";
    ls_sql+=" where jc_jjpjbj.jjpjflbm=jdm_jjpjflbm.jjpjflbm(+) and jc_jjpjbj.jldwbm=jdm_jldwbm.jldwbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_jjpjbj.jjpjflbm,jc_jjpjbj.gtpjbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_jjpjbjList.jsp","","","EditJc_jjpjbj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gtpjbh","jc_jjpjbj_gtpjmc","jc_jjpjbj_xinghao","jc_jjpjbj_guige","jc_jjpjbj_dj","jc_jjpjbj_bz","jdm_jjpjflbm_jjpjflmc","jdm_jldwbm_jldwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gtpjbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_jjpjbjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jjpjflmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] gtpjbh = request.getParameterValues("gtpjbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gtpjbh,"gtpjbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_jjpjbj where "+chooseitem;
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
  <B><font size="3">家具配件报价表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="8%">配件分类</td>
	<td  width="7%">配件编号</td>
	<td  width="13%">配件名称</td>
	<td  width="19%">型号</td>
	<td  width="12%">规格</td>
	<td  width="7%">计量单位</td>
	<td  width="7%">单价</td>
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