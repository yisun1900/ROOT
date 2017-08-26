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
	String rs_ccsqd_fgsbh=null;
	String rs_ccsqd_dwbh=null;
	String rs_ccsqd_ygbh=null;
	String rs_ccsqd_yhmc=null;
	String rs_ccsqd_xb=null;
	String rs_ccsqd_xzzwbm=null;

	String rs_ccsqd_sqxh=null;
	String rs_ccsqd_lrr=null;
	String rs_ccsqd_lrsj=null;
	String rs_ccsqd_lrbm=null;
	String sqrq=null;

	String rs_ccsqd_clzt=null;
	String rs_ccsqd_ztbm=null;
	String rs_ccsqd_spxh=null;
	String rs_ccsqd_shjl=null;
	String rs_ccsqd_shsj=null;
	String rs_ccsqd_shr=null;

	rs_ccsqd_fgsbh=request.getParameter("rs_ccsqd_fgsbh");
	if (rs_ccsqd_fgsbh!=null)
	{
		rs_ccsqd_fgsbh=cf.GB2Uni(rs_ccsqd_fgsbh);
		if (!(rs_ccsqd_fgsbh.equals("")))	wheresql+=" and  (rs_ccsqd.fgsbh='"+rs_ccsqd_fgsbh+"')";
	}
	rs_ccsqd_dwbh=request.getParameter("rs_ccsqd_dwbh");
	if (rs_ccsqd_dwbh!=null)
	{
		rs_ccsqd_dwbh=cf.GB2Uni(rs_ccsqd_dwbh);
		if (!(rs_ccsqd_dwbh.equals("")))	wheresql+=" and  (rs_ccsqd.dwbh='"+rs_ccsqd_dwbh+"')";
	}
	rs_ccsqd_ygbh=request.getParameter("rs_ccsqd_ygbh");
	if (rs_ccsqd_ygbh!=null)
	{
		rs_ccsqd_ygbh=rs_ccsqd_ygbh.trim();
		if (!(rs_ccsqd_ygbh.equals("")))	wheresql+=" and (rs_ccsqd.ygbh="+rs_ccsqd_ygbh+") ";
	}
	rs_ccsqd_yhmc=request.getParameter("rs_ccsqd_yhmc");
	if (rs_ccsqd_yhmc!=null)
	{
		rs_ccsqd_yhmc=cf.GB2Uni(rs_ccsqd_yhmc);
		if (!(rs_ccsqd_yhmc.equals("")))	wheresql+=" and  (rs_ccsqd.yhmc like '%"+rs_ccsqd_yhmc+"%')";
	}
	rs_ccsqd_xb=request.getParameter("rs_ccsqd_xb");
	if (rs_ccsqd_xb!=null)
	{
		rs_ccsqd_xb=cf.GB2Uni(rs_ccsqd_xb);
		if (!(rs_ccsqd_xb.equals("")))	wheresql+=" and  (rs_ccsqd.xb='"+rs_ccsqd_xb+"')";
	}

	rs_ccsqd_xzzwbm=request.getParameter("rs_ccsqd_xzzwbm");
	if (rs_ccsqd_xzzwbm!=null)
	{
		rs_ccsqd_xzzwbm=cf.GB2Uni(rs_ccsqd_xzzwbm);
		if (!(rs_ccsqd_xzzwbm.equals("")))	wheresql+=" and  (rs_ccsqd.xzzwbm='"+rs_ccsqd_xzzwbm+"')";
	}

	
	rs_ccsqd_sqxh=request.getParameter("rs_ccsqd_sqxh");
	if (rs_ccsqd_sqxh!=null)
	{
		rs_ccsqd_sqxh=cf.GB2Uni(rs_ccsqd_sqxh);
		if (!(rs_ccsqd_sqxh.equals("")))	wheresql+=" and  (rs_ccsqd.sqxh='"+rs_ccsqd_sqxh+"')";
	}
	rs_ccsqd_lrr=request.getParameter("rs_ccsqd_lrr");
	if (rs_ccsqd_lrr!=null)
	{
		rs_ccsqd_lrr=cf.GB2Uni(rs_ccsqd_lrr);
		if (!(rs_ccsqd_lrr.equals("")))	wheresql+=" and  (rs_ccsqd.lrr='"+rs_ccsqd_lrr+"')";
	}
	rs_ccsqd_lrsj=request.getParameter("rs_ccsqd_lrsj");
	if (rs_ccsqd_lrsj!=null)
	{
		rs_ccsqd_lrsj=rs_ccsqd_lrsj.trim();
		if (!(rs_ccsqd_lrsj.equals("")))	wheresql+="  and (rs_ccsqd.lrsj>=TO_DATE('"+rs_ccsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqd_lrsj=request.getParameter("rs_ccsqd_lrsj2");
	if (rs_ccsqd_lrsj!=null)
	{
		rs_ccsqd_lrsj=rs_ccsqd_lrsj.trim();
		if (!(rs_ccsqd_lrsj.equals("")))	wheresql+="  and (rs_ccsqd.lrsj<=TO_DATE('"+rs_ccsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqd_lrbm=request.getParameter("rs_ccsqd_lrbm");
	if (rs_ccsqd_lrbm!=null)
	{
		rs_ccsqd_lrbm=cf.GB2Uni(rs_ccsqd_lrbm);
		if (!(rs_ccsqd_lrbm.equals("")))	wheresql+=" and  (rs_ccsqd.lrbm='"+rs_ccsqd_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_ccsqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_ccsqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_ccsqd_clzt=request.getParameter("rs_ccsqd_clzt");
	if (rs_ccsqd_clzt!=null)
	{
		rs_ccsqd_clzt=cf.GB2Uni(rs_ccsqd_clzt);
		if (!(rs_ccsqd_clzt.equals("")))	wheresql+=" and  (rs_ccsqd.clzt='"+rs_ccsqd_clzt+"')";
	}
	rs_ccsqd_ztbm=request.getParameter("rs_ccsqd_ztbm");
	if (rs_ccsqd_ztbm!=null)
	{
		rs_ccsqd_ztbm=cf.GB2Uni(rs_ccsqd_ztbm);
		if (!(rs_ccsqd_ztbm.equals("")))	wheresql+=" and  (rs_ccsqd.ztbm='"+rs_ccsqd_ztbm+"')";
	}
	rs_ccsqd_spxh=request.getParameter("rs_ccsqd_spxh");
	if (rs_ccsqd_spxh!=null)
	{
		rs_ccsqd_spxh=rs_ccsqd_spxh.trim();
		if (!(rs_ccsqd_spxh.equals("")))	wheresql+=" and (rs_ccsqd.spxh="+rs_ccsqd_spxh+") ";
	}
	rs_ccsqd_shr=request.getParameter("rs_ccsqd_shr");
	if (rs_ccsqd_shr!=null)
	{
		rs_ccsqd_shr=cf.GB2Uni(rs_ccsqd_shr);
		if (!(rs_ccsqd_shr.equals("")))	wheresql+=" and  (rs_ccsqd.shr='"+rs_ccsqd_shr+"')";
	}
	rs_ccsqd_shsj=request.getParameter("rs_ccsqd_shsj");
	if (rs_ccsqd_shsj!=null)
	{
		rs_ccsqd_shsj=rs_ccsqd_shsj.trim();
		if (!(rs_ccsqd_shsj.equals("")))	wheresql+="  and (rs_ccsqd.shsj>=TO_DATE('"+rs_ccsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqd_shsj=request.getParameter("rs_ccsqd_shsj2");
	if (rs_ccsqd_shsj!=null)
	{
		rs_ccsqd_shsj=rs_ccsqd_shsj.trim();
		if (!(rs_ccsqd_shsj.equals("")))	wheresql+="  and (rs_ccsqd.shsj<=TO_DATE('"+rs_ccsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqd_shjl=request.getParameter("rs_ccsqd_shjl");
	if (rs_ccsqd_shjl!=null)
	{
		rs_ccsqd_shjl=cf.GB2Uni(rs_ccsqd_shjl);
		if (!(rs_ccsqd_shjl.equals("")))	wheresql+=" and  (rs_ccsqd.shjl='"+rs_ccsqd_shjl+"')";
	}

	ls_sql="SELECT rs_ccsqd.sqxh,DECODE(rs_ccsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_ccsqd.ygbh,rs_ccsqd.yhmc, DECODE(rs_ccsqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_ccsqd.xzzwbm,rs_ccsqd.kssj,rs_ccsqd.jzsj,rs_ccsqd.ljts,rs_ccsqd.yysm,rs_ccsqd.sqrq,rs_ccsqd.lrr,rs_ccsqd.lrsj,c.dwmc lrbm,rs_ccsqd.bz,rs_ccsqd.spxh,rs_ccsqd.shr,rs_ccsqd.shsj,shjlmc,rs_ccsqd.shyj";
	ls_sql+=" FROM rs_ccsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_ccsqd.fgsbh=a.dwbh(+) and rs_ccsqd.dwbh=b.dwbh(+) and rs_ccsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_ccsqd.shjl=rs_shjlbm.shjl(+) and rs_ccsqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ccsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ccsqdCxList.jsp","SelectCxRs_ccsqd.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_ccsqd_ygbh","rs_ccsqd_yhmc","rs_ccsqd_xb","rs_ccsqd_yfgsbh","rs_ccsqd_dwbh","rs_ccsqd_xzzwbm","rs_ccsqd_yrzsj","rs_ccsqd_ylzrq","rs_ccsqd_ylzyy","rs_ccsqd_xdwbh","rs_ccsqd_xxzzwbm","rs_ccsqd_xrzyy","rs_ccsqd_lrr","rs_ccsqd_lrsj","rs_ccsqd_lrbm","rs_ccsqd_bz","rs_ccsqd_clzt","rs_ccsqd_ztbm","rs_ccsqd_spxh","rs_ccsqd_shr","rs_ccsqd_shsj","rs_ccsqd_shjl","rs_ccsqd_shyj"};
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
	coluParm.link="ViewRs_ccsqd.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询出差申请</font></B>
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
	<td  width="3%">累计天数</td>
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