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
	String rs_kqksqd_fgsbh=null;
	String rs_kqksqd_dwbh=null;
	String rs_kqksqd_ygbh=null;
	String rs_kqksqd_yhmc=null;
	String rs_kqksqd_xb=null;
	String rs_kqksqd_xzzwbm=null;

	String rs_kqksqd_sqxh=null;
	String rs_kqksqd_lrr=null;
	String rs_kqksqd_lrsj=null;
	String rs_kqksqd_lrbm=null;
	String sqrq=null;

	String rs_kqksqd_clzt=null;
	String rs_kqksqd_ztbm=null;
	String rs_kqksqd_spxh=null;
	String rs_kqksqd_shjl=null;
	String rs_kqksqd_shsj=null;
	String rs_kqksqd_shr=null;

	rs_kqksqd_fgsbh=request.getParameter("rs_kqksqd_fgsbh");
	if (rs_kqksqd_fgsbh!=null)
	{
		rs_kqksqd_fgsbh=cf.GB2Uni(rs_kqksqd_fgsbh);
		if (!(rs_kqksqd_fgsbh.equals("")))	wheresql+=" and  (rs_kqksqd.fgsbh='"+rs_kqksqd_fgsbh+"')";
	}
	rs_kqksqd_dwbh=request.getParameter("rs_kqksqd_dwbh");
	if (rs_kqksqd_dwbh!=null)
	{
		rs_kqksqd_dwbh=cf.GB2Uni(rs_kqksqd_dwbh);
		if (!(rs_kqksqd_dwbh.equals("")))	wheresql+=" and  (rs_kqksqd.dwbh='"+rs_kqksqd_dwbh+"')";
	}
	rs_kqksqd_ygbh=request.getParameter("rs_kqksqd_ygbh");
	if (rs_kqksqd_ygbh!=null)
	{
		rs_kqksqd_ygbh=rs_kqksqd_ygbh.trim();
		if (!(rs_kqksqd_ygbh.equals("")))	wheresql+=" and (rs_kqksqd.ygbh="+rs_kqksqd_ygbh+") ";
	}
	rs_kqksqd_yhmc=request.getParameter("rs_kqksqd_yhmc");
	if (rs_kqksqd_yhmc!=null)
	{
		rs_kqksqd_yhmc=cf.GB2Uni(rs_kqksqd_yhmc);
		if (!(rs_kqksqd_yhmc.equals("")))	wheresql+=" and  (rs_kqksqd.yhmc like '%"+rs_kqksqd_yhmc+"%')";
	}
	rs_kqksqd_xb=request.getParameter("rs_kqksqd_xb");
	if (rs_kqksqd_xb!=null)
	{
		rs_kqksqd_xb=cf.GB2Uni(rs_kqksqd_xb);
		if (!(rs_kqksqd_xb.equals("")))	wheresql+=" and  (rs_kqksqd.xb='"+rs_kqksqd_xb+"')";
	}

	rs_kqksqd_xzzwbm=request.getParameter("rs_kqksqd_xzzwbm");
	if (rs_kqksqd_xzzwbm!=null)
	{
		rs_kqksqd_xzzwbm=cf.GB2Uni(rs_kqksqd_xzzwbm);
		if (!(rs_kqksqd_xzzwbm.equals("")))	wheresql+=" and  (rs_kqksqd.xzzwbm='"+rs_kqksqd_xzzwbm+"')";
	}

	
	rs_kqksqd_sqxh=request.getParameter("rs_kqksqd_sqxh");
	if (rs_kqksqd_sqxh!=null)
	{
		rs_kqksqd_sqxh=cf.GB2Uni(rs_kqksqd_sqxh);
		if (!(rs_kqksqd_sqxh.equals("")))	wheresql+=" and  (rs_kqksqd.sqxh='"+rs_kqksqd_sqxh+"')";
	}
	rs_kqksqd_lrr=request.getParameter("rs_kqksqd_lrr");
	if (rs_kqksqd_lrr!=null)
	{
		rs_kqksqd_lrr=cf.GB2Uni(rs_kqksqd_lrr);
		if (!(rs_kqksqd_lrr.equals("")))	wheresql+=" and  (rs_kqksqd.lrr='"+rs_kqksqd_lrr+"')";
	}
	rs_kqksqd_lrsj=request.getParameter("rs_kqksqd_lrsj");
	if (rs_kqksqd_lrsj!=null)
	{
		rs_kqksqd_lrsj=rs_kqksqd_lrsj.trim();
		if (!(rs_kqksqd_lrsj.equals("")))	wheresql+="  and (rs_kqksqd.lrsj>=TO_DATE('"+rs_kqksqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqd_lrsj=request.getParameter("rs_kqksqd_lrsj2");
	if (rs_kqksqd_lrsj!=null)
	{
		rs_kqksqd_lrsj=rs_kqksqd_lrsj.trim();
		if (!(rs_kqksqd_lrsj.equals("")))	wheresql+="  and (rs_kqksqd.lrsj<=TO_DATE('"+rs_kqksqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqd_lrbm=request.getParameter("rs_kqksqd_lrbm");
	if (rs_kqksqd_lrbm!=null)
	{
		rs_kqksqd_lrbm=cf.GB2Uni(rs_kqksqd_lrbm);
		if (!(rs_kqksqd_lrbm.equals("")))	wheresql+=" and  (rs_kqksqd.lrbm='"+rs_kqksqd_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_kqksqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_kqksqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_kqksqd_clzt=request.getParameter("rs_kqksqd_clzt");
	if (rs_kqksqd_clzt!=null)
	{
		rs_kqksqd_clzt=cf.GB2Uni(rs_kqksqd_clzt);
		if (!(rs_kqksqd_clzt.equals("")))	wheresql+=" and  (rs_kqksqd.clzt='"+rs_kqksqd_clzt+"')";
	}
	rs_kqksqd_ztbm=request.getParameter("rs_kqksqd_ztbm");
	if (rs_kqksqd_ztbm!=null)
	{
		rs_kqksqd_ztbm=cf.GB2Uni(rs_kqksqd_ztbm);
		if (!(rs_kqksqd_ztbm.equals("")))	wheresql+=" and  (rs_kqksqd.ztbm='"+rs_kqksqd_ztbm+"')";
	}
	rs_kqksqd_spxh=request.getParameter("rs_kqksqd_spxh");
	if (rs_kqksqd_spxh!=null)
	{
		rs_kqksqd_spxh=rs_kqksqd_spxh.trim();
		if (!(rs_kqksqd_spxh.equals("")))	wheresql+=" and (rs_kqksqd.spxh="+rs_kqksqd_spxh+") ";
	}
	rs_kqksqd_shr=request.getParameter("rs_kqksqd_shr");
	if (rs_kqksqd_shr!=null)
	{
		rs_kqksqd_shr=cf.GB2Uni(rs_kqksqd_shr);
		if (!(rs_kqksqd_shr.equals("")))	wheresql+=" and  (rs_kqksqd.shr='"+rs_kqksqd_shr+"')";
	}
	rs_kqksqd_shsj=request.getParameter("rs_kqksqd_shsj");
	if (rs_kqksqd_shsj!=null)
	{
		rs_kqksqd_shsj=rs_kqksqd_shsj.trim();
		if (!(rs_kqksqd_shsj.equals("")))	wheresql+="  and (rs_kqksqd.shsj>=TO_DATE('"+rs_kqksqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqd_shsj=request.getParameter("rs_kqksqd_shsj2");
	if (rs_kqksqd_shsj!=null)
	{
		rs_kqksqd_shsj=rs_kqksqd_shsj.trim();
		if (!(rs_kqksqd_shsj.equals("")))	wheresql+="  and (rs_kqksqd.shsj<=TO_DATE('"+rs_kqksqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqd_shjl=request.getParameter("rs_kqksqd_shjl");
	if (rs_kqksqd_shjl!=null)
	{
		rs_kqksqd_shjl=cf.GB2Uni(rs_kqksqd_shjl);
		if (!(rs_kqksqd_shjl.equals("")))	wheresql+=" and  (rs_kqksqd.shjl='"+rs_kqksqd_shjl+"')";
	}

	ls_sql="SELECT rs_kqksqd.sqxh,DECODE(rs_kqksqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_kqksqd.ygbh,rs_kqksqd.yhmc, DECODE(rs_kqksqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_kqksqd.xzzwbm,rs_kqksqd.kssj,rs_kqksqd.jzsj,rs_kqksqd.ljts,rs_kqksqd.yysm,rs_kqksqd.sqrq,rs_kqksqd.lrr,rs_kqksqd.lrsj,c.dwmc lrbm,rs_kqksqd.bz,rs_kqksqd.spxh,rs_kqksqd.shr,rs_kqksqd.shsj,shjlmc";
	ls_sql+=" FROM rs_kqksqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_kqksqd.fgsbh=a.dwbh(+) and rs_kqksqd.dwbh=b.dwbh(+) and rs_kqksqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_kqksqd.shjl=rs_shjlbm.shjl(+) and rs_kqksqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_kqksqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_kqksqdList.jsp","SelectRs_kqksqd.jsp","","EditRs_kqksqd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_kqksqd_ygbh","rs_kqksqd_yhmc","rs_kqksqd_xb","rs_kqksqd_yfgsbh","rs_kqksqd_dwbh","rs_kqksqd_xzzwbm","rs_kqksqd_yrzsj","rs_kqksqd_ylzrq","rs_kqksqd_ylzyy","rs_kqksqd_xdwbh","rs_kqksqd_xxzzwbm","rs_kqksqd_xrzyy","rs_kqksqd_lrr","rs_kqksqd_lrsj","rs_kqksqd_lrbm","rs_kqksqd_bz","rs_kqksqd_clzt","rs_kqksqd_ztbm","rs_kqksqd_spxh","rs_kqksqd_shr","rs_kqksqd_shsj","rs_kqksqd_shjl","rs_kqksqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteRs_kqksqd.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_kqksqd.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">修改申请</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">申请序号</td>
	<td  width="3%">处理状态</td>
	<td  width="6%">审批状态</td>
	<td  width="5%">所属分公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="5%">所属部门</td>
	<td  width="4%">职务</td>

	<td  width="4%">开始时间</td>
	<td  width="4%">截至时间</td>
	<td  width="3%">累计天数</td>
	<td  width="14%">原因说明</td>
	<td  width="4%">申请日期</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="9%">备注</td>
	<td  width="3%">审批序号</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="4%">审核结论</td>
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