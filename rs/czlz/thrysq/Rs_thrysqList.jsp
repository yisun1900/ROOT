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
	String rs_thrysq_fgsbh=null;
	String rs_thrysq_dwbh=null;
	String rs_thrysq_ygbh=null;
	String rs_thrysq_yhmc=null;
	String rs_thrysq_xb=null;
	String rs_thrysq_xzzwbm=null;

	String rs_thrysq_sqxh=null;
	String rs_thrysq_lrr=null;
	String rs_thrysq_lrsj=null;
	String rs_thrysq_lrbm=null;
	String sqrq=null;

	String rs_thrysq_clzt=null;
	String rs_thrysq_ztbm=null;
	String rs_thrysq_spxh=null;
	String rs_thrysq_shjl=null;
	String rs_thrysq_shsj=null;
	String rs_thrysq_shr=null;


	rs_thrysq_fgsbh=request.getParameter("rs_thrysq_fgsbh");
	if (rs_thrysq_fgsbh!=null)
	{
		rs_thrysq_fgsbh=cf.GB2Uni(rs_thrysq_fgsbh);
		if (!(rs_thrysq_fgsbh.equals("")))	wheresql+=" and  (rs_thrysq.fgsbh='"+rs_thrysq_fgsbh+"')";
	}
	rs_thrysq_dwbh=request.getParameter("rs_thrysq_dwbh");
	if (rs_thrysq_dwbh!=null)
	{
		rs_thrysq_dwbh=cf.GB2Uni(rs_thrysq_dwbh);
		if (!(rs_thrysq_dwbh.equals("")))	wheresql+=" and  (rs_thrysq.dwbh='"+rs_thrysq_dwbh+"')";
	}
	rs_thrysq_ygbh=request.getParameter("rs_thrysq_ygbh");
	if (rs_thrysq_ygbh!=null)
	{
		rs_thrysq_ygbh=rs_thrysq_ygbh.trim();
		if (!(rs_thrysq_ygbh.equals("")))	wheresql+=" and (rs_thrysq.ygbh="+rs_thrysq_ygbh+") ";
	}
	rs_thrysq_yhmc=request.getParameter("rs_thrysq_yhmc");
	if (rs_thrysq_yhmc!=null)
	{
		rs_thrysq_yhmc=cf.GB2Uni(rs_thrysq_yhmc);
		if (!(rs_thrysq_yhmc.equals("")))	wheresql+=" and  (rs_thrysq.yhmc like '%"+rs_thrysq_yhmc+"%')";
	}
	rs_thrysq_xb=request.getParameter("rs_thrysq_xb");
	if (rs_thrysq_xb!=null)
	{
		rs_thrysq_xb=cf.GB2Uni(rs_thrysq_xb);
		if (!(rs_thrysq_xb.equals("")))	wheresql+=" and  (rs_thrysq.xb='"+rs_thrysq_xb+"')";
	}

	rs_thrysq_xzzwbm=request.getParameter("rs_thrysq_xzzwbm");
	if (rs_thrysq_xzzwbm!=null)
	{
		rs_thrysq_xzzwbm=cf.GB2Uni(rs_thrysq_xzzwbm);
		if (!(rs_thrysq_xzzwbm.equals("")))	wheresql+=" and  (rs_thrysq.xzzwbm='"+rs_thrysq_xzzwbm+"')";
	}

	
	rs_thrysq_sqxh=request.getParameter("rs_thrysq_sqxh");
	if (rs_thrysq_sqxh!=null)
	{
		rs_thrysq_sqxh=cf.GB2Uni(rs_thrysq_sqxh);
		if (!(rs_thrysq_sqxh.equals("")))	wheresql+=" and  (rs_thrysq.sqxh='"+rs_thrysq_sqxh+"')";
	}
	rs_thrysq_lrr=request.getParameter("rs_thrysq_lrr");
	if (rs_thrysq_lrr!=null)
	{
		rs_thrysq_lrr=cf.GB2Uni(rs_thrysq_lrr);
		if (!(rs_thrysq_lrr.equals("")))	wheresql+=" and  (rs_thrysq.lrr='"+rs_thrysq_lrr+"')";
	}
	rs_thrysq_lrsj=request.getParameter("rs_thrysq_lrsj");
	if (rs_thrysq_lrsj!=null)
	{
		rs_thrysq_lrsj=rs_thrysq_lrsj.trim();
		if (!(rs_thrysq_lrsj.equals("")))	wheresql+="  and (rs_thrysq.lrsj>=TO_DATE('"+rs_thrysq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_thrysq_lrsj=request.getParameter("rs_thrysq_lrsj2");
	if (rs_thrysq_lrsj!=null)
	{
		rs_thrysq_lrsj=rs_thrysq_lrsj.trim();
		if (!(rs_thrysq_lrsj.equals("")))	wheresql+="  and (rs_thrysq.lrsj<=TO_DATE('"+rs_thrysq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_thrysq_lrbm=request.getParameter("rs_thrysq_lrbm");
	if (rs_thrysq_lrbm!=null)
	{
		rs_thrysq_lrbm=cf.GB2Uni(rs_thrysq_lrbm);
		if (!(rs_thrysq_lrbm.equals("")))	wheresql+=" and  (rs_thrysq.lrbm='"+rs_thrysq_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_thrysq.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_thrysq.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_thrysq_clzt=request.getParameter("rs_thrysq_clzt");
	if (rs_thrysq_clzt!=null)
	{
		rs_thrysq_clzt=cf.GB2Uni(rs_thrysq_clzt);
		if (!(rs_thrysq_clzt.equals("")))	wheresql+=" and  (rs_thrysq.clzt='"+rs_thrysq_clzt+"')";
	}
	rs_thrysq_ztbm=request.getParameter("rs_thrysq_ztbm");
	if (rs_thrysq_ztbm!=null)
	{
		rs_thrysq_ztbm=cf.GB2Uni(rs_thrysq_ztbm);
		if (!(rs_thrysq_ztbm.equals("")))	wheresql+=" and  (rs_thrysq.ztbm='"+rs_thrysq_ztbm+"')";
	}
	rs_thrysq_spxh=request.getParameter("rs_thrysq_spxh");
	if (rs_thrysq_spxh!=null)
	{
		rs_thrysq_spxh=rs_thrysq_spxh.trim();
		if (!(rs_thrysq_spxh.equals("")))	wheresql+=" and (rs_thrysq.spxh="+rs_thrysq_spxh+") ";
	}
	rs_thrysq_shr=request.getParameter("rs_thrysq_shr");
	if (rs_thrysq_shr!=null)
	{
		rs_thrysq_shr=cf.GB2Uni(rs_thrysq_shr);
		if (!(rs_thrysq_shr.equals("")))	wheresql+=" and  (rs_thrysq.shr='"+rs_thrysq_shr+"')";
	}
	rs_thrysq_shsj=request.getParameter("rs_thrysq_shsj");
	if (rs_thrysq_shsj!=null)
	{
		rs_thrysq_shsj=rs_thrysq_shsj.trim();
		if (!(rs_thrysq_shsj.equals("")))	wheresql+="  and (rs_thrysq.shsj>=TO_DATE('"+rs_thrysq_shsj+"','YYYY/MM/DD'))";
	}
	rs_thrysq_shsj=request.getParameter("rs_thrysq_shsj2");
	if (rs_thrysq_shsj!=null)
	{
		rs_thrysq_shsj=rs_thrysq_shsj.trim();
		if (!(rs_thrysq_shsj.equals("")))	wheresql+="  and (rs_thrysq.shsj<=TO_DATE('"+rs_thrysq_shsj+"','YYYY/MM/DD'))";
	}
	rs_thrysq_shjl=request.getParameter("rs_thrysq_shjl");
	if (rs_thrysq_shjl!=null)
	{
		rs_thrysq_shjl=cf.GB2Uni(rs_thrysq_shjl);
		if (!(rs_thrysq_shjl.equals("")))	wheresql+=" and  (rs_thrysq.shjl='"+rs_thrysq_shjl+"')";
	}

	ls_sql="SELECT rs_thrysq.sqxh,DECODE(rs_thrysq.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_thrysq.ygbh,rs_thrysq.yhmc,rs_thrysq.bianhao,rs_thrysq.sfzh,rs_thrysq.xzzwbm,rs_thrysq.rzsj,b.dwmc dwbh,rs_thrysq.yysm,rs_thrysq.gzbx,rs_thrysq.wpjjqk,rs_thrysq.sqrq,rs_thrysq.lrr,rs_thrysq.lrsj,c.dwmc lrbm,rs_thrysq.bz,rs_thrysq.spxh,rs_thrysq.shr,rs_thrysq.shsj,shjlmc,rs_thrysq.shyj";
	ls_sql+=" FROM rs_thrysq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_thrysq.fgsbh=a.dwbh(+) and rs_thrysq.dwbh=b.dwbh(+) and rs_thrysq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_thrysq.shjl=rs_shjlbm.shjl(+) and rs_thrysq.ztbm=rs_ztbm.ztbm ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_thrysq.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_thrysqList.jsp","SelectRs_thrysq.jsp","","EditRs_thrysq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_thrysq_ygbh","rs_thrysq_yhmc","rs_thrysq_xb","rs_thrysq_yfgsbh","rs_thrysq_dwbh","rs_thrysq_xzzwbm","rs_thrysq_yrzsj","rs_thrysq_ylzrq","rs_thrysq_ylzyy","rs_thrysq_xdwbh","rs_thrysq_xxzzwbm","rs_thrysq_xrzyy","rs_thrysq_lrr","rs_thrysq_lrsj","rs_thrysq_lrbm","rs_thrysq_bz","rs_thrysq_clzt","rs_thrysq_ztbm","rs_thrysq_spxh","rs_thrysq_shr","rs_thrysq_shsj","rs_thrysq_shjl","rs_thrysq_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteRs_thrysq.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_thrysq.jsp";//为列参数：coluParm.link设置超级链接
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
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">退回人员申请序号</td>
	<td  width="2%">处理状态</td>
	<td  width="4%">审批状态</td>
	<td  width="3%">所属分公司</td>
	<td  width="2%">员工序号</td>
	<td  width="2%">员工名称</td>
	<td  width="2%">工号</td>
	<td  width="4%">身份证号</td>
	<td  width="3%">行政职务</td>
	<td  width="3%">入职日期</td>
	<td  width="4%">所属部门</td>

	<td  width="10%">退回原因</td>
	<td  width="10%">在职期间工作表现</td>
	<td  width="10%">物品交接情况</td>
	<td  width="3%">申请日期</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="7%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
	<td  width="8%">审核意见</td>
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