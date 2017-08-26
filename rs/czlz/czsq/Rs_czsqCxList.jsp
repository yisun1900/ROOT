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
	String rs_czsq_fgsbh=null;
	String rs_czsq_dwbh=null;
	String rs_czsq_ygbh=null;
	String rs_czsq_yhmc=null;
	String rs_czsq_xb=null;
	String rs_czsq_xzzwbm=null;

	String rs_czsq_sqxh=null;
	String rs_czsq_lrr=null;
	String rs_czsq_lrsj=null;
	String rs_czsq_lrbm=null;
	String sqrq=null;

	String rs_czsq_clzt=null;
	String rs_czsq_ztbm=null;
	String rs_czsq_spxh=null;
	String rs_czsq_shjl=null;
	String rs_czsq_shsj=null;
	String rs_czsq_shr=null;

	String lzyyflbm=null;
	lzyyflbm=request.getParameter("lzyyflbm");
	if (lzyyflbm!=null)
	{
		lzyyflbm=cf.GB2Uni(lzyyflbm);
		if (!(lzyyflbm.equals("")))	wheresql+=" and  (rs_czsq.lzyyflbm='"+lzyyflbm+"')";
	}

	rs_czsq_fgsbh=request.getParameter("rs_czsq_fgsbh");
	if (rs_czsq_fgsbh!=null)
	{
		rs_czsq_fgsbh=cf.GB2Uni(rs_czsq_fgsbh);
		if (!(rs_czsq_fgsbh.equals("")))	wheresql+=" and  (rs_czsq.fgsbh='"+rs_czsq_fgsbh+"')";
	}
	rs_czsq_dwbh=request.getParameter("rs_czsq_dwbh");
	if (rs_czsq_dwbh!=null)
	{
		rs_czsq_dwbh=cf.GB2Uni(rs_czsq_dwbh);
		if (!(rs_czsq_dwbh.equals("")))	wheresql+=" and  (rs_czsq.dwbh='"+rs_czsq_dwbh+"')";
	}
	rs_czsq_ygbh=request.getParameter("rs_czsq_ygbh");
	if (rs_czsq_ygbh!=null)
	{
		rs_czsq_ygbh=rs_czsq_ygbh.trim();
		if (!(rs_czsq_ygbh.equals("")))	wheresql+=" and (rs_czsq.ygbh="+rs_czsq_ygbh+") ";
	}
	rs_czsq_yhmc=request.getParameter("rs_czsq_yhmc");
	if (rs_czsq_yhmc!=null)
	{
		rs_czsq_yhmc=cf.GB2Uni(rs_czsq_yhmc);
		if (!(rs_czsq_yhmc.equals("")))	wheresql+=" and  (rs_czsq.yhmc like '%"+rs_czsq_yhmc+"%')";
	}
	rs_czsq_xb=request.getParameter("rs_czsq_xb");
	if (rs_czsq_xb!=null)
	{
		rs_czsq_xb=cf.GB2Uni(rs_czsq_xb);
		if (!(rs_czsq_xb.equals("")))	wheresql+=" and  (rs_czsq.xb='"+rs_czsq_xb+"')";
	}

	rs_czsq_xzzwbm=request.getParameter("rs_czsq_xzzwbm");
	if (rs_czsq_xzzwbm!=null)
	{
		rs_czsq_xzzwbm=cf.GB2Uni(rs_czsq_xzzwbm);
		if (!(rs_czsq_xzzwbm.equals("")))	wheresql+=" and  (rs_czsq.xzzwbm='"+rs_czsq_xzzwbm+"')";
	}

	
	rs_czsq_sqxh=request.getParameter("rs_czsq_sqxh");
	if (rs_czsq_sqxh!=null)
	{
		rs_czsq_sqxh=cf.GB2Uni(rs_czsq_sqxh);
		if (!(rs_czsq_sqxh.equals("")))	wheresql+=" and  (rs_czsq.sqxh='"+rs_czsq_sqxh+"')";
	}
	rs_czsq_lrr=request.getParameter("rs_czsq_lrr");
	if (rs_czsq_lrr!=null)
	{
		rs_czsq_lrr=cf.GB2Uni(rs_czsq_lrr);
		if (!(rs_czsq_lrr.equals("")))	wheresql+=" and  (rs_czsq.lrr='"+rs_czsq_lrr+"')";
	}
	rs_czsq_lrsj=request.getParameter("rs_czsq_lrsj");
	if (rs_czsq_lrsj!=null)
	{
		rs_czsq_lrsj=rs_czsq_lrsj.trim();
		if (!(rs_czsq_lrsj.equals("")))	wheresql+="  and (rs_czsq.lrsj>=TO_DATE('"+rs_czsq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_czsq_lrsj=request.getParameter("rs_czsq_lrsj2");
	if (rs_czsq_lrsj!=null)
	{
		rs_czsq_lrsj=rs_czsq_lrsj.trim();
		if (!(rs_czsq_lrsj.equals("")))	wheresql+="  and (rs_czsq.lrsj<=TO_DATE('"+rs_czsq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_czsq_lrbm=request.getParameter("rs_czsq_lrbm");
	if (rs_czsq_lrbm!=null)
	{
		rs_czsq_lrbm=cf.GB2Uni(rs_czsq_lrbm);
		if (!(rs_czsq_lrbm.equals("")))	wheresql+=" and  (rs_czsq.lrbm='"+rs_czsq_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_czsq.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_czsq.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_czsq_clzt=request.getParameter("rs_czsq_clzt");
	if (rs_czsq_clzt!=null)
	{
		rs_czsq_clzt=cf.GB2Uni(rs_czsq_clzt);
		if (!(rs_czsq_clzt.equals("")))	wheresql+=" and  (rs_czsq.clzt='"+rs_czsq_clzt+"')";
	}
	rs_czsq_ztbm=request.getParameter("rs_czsq_ztbm");
	if (rs_czsq_ztbm!=null)
	{
		rs_czsq_ztbm=cf.GB2Uni(rs_czsq_ztbm);
		if (!(rs_czsq_ztbm.equals("")))	wheresql+=" and  (rs_czsq.ztbm='"+rs_czsq_ztbm+"')";
	}
	rs_czsq_spxh=request.getParameter("rs_czsq_spxh");
	if (rs_czsq_spxh!=null)
	{
		rs_czsq_spxh=rs_czsq_spxh.trim();
		if (!(rs_czsq_spxh.equals("")))	wheresql+=" and (rs_czsq.spxh="+rs_czsq_spxh+") ";
	}
	rs_czsq_shr=request.getParameter("rs_czsq_shr");
	if (rs_czsq_shr!=null)
	{
		rs_czsq_shr=cf.GB2Uni(rs_czsq_shr);
		if (!(rs_czsq_shr.equals("")))	wheresql+=" and  (rs_czsq.shr='"+rs_czsq_shr+"')";
	}
	rs_czsq_shsj=request.getParameter("rs_czsq_shsj");
	if (rs_czsq_shsj!=null)
	{
		rs_czsq_shsj=rs_czsq_shsj.trim();
		if (!(rs_czsq_shsj.equals("")))	wheresql+="  and (rs_czsq.shsj>=TO_DATE('"+rs_czsq_shsj+"','YYYY/MM/DD'))";
	}
	rs_czsq_shsj=request.getParameter("rs_czsq_shsj2");
	if (rs_czsq_shsj!=null)
	{
		rs_czsq_shsj=rs_czsq_shsj.trim();
		if (!(rs_czsq_shsj.equals("")))	wheresql+="  and (rs_czsq.shsj<=TO_DATE('"+rs_czsq_shsj+"','YYYY/MM/DD'))";
	}
	rs_czsq_shjl=request.getParameter("rs_czsq_shjl");
	if (rs_czsq_shjl!=null)
	{
		rs_czsq_shjl=cf.GB2Uni(rs_czsq_shjl);
		if (!(rs_czsq_shjl.equals("")))	wheresql+=" and  (rs_czsq.shjl='"+rs_czsq_shjl+"')";
	}

	ls_sql="SELECT rs_czsq.sqxh,DECODE(rs_czsq.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已离职'),ztmc,a.dwmc fgsbh,rs_czsq.ygbh,rs_czsq.yhmc,rs_czsq.bianhao,rs_czsq.sfzh,rs_czsq.xzzwbm,rs_czsq.rzsj,b.dwmc dwbh,lzyyflmc,rs_czsq.yysm,rs_czsq.sqrq,rs_czsq.lrr,rs_czsq.lrsj,c.dwmc lrbm,rs_czsq.bz,rs_czsq.spxh,rs_czsq.shr,rs_czsq.shsj,shjlmc,rs_czsq.shyj";
	ls_sql+=" FROM rs_czsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm,dm_lzyyflbm ";
    ls_sql+=" where rs_czsq.fgsbh=a.dwbh(+) and rs_czsq.dwbh=b.dwbh(+) and rs_czsq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_czsq.shjl=rs_shjlbm.shjl(+) and rs_czsq.ztbm=rs_ztbm.ztbm(+) and rs_czsq.lzyyflbm=dm_lzyyflbm.lzyyflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_czsq.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_czsqCxList.jsp","SelectCxRs_czsq.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_czsq_ygbh","rs_czsq_yhmc","rs_czsq_xb","rs_czsq_yfgsbh","rs_czsq_dwbh","rs_czsq_xzzwbm","rs_czsq_yrzsj","rs_czsq_ylzrq","rs_czsq_ylzyy","rs_czsq_xdwbh","rs_czsq_xxzzwbm","rs_czsq_xrzyy","rs_czsq_lrr","rs_czsq_lrsj","rs_czsq_lrbm","rs_czsq_bz","rs_czsq_clzt","rs_czsq_ztbm","rs_czsq_spxh","rs_czsq_shr","rs_czsq_shsj","rs_czsq_shjl","rs_czsq_shyj"};
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
	coluParm.link="ViewRs_czsq.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询辞职申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">辞职申请序号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">审批状态</td>
	<td  width="4%">所属分公司</td>
	<td  width="2%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="3%">工号</td>
	<td  width="5%">身份证号</td>
	<td  width="3%">行政职务</td>
	<td  width="3%">入职日期</td>
	<td  width="5%">所属部门</td>

	<td  width="4%">离职原因分类</td>
	<td  width="13%">离职原因</td>
	<td  width="3%">申请日期</td>
	<td  width="3%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="9%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="3%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
	<td  width="10%">审核意见</td>
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