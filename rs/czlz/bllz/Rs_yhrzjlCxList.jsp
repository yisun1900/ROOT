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
	String rs_yhrzjl_xh=null;
	String rs_yhrzjl_ygbh=null;
	String rs_yhrzjl_yhmc=null;
	String rs_yhrzjl_bianhao=null;
	String rs_yhrzjl_sfzh=null;
	String rs_yhrzjl_xzzwbm=null;
	String rs_yhrzjl_rzsj=null;
	String rs_yhrzjl_rzcs=null;
	String dwbh=null;
	String ssfgs=null;
	String rs_yhrzjl_lrr=null;
	String rs_yhrzjl_lrsj=null;
	rs_yhrzjl_xh=request.getParameter("rs_yhrzjl_xh");
	if (rs_yhrzjl_xh!=null)
	{
		rs_yhrzjl_xh=rs_yhrzjl_xh.trim();
		if (!(rs_yhrzjl_xh.equals("")))	wheresql+=" and (rs_yhrzjl.xh="+rs_yhrzjl_xh+") ";
	}
	rs_yhrzjl_ygbh=request.getParameter("rs_yhrzjl_ygbh");
	if (rs_yhrzjl_ygbh!=null)
	{
		rs_yhrzjl_ygbh=rs_yhrzjl_ygbh.trim();
		if (!(rs_yhrzjl_ygbh.equals("")))	wheresql+=" and (rs_yhrzjl.ygbh="+rs_yhrzjl_ygbh+") ";
	}
	rs_yhrzjl_yhmc=request.getParameter("rs_yhrzjl_yhmc");
	if (rs_yhrzjl_yhmc!=null)
	{
		rs_yhrzjl_yhmc=cf.GB2Uni(rs_yhrzjl_yhmc);
		if (!(rs_yhrzjl_yhmc.equals("")))	wheresql+=" and  (rs_yhrzjl.yhmc='"+rs_yhrzjl_yhmc+"')";
	}
	rs_yhrzjl_bianhao=request.getParameter("rs_yhrzjl_bianhao");
	if (rs_yhrzjl_bianhao!=null)
	{
		rs_yhrzjl_bianhao=cf.GB2Uni(rs_yhrzjl_bianhao);
		if (!(rs_yhrzjl_bianhao.equals("")))	wheresql+=" and  (rs_yhrzjl.bianhao='"+rs_yhrzjl_bianhao+"')";
	}
	rs_yhrzjl_sfzh=request.getParameter("rs_yhrzjl_sfzh");
	if (rs_yhrzjl_sfzh!=null)
	{
		rs_yhrzjl_sfzh=cf.GB2Uni(rs_yhrzjl_sfzh);
		if (!(rs_yhrzjl_sfzh.equals("")))	wheresql+=" and  (rs_yhrzjl.sfzh='"+rs_yhrzjl_sfzh+"')";
	}
	rs_yhrzjl_xzzwbm=request.getParameter("rs_yhrzjl_xzzwbm");
	if (rs_yhrzjl_xzzwbm!=null)
	{
		rs_yhrzjl_xzzwbm=cf.GB2Uni(rs_yhrzjl_xzzwbm);
		if (!(rs_yhrzjl_xzzwbm.equals("")))	wheresql+=" and  (rs_yhrzjl.xzzwbm='"+rs_yhrzjl_xzzwbm+"')";
	}
	rs_yhrzjl_rzsj=request.getParameter("rs_yhrzjl_rzsj");
	if (rs_yhrzjl_rzsj!=null)
	{
		rs_yhrzjl_rzsj=rs_yhrzjl_rzsj.trim();
		if (!(rs_yhrzjl_rzsj.equals("")))	wheresql+="  and (rs_yhrzjl.rzsj=TO_DATE('"+rs_yhrzjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_yhrzjl_rzcs=request.getParameter("rs_yhrzjl_rzcs");
	if (rs_yhrzjl_rzcs!=null)
	{
		rs_yhrzjl_rzcs=rs_yhrzjl_rzcs.trim();
		if (!(rs_yhrzjl_rzcs.equals("")))	wheresql+=" and (rs_yhrzjl.rzcs="+rs_yhrzjl_rzcs+") ";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_yhrzjl.dwbh='"+dwbh+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_yhrzjl.ssfgs='"+ssfgs+"')";
	}
	rs_yhrzjl_lrr=request.getParameter("rs_yhrzjl_lrr");
	if (rs_yhrzjl_lrr!=null)
	{
		rs_yhrzjl_lrr=cf.GB2Uni(rs_yhrzjl_lrr);
		if (!(rs_yhrzjl_lrr.equals("")))	wheresql+=" and  (rs_yhrzjl.lrr='"+rs_yhrzjl_lrr+"')";
	}
	rs_yhrzjl_lrsj=request.getParameter("rs_yhrzjl_lrsj");
	if (rs_yhrzjl_lrsj!=null)
	{
		rs_yhrzjl_lrsj=rs_yhrzjl_lrsj.trim();
		if (!(rs_yhrzjl_lrsj.equals("")))	wheresql+="  and (rs_yhrzjl.lrsj=TO_DATE('"+rs_yhrzjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT rs_yhrzjl.xh,rs_yhrzjl.ygbh,rs_yhrzjl.yhmc,rs_yhrzjl.bianhao,rs_yhrzjl.sfzh,dm_xzzwbm.xzzwmc,rs_yhrzjl.rzsj,rs_yhrzjl.rzcs,a.dwmc ssdw,b.dwmc ssfgs,rs_yhrzjl.lrr,rs_yhrzjl.lrsj  ";
	ls_sql+=" FROM dm_xzzwbm,rs_yhrzjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_yhrzjl.xzzwbm=dm_xzzwbm.xzzwbm(+) and rs_yhrzjl.dwbh=a.dwbh(+)  and rs_yhrzjl.ssfgs=b.dwbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yhrzjl.xh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yhrzjlCxList.jsp","SelectCxRs_yhrzjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","rs_yhrzjl_ygbh","rs_yhrzjl_yhmc","rs_yhrzjl_bianhao","rs_yhrzjl_sfzh","dm_xzzwbm_xzzwmc","rs_yhrzjl_rzsj","rs_yhrzjl_rzcs","dwbh","ssfgs","rs_yhrzjl_lrr","rs_yhrzjl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询入职信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="6%">员工序号</td>
	<td  width="7%">员工名称</td>
	<td  width="8%">员工编号</td>
	<td  width="11%">身份证号</td>
	<td  width="11%">行政职务</td>
	<td  width="8%">入职日期</td>
	<td  width="6%">入职次数</td>
	<td  width="12%">所属单位</td>
	<td  width="12%">所属分公司</td>
	<td  width="6%">录入人</td>
	<td  width="8%">录入时间</td>
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