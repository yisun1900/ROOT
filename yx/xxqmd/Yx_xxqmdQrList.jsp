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
	String yx_xxqmd_xqmc=null;
	String yx_xxqmd_dz=null;
	String yx_xxqmd_zt=null;
	String yx_xxqmd_lrr=null;
	String yx_xxqmd_lrsj=null;
	String yx_xxqmd_fgsbh=null;
	yx_xxqmd_xqmc=request.getParameter("yx_xxqmd_xqmc");
	if (yx_xxqmd_xqmc!=null)
	{
		yx_xxqmd_xqmc=cf.GB2Uni(yx_xxqmd_xqmc);
		if (!(yx_xxqmd_xqmc.equals("")))	wheresql+=" and  (yx_xxqmd.xqmc='"+yx_xxqmd_xqmc+"')";
	}
	yx_xxqmd_dz=request.getParameter("yx_xxqmd_dz");
	if (yx_xxqmd_dz!=null)
	{
		yx_xxqmd_dz=cf.GB2Uni(yx_xxqmd_dz);
		if (!(yx_xxqmd_dz.equals("")))	wheresql+=" and  (yx_xxqmd.dz='"+yx_xxqmd_dz+"')";
	}
	yx_xxqmd_zt=request.getParameter("yx_xxqmd_zt");
	if (yx_xxqmd_zt!=null)
	{
		yx_xxqmd_zt=cf.GB2Uni(yx_xxqmd_zt);
		if (!(yx_xxqmd_zt.equals("")))	wheresql+=" and  (yx_xxqmd.zt='"+yx_xxqmd_zt+"')";
	}
	yx_xxqmd_lrr=request.getParameter("yx_xxqmd_lrr");
	if (yx_xxqmd_lrr!=null)
	{
		yx_xxqmd_lrr=cf.GB2Uni(yx_xxqmd_lrr);
		if (!(yx_xxqmd_lrr.equals("")))	wheresql+=" and  (yx_xxqmd.lrr='"+yx_xxqmd_lrr+"')";
	}
	yx_xxqmd_lrsj=request.getParameter("yx_xxqmd_lrsj");
	if (yx_xxqmd_lrsj!=null)
	{
		yx_xxqmd_lrsj=yx_xxqmd_lrsj.trim();
		if (!(yx_xxqmd_lrsj.equals("")))	wheresql+="  and (yx_xxqmd.lrsj>=TO_DATE('"+yx_xxqmd_lrsj+"','YYYY/MM/DD'))";
	}
	yx_xxqmd_lrsj=request.getParameter("yx_xxqmd_lrsj2");
	if (yx_xxqmd_lrsj!=null)
	{
		yx_xxqmd_lrsj=yx_xxqmd_lrsj.trim();
		if (!(yx_xxqmd_lrsj.equals("")))	wheresql+="  and (yx_xxqmd.lrsj<=TO_DATE('"+yx_xxqmd_lrsj+"','YYYY/MM/DD'))";
	}
	yx_xxqmd_fgsbh=request.getParameter("yx_xxqmd_fgsbh");
	if (yx_xxqmd_fgsbh!=null)
	{
		yx_xxqmd_fgsbh=cf.GB2Uni(yx_xxqmd_fgsbh);
		if (!(yx_xxqmd_fgsbh.equals("")))	wheresql+=" and  (yx_xxqmd.fgsbh='"+yx_xxqmd_fgsbh+"')";
	}
	ls_sql="SELECT yx_xxqmd.xqmc,cqmc,yx_xxqmd.dz, DECODE(yx_xxqmd.zt,'1','未确认','2','已确认'),yx_xxqmd.lrr,yx_xxqmd.lrsj,sq_dwxx.dwmc,dqmc,yx_xxqmd.dqbm  ";
	ls_sql+=" FROM sq_dwxx,yx_xxqmd,dm_cqbm,dm_dqbm  ";
    ls_sql+=" where yx_xxqmd.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and yx_xxqmd.cqbm=dm_cqbm.cqbm(+)";
    ls_sql+=" and yx_xxqmd.dqbm=dm_dqbm.dqbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and yx_xxqmd.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and yx_xxqmd.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by yx_xxqmd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_xxqmdQrList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置主键
	String[] keyName={"dqbm","xqmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"确认"};//按钮的显示名称
	String[] buttonLink={"Yx_xxqmdQrList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update yx_xxqmd set zt='2' where "+chooseitem;
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
  <B><font size="3">新小区名单－确认</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="18%">小区名称</td>
	<td  width="9%">城区</td>
	<td  width="24%">第一个客户地址</td>
	<td  width="6%">状态</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="12%">分公司</td>
	<td  width="7%">地区</td>
	<td  width="7%">地区编码</td>
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