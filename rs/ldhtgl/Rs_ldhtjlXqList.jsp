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
	String rs_ldhtjl_ldhtbh=null;
	String rs_ldhtjl_ygbh=null;
	String rs_ldhtjl_yhmc=null;
	String rs_ldhtjl_bianhao=null;
	String rs_ldhtjl_sfzh=null;
	String rs_ldhtjl_xzzwbm=null;
	String dwbh=null;
	String ssfgs=null;
	String rs_ldhtjl_rzsj=null;
	String rs_ldhtjl_ldhtlx=null;
	String rs_ldhtjl_ldhtqx=null;
	String rs_ldhtjl_htksrq=null;
	String rs_ldhtjl_htdqrq=null;
	String rs_ldhtjl_lrr=null;
	String rs_ldhtjl_lrsj=null;
	String rs_ldhtjl_lrbm=null;
	rs_ldhtjl_ldhtbh=request.getParameter("rs_ldhtjl_ldhtbh");
	if (rs_ldhtjl_ldhtbh!=null)
	{
		rs_ldhtjl_ldhtbh=cf.GB2Uni(rs_ldhtjl_ldhtbh);
		if (!(rs_ldhtjl_ldhtbh.equals("")))	wheresql+=" and  (rs_ldhtjl.ldhtbh='"+rs_ldhtjl_ldhtbh+"')";
	}
	rs_ldhtjl_ygbh=request.getParameter("rs_ldhtjl_ygbh");
	if (rs_ldhtjl_ygbh!=null)
	{
		rs_ldhtjl_ygbh=rs_ldhtjl_ygbh.trim();
		if (!(rs_ldhtjl_ygbh.equals("")))	wheresql+=" and (rs_ldhtjl.ygbh="+rs_ldhtjl_ygbh+") ";
	}
	rs_ldhtjl_yhmc=request.getParameter("rs_ldhtjl_yhmc");
	if (rs_ldhtjl_yhmc!=null)
	{
		rs_ldhtjl_yhmc=cf.GB2Uni(rs_ldhtjl_yhmc);
		if (!(rs_ldhtjl_yhmc.equals("")))	wheresql+=" and  (rs_ldhtjl.yhmc='"+rs_ldhtjl_yhmc+"')";
	}
	rs_ldhtjl_bianhao=request.getParameter("rs_ldhtjl_bianhao");
	if (rs_ldhtjl_bianhao!=null)
	{
		rs_ldhtjl_bianhao=cf.GB2Uni(rs_ldhtjl_bianhao);
		if (!(rs_ldhtjl_bianhao.equals("")))	wheresql+=" and  (rs_ldhtjl.bianhao='"+rs_ldhtjl_bianhao+"')";
	}
	rs_ldhtjl_sfzh=request.getParameter("rs_ldhtjl_sfzh");
	if (rs_ldhtjl_sfzh!=null)
	{
		rs_ldhtjl_sfzh=cf.GB2Uni(rs_ldhtjl_sfzh);
		if (!(rs_ldhtjl_sfzh.equals("")))	wheresql+=" and  (rs_ldhtjl.sfzh='"+rs_ldhtjl_sfzh+"')";
	}
	rs_ldhtjl_xzzwbm=request.getParameter("rs_ldhtjl_xzzwbm");
	if (rs_ldhtjl_xzzwbm!=null)
	{
		rs_ldhtjl_xzzwbm=cf.GB2Uni(rs_ldhtjl_xzzwbm);
		if (!(rs_ldhtjl_xzzwbm.equals("")))	wheresql+=" and  (rs_ldhtjl.xzzwbm='"+rs_ldhtjl_xzzwbm+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_ldhtjl.dwbh='"+dwbh+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_ldhtjl.ssfgs='"+ssfgs+"')";
	}
	rs_ldhtjl_rzsj=request.getParameter("rs_ldhtjl_rzsj");
	if (rs_ldhtjl_rzsj!=null)
	{
		rs_ldhtjl_rzsj=rs_ldhtjl_rzsj.trim();
		if (!(rs_ldhtjl_rzsj.equals("")))	wheresql+="  and (rs_ldhtjl.rzsj>=TO_DATE('"+rs_ldhtjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_rzsj=request.getParameter("rs_ldhtjl_rzsj2");
	if (rs_ldhtjl_rzsj!=null)
	{
		rs_ldhtjl_rzsj=rs_ldhtjl_rzsj.trim();
		if (!(rs_ldhtjl_rzsj.equals("")))	wheresql+="  and (rs_ldhtjl.rzsj<=TO_DATE('"+rs_ldhtjl_rzsj+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_ldhtlx=request.getParameter("rs_ldhtjl_ldhtlx");
	if (rs_ldhtjl_ldhtlx!=null)
	{
		rs_ldhtjl_ldhtlx=cf.GB2Uni(rs_ldhtjl_ldhtlx);
		if (!(rs_ldhtjl_ldhtlx.equals("")))	wheresql+=" and  (rs_ldhtjl.ldhtlx='"+rs_ldhtjl_ldhtlx+"')";
	}
	rs_ldhtjl_ldhtqx=request.getParameter("rs_ldhtjl_ldhtqx");
	if (rs_ldhtjl_ldhtqx!=null)
	{
		rs_ldhtjl_ldhtqx=cf.GB2Uni(rs_ldhtjl_ldhtqx);
		if (!(rs_ldhtjl_ldhtqx.equals("")))	wheresql+=" and  (rs_ldhtjl.ldhtqx='"+rs_ldhtjl_ldhtqx+"')";
	}
	rs_ldhtjl_htksrq=request.getParameter("rs_ldhtjl_htksrq");
	if (rs_ldhtjl_htksrq!=null)
	{
		rs_ldhtjl_htksrq=rs_ldhtjl_htksrq.trim();
		if (!(rs_ldhtjl_htksrq.equals("")))	wheresql+="  and (rs_ldhtjl.htksrq>=TO_DATE('"+rs_ldhtjl_htksrq+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_htksrq=request.getParameter("rs_ldhtjl_htksrq2");
	if (rs_ldhtjl_htksrq!=null)
	{
		rs_ldhtjl_htksrq=rs_ldhtjl_htksrq.trim();
		if (!(rs_ldhtjl_htksrq.equals("")))	wheresql+="  and (rs_ldhtjl.htksrq<=TO_DATE('"+rs_ldhtjl_htksrq+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_htdqrq=request.getParameter("rs_ldhtjl_htdqrq");
	if (rs_ldhtjl_htdqrq!=null)
	{
		rs_ldhtjl_htdqrq=rs_ldhtjl_htdqrq.trim();
		if (!(rs_ldhtjl_htdqrq.equals("")))	wheresql+="  and (rs_ldhtjl.htdqrq>=TO_DATE('"+rs_ldhtjl_htdqrq+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_htdqrq=request.getParameter("rs_ldhtjl_htdqrq2");
	if (rs_ldhtjl_htdqrq!=null)
	{
		rs_ldhtjl_htdqrq=rs_ldhtjl_htdqrq.trim();
		if (!(rs_ldhtjl_htdqrq.equals("")))	wheresql+="  and (rs_ldhtjl.htdqrq<=TO_DATE('"+rs_ldhtjl_htdqrq+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_lrr=request.getParameter("rs_ldhtjl_lrr");
	if (rs_ldhtjl_lrr!=null)
	{
		rs_ldhtjl_lrr=cf.GB2Uni(rs_ldhtjl_lrr);
		if (!(rs_ldhtjl_lrr.equals("")))	wheresql+=" and  (rs_ldhtjl.lrr='"+rs_ldhtjl_lrr+"')";
	}
	rs_ldhtjl_lrsj=request.getParameter("rs_ldhtjl_lrsj");
	if (rs_ldhtjl_lrsj!=null)
	{
		rs_ldhtjl_lrsj=rs_ldhtjl_lrsj.trim();
		if (!(rs_ldhtjl_lrsj.equals("")))	wheresql+="  and (rs_ldhtjl.lrsj>=TO_DATE('"+rs_ldhtjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_lrsj=request.getParameter("rs_ldhtjl_lrsj2");
	if (rs_ldhtjl_lrsj!=null)
	{
		rs_ldhtjl_lrsj=rs_ldhtjl_lrsj.trim();
		if (!(rs_ldhtjl_lrsj.equals("")))	wheresql+="  and (rs_ldhtjl.lrsj<=TO_DATE('"+rs_ldhtjl_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ldhtjl_lrbm=request.getParameter("rs_ldhtjl_lrbm");
	if (rs_ldhtjl_lrbm!=null)
	{
		rs_ldhtjl_lrbm=cf.GB2Uni(rs_ldhtjl_lrbm);
		if (!(rs_ldhtjl_lrbm.equals("")))	wheresql+=" and  (rs_ldhtjl.lrbm='"+rs_ldhtjl_lrbm+"')";
	}
	ls_sql="SELECT rs_ldhtjl.ldhtbh,rs_ldhtjl.ldhtlx,rs_ldhtjl.ldhtqx,rs_ldhtjl.htksrq,rs_ldhtjl.htdqrq,rs_ldhtjl.ygbh,rs_ldhtjl.yhmc,rs_ldhtjl.bianhao,rs_ldhtjl.sfzh,rs_ldhtjl.xzzwbm,a.dwmc ssbm,b.dwmc ssfgs,rs_ldhtjl.rzsj,rs_ldhtjl.lrr,rs_ldhtjl.lrsj,c.dwmc lrbm,rs_ldhtjl.bz  ";
	ls_sql+=" FROM rs_ldhtjl,sq_dwxx a,sq_dwxx b,sq_dwxx c  ";
    ls_sql+=" where rs_ldhtjl.dwbh=a.dwbh(+) and rs_ldhtjl.ssfgs=b.dwbh(+) and rs_ldhtjl.dwbh=c.dwbh(+) and rs_ldhtjl.lx='2'";
    ls_sql+=wheresql;
	ls_sql+=" order by  rs_ldhtjl.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ldhtjlList.jsp","SelectRs_ldhtjl.jsp","","EditRs_ldhtjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ldhtbh","rs_ldhtjl_ygbh","rs_ldhtjl_yhmc","rs_ldhtjl_bianhao","rs_ldhtjl_sfzh","rs_ldhtjl_xzzwbm","sq_dwxx_dwmc","ssfgs","rs_ldhtjl_rzsj","rs_ldhtjl_ldhtlx","rs_ldhtjl_ldhtqx","rs_ldhtjl_htksrq","rs_ldhtjl_htdqrq","rs_ldhtjl_lrr","rs_ldhtjl_lrsj","rs_ldhtjl_lrbm","rs_ldhtjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ldhtbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteRs_ldhtjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yhmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">续签合同－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">合同编号</td>
	<td  width="6%">劳动合同类型</td>
	<td  width="5%">劳动合同期限</td>
	<td  width="5%">合同开始日期</td>
	<td  width="5%">合同到期日期</td>
	<td  width="4%">员工序号</td>
	<td  width="4%">员工名称</td>
	<td  width="4%">员工编号</td>
	<td  width="7%">身份证号</td>
	<td  width="5%">行政职务</td>
	<td  width="7%">所属部门</td>
	<td  width="6%">所属分公司</td>
	<td  width="5%">入职日期</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="12%">备注</td>
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