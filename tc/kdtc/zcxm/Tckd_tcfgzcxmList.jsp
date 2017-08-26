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
	String tckd_tcfgzcxm_dqbm=null;
	String tckd_tcfgzcxm_bjjbbm=null;
	String tckd_tcfgzcxm_hxbm=null;
	String tckd_tcfgzcxm_jgwzbm=null;
	String tckd_tcfgzcxm_tccplbbm=null;

	String tckd_tcfgzcxm_lrr=null;
	String tckd_tcfgzcxm_lrsj=null;

	String fgmc=null;
	fgmc=request.getParameter("fgmc");
	if (fgmc!=null)
	{
		fgmc=cf.GB2Uni(fgmc);
		if (!(fgmc.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.fgmc='"+fgmc+"')";
	}
	String nbbm=null;
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.nbbm='"+nbbm+"')";
	}

	
	tckd_tcfgzcxm_dqbm=request.getParameter("tckd_tcfgzcxm_dqbm");
	if (tckd_tcfgzcxm_dqbm!=null)
	{
		tckd_tcfgzcxm_dqbm=cf.GB2Uni(tckd_tcfgzcxm_dqbm);
		if (!(tckd_tcfgzcxm_dqbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.dqbm='"+tckd_tcfgzcxm_dqbm+"')";
	}
	tckd_tcfgzcxm_bjjbbm=request.getParameter("tckd_tcfgzcxm_bjjbbm");
	if (tckd_tcfgzcxm_bjjbbm!=null)
	{
		tckd_tcfgzcxm_bjjbbm=cf.GB2Uni(tckd_tcfgzcxm_bjjbbm);
		if (!(tckd_tcfgzcxm_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.bjjbbm='"+tckd_tcfgzcxm_bjjbbm+"')";
	}
	tckd_tcfgzcxm_hxbm=request.getParameter("tckd_tcfgzcxm_hxbm");
	if (tckd_tcfgzcxm_hxbm!=null)
	{
		tckd_tcfgzcxm_hxbm=cf.GB2Uni(tckd_tcfgzcxm_hxbm);
		if (!(tckd_tcfgzcxm_hxbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.hxbm='"+tckd_tcfgzcxm_hxbm+"')";
	}
	tckd_tcfgzcxm_jgwzbm=request.getParameter("tckd_tcfgzcxm_jgwzbm");
	if (tckd_tcfgzcxm_jgwzbm!=null)
	{
		tckd_tcfgzcxm_jgwzbm=cf.GB2Uni(tckd_tcfgzcxm_jgwzbm);
		if (!(tckd_tcfgzcxm_jgwzbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.jgwzbm='"+tckd_tcfgzcxm_jgwzbm+"')";
	}
	tckd_tcfgzcxm_tccplbbm=request.getParameter("tckd_tcfgzcxm_tccplbbm");
	if (tckd_tcfgzcxm_tccplbbm!=null)
	{
		tckd_tcfgzcxm_tccplbbm=cf.GB2Uni(tckd_tcfgzcxm_tccplbbm);
		if (!(tckd_tcfgzcxm_tccplbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.tccplbbm='"+tckd_tcfgzcxm_tccplbbm+"')";
	}

	tckd_tcfgzcxm_lrr=request.getParameter("tckd_tcfgzcxm_lrr");
	if (tckd_tcfgzcxm_lrr!=null)
	{
		tckd_tcfgzcxm_lrr=cf.GB2Uni(tckd_tcfgzcxm_lrr);
		if (!(tckd_tcfgzcxm_lrr.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.lrr='"+tckd_tcfgzcxm_lrr+"')";
	}
	tckd_tcfgzcxm_lrsj=request.getParameter("tckd_tcfgzcxm_lrsj");
	if (tckd_tcfgzcxm_lrsj!=null)
	{
		tckd_tcfgzcxm_lrsj=tckd_tcfgzcxm_lrsj.trim();
		if (!(tckd_tcfgzcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfgzcxm.lrsj>=TO_DATE('"+tckd_tcfgzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tckd_tcfgzcxm_lrsj=request.getParameter("tckd_tcfgzcxm_lrsj2");
	if (tckd_tcfgzcxm_lrsj!=null)
	{
		tckd_tcfgzcxm_lrsj=tckd_tcfgzcxm_lrsj.trim();
		if (!(tckd_tcfgzcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfgzcxm.lrsj<=TO_DATE('"+tckd_tcfgzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tckd_tcfgzcxm.dqbm,dm_dqbm.dqmc,tckd_tcfgzcxm.bjjbbm,bjjbmc,fgmc,tckd_tcfgzcxm.hxbm,hxmc,tckd_tcfgzcxm.jgwzbm,tckd_tcfgzcxm.tccplbbm,clxlmc,tckd_tcfgzcxm.jldw,tckd_tcfgzcxm.bzsl,tckd_tczcbj.nbbm,tckd_tczcbj.ppmc,tckd_tczcbj.cpmc,tckd_tczcbj.xh,tckd_tcfgzcxm.lrr,tckd_tcfgzcxm.lrsj  ";
	ls_sql+=" FROM tckd_tcfgzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,tckd_tczcbj  ";
    ls_sql+=" where tckd_tcfgzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.nbbm=tckd_tczcbj.nbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcfgzcxm.dqbm,tckd_tcfgzcxm.bjjbbm,fgmc,tckd_tcfgzcxm.hxbm,tckd_tcfgzcxm.jgwzbm,tckd_tcfgzcxm.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckd_tcfgzcxmList.jsp","","","EditTckd_tcfgzcxm.jsp");
	pageObj.setPageRow(19);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjjbmc","fgmc","hxmc","jgwzbm","clxlmc","jldw","bzsl","nbbm","ppmc","cpmc","xh","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","bjjbbm","fgmc","hxbm","jgwzbm","nbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tckd_tcfgzcxmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1,1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tckd_tcfgzcxm where "+chooseitem;
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
  <B><font size="3">套餐标准主材项目－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">地区</td>
	<td  width="5%">报价级别</td>
	<td  width="5%">风格名称</td>
	<td  width="8%">户型</td>
	<td  width="6%">结构位置</td>
	<td  width="8%">产品类别</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">标准数量</td>
	<td  width="6%">主材内部编码</td>
	<td  width="9%">品牌</td>
	<td  width="12%">产品名称</td>
	<td  width="13%">型号</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
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