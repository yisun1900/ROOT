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
	String rs_jbsqd_fgsbh=null;
	String rs_jbsqd_dwbh=null;
	String rs_jbsqd_ygbh=null;
	String rs_jbsqd_yhmc=null;
	String rs_jbsqd_xb=null;
	String rs_jbsqd_xzzwbm=null;

	String rs_jbsqd_sqxh=null;
	String rs_jbsqd_lrr=null;
	String rs_jbsqd_lrsj=null;
	String rs_jbsqd_lrbm=null;
	String sqrq=null;

	String rs_jbsqd_clzt=null;
	String rs_jbsqd_ztbm=null;
	String rs_jbsqd_spxh=null;
	String rs_jbsqd_shjl=null;
	String rs_jbsqd_shsj=null;
	String rs_jbsqd_shr=null;

	rs_jbsqd_fgsbh=request.getParameter("rs_jbsqd_fgsbh");
	if (rs_jbsqd_fgsbh!=null)
	{
		rs_jbsqd_fgsbh=cf.GB2Uni(rs_jbsqd_fgsbh);
		if (!(rs_jbsqd_fgsbh.equals("")))	wheresql+=" and  (rs_jbsqd.fgsbh='"+rs_jbsqd_fgsbh+"')";
	}
	rs_jbsqd_dwbh=request.getParameter("rs_jbsqd_dwbh");
	if (rs_jbsqd_dwbh!=null)
	{
		rs_jbsqd_dwbh=cf.GB2Uni(rs_jbsqd_dwbh);
		if (!(rs_jbsqd_dwbh.equals("")))	wheresql+=" and  (rs_jbsqd.dwbh='"+rs_jbsqd_dwbh+"')";
	}
	rs_jbsqd_ygbh=request.getParameter("rs_jbsqd_ygbh");
	if (rs_jbsqd_ygbh!=null)
	{
		rs_jbsqd_ygbh=rs_jbsqd_ygbh.trim();
		if (!(rs_jbsqd_ygbh.equals("")))	wheresql+=" and (rs_jbsqd.ygbh="+rs_jbsqd_ygbh+") ";
	}
	rs_jbsqd_yhmc=request.getParameter("rs_jbsqd_yhmc");
	if (rs_jbsqd_yhmc!=null)
	{
		rs_jbsqd_yhmc=cf.GB2Uni(rs_jbsqd_yhmc);
		if (!(rs_jbsqd_yhmc.equals("")))	wheresql+=" and  (rs_jbsqd.yhmc like '%"+rs_jbsqd_yhmc+"%')";
	}
	rs_jbsqd_xb=request.getParameter("rs_jbsqd_xb");
	if (rs_jbsqd_xb!=null)
	{
		rs_jbsqd_xb=cf.GB2Uni(rs_jbsqd_xb);
		if (!(rs_jbsqd_xb.equals("")))	wheresql+=" and  (rs_jbsqd.xb='"+rs_jbsqd_xb+"')";
	}

	rs_jbsqd_xzzwbm=request.getParameter("rs_jbsqd_xzzwbm");
	if (rs_jbsqd_xzzwbm!=null)
	{
		rs_jbsqd_xzzwbm=cf.GB2Uni(rs_jbsqd_xzzwbm);
		if (!(rs_jbsqd_xzzwbm.equals("")))	wheresql+=" and  (rs_jbsqd.xzzwbm='"+rs_jbsqd_xzzwbm+"')";
	}

	
	rs_jbsqd_sqxh=request.getParameter("rs_jbsqd_sqxh");
	if (rs_jbsqd_sqxh!=null)
	{
		rs_jbsqd_sqxh=cf.GB2Uni(rs_jbsqd_sqxh);
		if (!(rs_jbsqd_sqxh.equals("")))	wheresql+=" and  (rs_jbsqd.sqxh='"+rs_jbsqd_sqxh+"')";
	}
	rs_jbsqd_lrr=request.getParameter("rs_jbsqd_lrr");
	if (rs_jbsqd_lrr!=null)
	{
		rs_jbsqd_lrr=cf.GB2Uni(rs_jbsqd_lrr);
		if (!(rs_jbsqd_lrr.equals("")))	wheresql+=" and  (rs_jbsqd.lrr='"+rs_jbsqd_lrr+"')";
	}
	rs_jbsqd_lrsj=request.getParameter("rs_jbsqd_lrsj");
	if (rs_jbsqd_lrsj!=null)
	{
		rs_jbsqd_lrsj=rs_jbsqd_lrsj.trim();
		if (!(rs_jbsqd_lrsj.equals("")))	wheresql+="  and (rs_jbsqd.lrsj>=TO_DATE('"+rs_jbsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqd_lrsj=request.getParameter("rs_jbsqd_lrsj2");
	if (rs_jbsqd_lrsj!=null)
	{
		rs_jbsqd_lrsj=rs_jbsqd_lrsj.trim();
		if (!(rs_jbsqd_lrsj.equals("")))	wheresql+="  and (rs_jbsqd.lrsj<=TO_DATE('"+rs_jbsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqd_lrbm=request.getParameter("rs_jbsqd_lrbm");
	if (rs_jbsqd_lrbm!=null)
	{
		rs_jbsqd_lrbm=cf.GB2Uni(rs_jbsqd_lrbm);
		if (!(rs_jbsqd_lrbm.equals("")))	wheresql+=" and  (rs_jbsqd.lrbm='"+rs_jbsqd_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_jbsqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_jbsqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_jbsqd_clzt=request.getParameter("rs_jbsqd_clzt");
	if (rs_jbsqd_clzt!=null)
	{
		rs_jbsqd_clzt=cf.GB2Uni(rs_jbsqd_clzt);
		if (!(rs_jbsqd_clzt.equals("")))	wheresql+=" and  (rs_jbsqd.clzt='"+rs_jbsqd_clzt+"')";
	}
	rs_jbsqd_ztbm=request.getParameter("rs_jbsqd_ztbm");
	if (rs_jbsqd_ztbm!=null)
	{
		rs_jbsqd_ztbm=cf.GB2Uni(rs_jbsqd_ztbm);
		if (!(rs_jbsqd_ztbm.equals("")))	wheresql+=" and  (rs_jbsqd.ztbm='"+rs_jbsqd_ztbm+"')";
	}
	rs_jbsqd_spxh=request.getParameter("rs_jbsqd_spxh");
	if (rs_jbsqd_spxh!=null)
	{
		rs_jbsqd_spxh=rs_jbsqd_spxh.trim();
		if (!(rs_jbsqd_spxh.equals("")))	wheresql+=" and (rs_jbsqd.spxh="+rs_jbsqd_spxh+") ";
	}
	rs_jbsqd_shr=request.getParameter("rs_jbsqd_shr");
	if (rs_jbsqd_shr!=null)
	{
		rs_jbsqd_shr=cf.GB2Uni(rs_jbsqd_shr);
		if (!(rs_jbsqd_shr.equals("")))	wheresql+=" and  (rs_jbsqd.shr='"+rs_jbsqd_shr+"')";
	}
	rs_jbsqd_shsj=request.getParameter("rs_jbsqd_shsj");
	if (rs_jbsqd_shsj!=null)
	{
		rs_jbsqd_shsj=rs_jbsqd_shsj.trim();
		if (!(rs_jbsqd_shsj.equals("")))	wheresql+="  and (rs_jbsqd.shsj>=TO_DATE('"+rs_jbsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqd_shsj=request.getParameter("rs_jbsqd_shsj2");
	if (rs_jbsqd_shsj!=null)
	{
		rs_jbsqd_shsj=rs_jbsqd_shsj.trim();
		if (!(rs_jbsqd_shsj.equals("")))	wheresql+="  and (rs_jbsqd.shsj<=TO_DATE('"+rs_jbsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqd_shjl=request.getParameter("rs_jbsqd_shjl");
	if (rs_jbsqd_shjl!=null)
	{
		rs_jbsqd_shjl=cf.GB2Uni(rs_jbsqd_shjl);
		if (!(rs_jbsqd_shjl.equals("")))	wheresql+=" and  (rs_jbsqd.shjl='"+rs_jbsqd_shjl+"')";
	}

	ls_sql="SELECT rs_jbsqd.sqxh,DECODE(rs_jbsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_jbsqd.ygbh,rs_jbsqd.yhmc, DECODE(rs_jbsqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_jbsqd.xzzwbm,rs_jbsqd.kssj,rs_jbsqd.jzsj,rs_jbsqd.ljts,rs_jbsqd.yysm,rs_jbsqd.sqrq,rs_jbsqd.lrr,rs_jbsqd.lrsj,c.dwmc lrbm,rs_jbsqd.bz,rs_jbsqd.spxh,rs_jbsqd.shr,rs_jbsqd.shsj,shjlmc,rs_jbsqd.shyj";
	ls_sql+=" FROM rs_jbsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_jbsqd.fgsbh=a.dwbh(+) and rs_jbsqd.dwbh=b.dwbh(+) and rs_jbsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_jbsqd.shjl=rs_shjlbm.shjl(+) and rs_jbsqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_jbsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_jbsqdCxList.jsp","SelectCxRs_jbsqd.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_jbsqd_ygbh","rs_jbsqd_yhmc","rs_jbsqd_xb","rs_jbsqd_yfgsbh","rs_jbsqd_dwbh","rs_jbsqd_xzzwbm","rs_jbsqd_yrzsj","rs_jbsqd_ylzrq","rs_jbsqd_ylzyy","rs_jbsqd_xdwbh","rs_jbsqd_xxzzwbm","rs_jbsqd_xrzyy","rs_jbsqd_lrr","rs_jbsqd_lrsj","rs_jbsqd_lrbm","rs_jbsqd_bz","rs_jbsqd_clzt","rs_jbsqd_ztbm","rs_jbsqd_spxh","rs_jbsqd_shr","rs_jbsqd_shsj","rs_jbsqd_shjl","rs_jbsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_jbsqd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
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
  <B><font size="3">查询加班申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">申请序号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">审批状态</td>
	<td  width="4%">所属分公司</td>
	<td  width="2%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="5%">所属部门</td>
	<td  width="4%">职务</td>

	<td  width="3%">开始时间</td>
	<td  width="3%">截至时间</td>
	<td  width="3%">累计小时</td>
	<td  width="13%">原因说明</td>
	<td  width="3%">申请日期</td>
	<td  width="3%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="11%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="3%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
	<td  width="12%">审核意见</td>
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