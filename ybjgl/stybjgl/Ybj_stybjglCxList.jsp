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
	String ybj_stybjgl_ybjbh=null;
	String ybj_stybjgl_lx=null;
	String ybj_stybjgl_clzt=null;
	String ybj_stybjgl_lrr=null;
	String ybj_stybjgl_lrsj=null;
	String ybj_stybjgl_ssfgs=null;
	ybj_stybjgl_ybjbh=request.getParameter("ybj_stybjgl_ybjbh");
	if (ybj_stybjgl_ybjbh!=null)
	{
		ybj_stybjgl_ybjbh=cf.GB2Uni(ybj_stybjgl_ybjbh);
		if (!(ybj_stybjgl_ybjbh.equals("")))	wheresql+=" and  (ybj_stybjgl.ybjbh='"+ybj_stybjgl_ybjbh+"')";
	}
	ybj_stybjgl_lx=request.getParameter("ybj_stybjgl_lx");
	if (ybj_stybjgl_lx!=null)
	{
		ybj_stybjgl_lx=cf.GB2Uni(ybj_stybjgl_lx);
		if (!(ybj_stybjgl_lx.equals("")))	wheresql+=" and  (ybj_stybjgl.lx='"+ybj_stybjgl_lx+"')";
	}
	ybj_stybjgl_clzt=request.getParameter("ybj_stybjgl_clzt");
	if (ybj_stybjgl_clzt!=null)
	{
		ybj_stybjgl_clzt=cf.GB2Uni(ybj_stybjgl_clzt);
		if (!(ybj_stybjgl_clzt.equals("")))	wheresql+=" and  (ybj_stybjgl.clzt='"+ybj_stybjgl_clzt+"')";
	}
	ybj_stybjgl_lrr=request.getParameter("ybj_stybjgl_lrr");
	if (ybj_stybjgl_lrr!=null)
	{
		ybj_stybjgl_lrr=cf.GB2Uni(ybj_stybjgl_lrr);
		if (!(ybj_stybjgl_lrr.equals("")))	wheresql+=" and  (ybj_stybjgl.lrr='"+ybj_stybjgl_lrr+"')";
	}
	ybj_stybjgl_lrsj=request.getParameter("ybj_stybjgl_lrsj");
	if (ybj_stybjgl_lrsj!=null)
	{
		ybj_stybjgl_lrsj=ybj_stybjgl_lrsj.trim();
		if (!(ybj_stybjgl_lrsj.equals("")))	wheresql+="  and (ybj_stybjgl.lrsj>=TO_DATE('"+ybj_stybjgl_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_stybjgl_lrsj=request.getParameter("ybj_stybjgl_lrsj2");
	if (ybj_stybjgl_lrsj!=null)
	{
		ybj_stybjgl_lrsj=ybj_stybjgl_lrsj.trim();
		if (!(ybj_stybjgl_lrsj.equals("")))	wheresql+="  and (ybj_stybjgl.lrsj<=TO_DATE('"+ybj_stybjgl_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_stybjgl_ssfgs=request.getParameter("ybj_stybjgl_ssfgs");
	if (ybj_stybjgl_ssfgs!=null)
	{
		ybj_stybjgl_ssfgs=cf.GB2Uni(ybj_stybjgl_ssfgs);
		if (!(ybj_stybjgl_ssfgs.equals("")))	wheresql+=" and  (ybj_stybjgl.ssfgs='"+ybj_stybjgl_ssfgs+"')";
	}
	ls_sql="SELECT ybj_stybjgl.ybjbh,ybj_stybjgl.mj,ybj_stybjgl.fgms,ybj_stybjgl.zxzj, DECODE(ybj_stybjgl.lx,'1','样板间','2','独立隔间'), DECODE(ybj_stybjgl.clzt,'1','在使用','2','作废'),ybj_stybjgl.lrr,ybj_stybjgl.lrsj,ybj_stybjgl.lrbm,sq_dwxx.dwmc,ybj_stybjgl.bz  ";
	ls_sql+=" FROM sq_dwxx,ybj_stybjgl  ";
    ls_sql+=" where ybj_stybjgl.ssfgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by ybj_stybjgl.ybjbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Ybj_stybjglCxList.jsp","SelectCxYbj_stybjgl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ybjbh","ybj_stybjgl_mj","ybj_stybjgl_fgms","ybj_stybjgl_zxzj","ybj_stybjgl_lx","ybj_stybjgl_clzt","ybj_stybjgl_lrr","ybj_stybjgl_lrsj","ybj_stybjgl_lrbm","sq_dwxx_dwmc","ybj_stybjgl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ybjbh"};
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
  <B><font size="3">实体样板间查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">样板间编号</td>
	<td  width="5%">面积</td>
	<td  width="33%">风格描述</td>
	<td  width="5%">装修造价</td>
	<td  width="4%">类型</td>
	<td  width="4%">状态</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="7%">所属分公司</td>
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