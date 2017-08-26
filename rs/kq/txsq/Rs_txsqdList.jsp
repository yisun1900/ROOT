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
	String rs_txsqd_fgsbh=null;
	String rs_txsqd_dwbh=null;
	String rs_txsqd_ygbh=null;
	String rs_txsqd_yhmc=null;
	String rs_txsqd_xb=null;
	String rs_txsqd_xzzwbm=null;

	String rs_txsqd_sqxh=null;
	String rs_txsqd_lrr=null;
	String rs_txsqd_lrsj=null;
	String rs_txsqd_lrbm=null;
	String sqrq=null;

	String rs_txsqd_clzt=null;
	String rs_txsqd_ztbm=null;
	String rs_txsqd_spxh=null;
	String rs_txsqd_shjl=null;
	String rs_txsqd_shsj=null;
	String rs_txsqd_shr=null;

	rs_txsqd_fgsbh=request.getParameter("rs_txsqd_fgsbh");
	if (rs_txsqd_fgsbh!=null)
	{
		rs_txsqd_fgsbh=cf.GB2Uni(rs_txsqd_fgsbh);
		if (!(rs_txsqd_fgsbh.equals("")))	wheresql+=" and  (rs_txsqd.fgsbh='"+rs_txsqd_fgsbh+"')";
	}
	rs_txsqd_dwbh=request.getParameter("rs_txsqd_dwbh");
	if (rs_txsqd_dwbh!=null)
	{
		rs_txsqd_dwbh=cf.GB2Uni(rs_txsqd_dwbh);
		if (!(rs_txsqd_dwbh.equals("")))	wheresql+=" and  (rs_txsqd.dwbh='"+rs_txsqd_dwbh+"')";
	}
	rs_txsqd_ygbh=request.getParameter("rs_txsqd_ygbh");
	if (rs_txsqd_ygbh!=null)
	{
		rs_txsqd_ygbh=rs_txsqd_ygbh.trim();
		if (!(rs_txsqd_ygbh.equals("")))	wheresql+=" and (rs_txsqd.ygbh="+rs_txsqd_ygbh+") ";
	}
	rs_txsqd_yhmc=request.getParameter("rs_txsqd_yhmc");
	if (rs_txsqd_yhmc!=null)
	{
		rs_txsqd_yhmc=cf.GB2Uni(rs_txsqd_yhmc);
		if (!(rs_txsqd_yhmc.equals("")))	wheresql+=" and  (rs_txsqd.yhmc like '%"+rs_txsqd_yhmc+"%')";
	}
	rs_txsqd_xb=request.getParameter("rs_txsqd_xb");
	if (rs_txsqd_xb!=null)
	{
		rs_txsqd_xb=cf.GB2Uni(rs_txsqd_xb);
		if (!(rs_txsqd_xb.equals("")))	wheresql+=" and  (rs_txsqd.xb='"+rs_txsqd_xb+"')";
	}

	rs_txsqd_xzzwbm=request.getParameter("rs_txsqd_xzzwbm");
	if (rs_txsqd_xzzwbm!=null)
	{
		rs_txsqd_xzzwbm=cf.GB2Uni(rs_txsqd_xzzwbm);
		if (!(rs_txsqd_xzzwbm.equals("")))	wheresql+=" and  (rs_txsqd.xzzwbm='"+rs_txsqd_xzzwbm+"')";
	}

	
	rs_txsqd_sqxh=request.getParameter("rs_txsqd_sqxh");
	if (rs_txsqd_sqxh!=null)
	{
		rs_txsqd_sqxh=cf.GB2Uni(rs_txsqd_sqxh);
		if (!(rs_txsqd_sqxh.equals("")))	wheresql+=" and  (rs_txsqd.sqxh='"+rs_txsqd_sqxh+"')";
	}
	rs_txsqd_lrr=request.getParameter("rs_txsqd_lrr");
	if (rs_txsqd_lrr!=null)
	{
		rs_txsqd_lrr=cf.GB2Uni(rs_txsqd_lrr);
		if (!(rs_txsqd_lrr.equals("")))	wheresql+=" and  (rs_txsqd.lrr='"+rs_txsqd_lrr+"')";
	}
	rs_txsqd_lrsj=request.getParameter("rs_txsqd_lrsj");
	if (rs_txsqd_lrsj!=null)
	{
		rs_txsqd_lrsj=rs_txsqd_lrsj.trim();
		if (!(rs_txsqd_lrsj.equals("")))	wheresql+="  and (rs_txsqd.lrsj>=TO_DATE('"+rs_txsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_txsqd_lrsj=request.getParameter("rs_txsqd_lrsj2");
	if (rs_txsqd_lrsj!=null)
	{
		rs_txsqd_lrsj=rs_txsqd_lrsj.trim();
		if (!(rs_txsqd_lrsj.equals("")))	wheresql+="  and (rs_txsqd.lrsj<=TO_DATE('"+rs_txsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_txsqd_lrbm=request.getParameter("rs_txsqd_lrbm");
	if (rs_txsqd_lrbm!=null)
	{
		rs_txsqd_lrbm=cf.GB2Uni(rs_txsqd_lrbm);
		if (!(rs_txsqd_lrbm.equals("")))	wheresql+=" and  (rs_txsqd.lrbm='"+rs_txsqd_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_txsqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_txsqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_txsqd_clzt=request.getParameter("rs_txsqd_clzt");
	if (rs_txsqd_clzt!=null)
	{
		rs_txsqd_clzt=cf.GB2Uni(rs_txsqd_clzt);
		if (!(rs_txsqd_clzt.equals("")))	wheresql+=" and  (rs_txsqd.clzt='"+rs_txsqd_clzt+"')";
	}
	rs_txsqd_ztbm=request.getParameter("rs_txsqd_ztbm");
	if (rs_txsqd_ztbm!=null)
	{
		rs_txsqd_ztbm=cf.GB2Uni(rs_txsqd_ztbm);
		if (!(rs_txsqd_ztbm.equals("")))	wheresql+=" and  (rs_txsqd.ztbm='"+rs_txsqd_ztbm+"')";
	}
	rs_txsqd_spxh=request.getParameter("rs_txsqd_spxh");
	if (rs_txsqd_spxh!=null)
	{
		rs_txsqd_spxh=rs_txsqd_spxh.trim();
		if (!(rs_txsqd_spxh.equals("")))	wheresql+=" and (rs_txsqd.spxh="+rs_txsqd_spxh+") ";
	}
	rs_txsqd_shr=request.getParameter("rs_txsqd_shr");
	if (rs_txsqd_shr!=null)
	{
		rs_txsqd_shr=cf.GB2Uni(rs_txsqd_shr);
		if (!(rs_txsqd_shr.equals("")))	wheresql+=" and  (rs_txsqd.shr='"+rs_txsqd_shr+"')";
	}
	rs_txsqd_shsj=request.getParameter("rs_txsqd_shsj");
	if (rs_txsqd_shsj!=null)
	{
		rs_txsqd_shsj=rs_txsqd_shsj.trim();
		if (!(rs_txsqd_shsj.equals("")))	wheresql+="  and (rs_txsqd.shsj>=TO_DATE('"+rs_txsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_txsqd_shsj=request.getParameter("rs_txsqd_shsj2");
	if (rs_txsqd_shsj!=null)
	{
		rs_txsqd_shsj=rs_txsqd_shsj.trim();
		if (!(rs_txsqd_shsj.equals("")))	wheresql+="  and (rs_txsqd.shsj<=TO_DATE('"+rs_txsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_txsqd_shjl=request.getParameter("rs_txsqd_shjl");
	if (rs_txsqd_shjl!=null)
	{
		rs_txsqd_shjl=cf.GB2Uni(rs_txsqd_shjl);
		if (!(rs_txsqd_shjl.equals("")))	wheresql+=" and  (rs_txsqd.shjl='"+rs_txsqd_shjl+"')";
	}

	ls_sql="SELECT rs_txsqd.sqxh,DECODE(rs_txsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_txsqd.ygbh,rs_txsqd.yhmc, DECODE(rs_txsqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_txsqd.xzzwbm,rs_txsqd.kssj,rs_txsqd.jzsj,rs_txsqd.ljts,rs_txsqd.yysm,rs_txsqd.sqrq,rs_txsqd.lrr,rs_txsqd.lrsj,c.dwmc lrbm,rs_txsqd.bz,rs_txsqd.spxh,rs_txsqd.shr,rs_txsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_txsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_txsqd.fgsbh=a.dwbh(+) and rs_txsqd.dwbh=b.dwbh(+) and rs_txsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_txsqd.shjl=rs_shjlbm.shjl(+) and rs_txsqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_txsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_txsqdList.jsp","SelectRs_txsqd.jsp","","EditRs_txsqd.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_txsqd_ygbh","rs_txsqd_yhmc","rs_txsqd_xb","rs_txsqd_yfgsbh","rs_txsqd_dwbh","rs_txsqd_xzzwbm","rs_txsqd_yrzsj","rs_txsqd_ylzrq","rs_txsqd_ylzyy","rs_txsqd_xdwbh","rs_txsqd_xxzzwbm","rs_txsqd_xrzyy","rs_txsqd_lrr","rs_txsqd_lrsj","rs_txsqd_lrbm","rs_txsqd_bz","rs_txsqd_clzt","rs_txsqd_ztbm","rs_txsqd_spxh","rs_txsqd_shr","rs_txsqd_shsj","rs_txsqd_shjl","rs_txsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteRs_txsqd.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_txsqd.jsp";//为列参数：coluParm.link设置超级链接
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