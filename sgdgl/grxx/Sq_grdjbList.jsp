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
	String sq_grdjb_sgd=null;
	String sq_grdjb_bzmc=null;
	String sq_grdjb_xm=null;
	String sq_grdjb_xb=null;
	String sq_grdjb_jg=null;
	String sq_grdjb_csrq=null;
	String sq_grdjb_gz=null;
	String sq_grdjb_rzsj=null;
	String sq_grdjb_dj=null;
	String sq_grdjb_lx=null;
	String sq_grdjb_sfzh=null;
	String sq_grdjb_zz=null;
	String sq_grdjb_dh=null;

	String sgzbh=null;
	sgzbh=request.getParameter("sgzbh");
	if (sgzbh!=null)
	{
		sgzbh=cf.GB2Uni(sgzbh);
		if (!(sgzbh.equals("")))	wheresql+=" and  (sq_grdjb.sgzbh like '%"+sgzbh+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+fgs+"')";

	sq_grdjb_sgd=request.getParameter("sq_grdjb_sgd");
	if (sq_grdjb_sgd!=null)
	{
		sq_grdjb_sgd=cf.GB2Uni(sq_grdjb_sgd);
		if (!(sq_grdjb_sgd.equals("")))	wheresql+=" and  (sq_grdjb.sgd='"+sq_grdjb_sgd+"')";
	}
	sq_grdjb_bzmc=request.getParameter("sq_grdjb_bzmc");
	if (sq_grdjb_bzmc!=null)
	{
		sq_grdjb_bzmc=cf.GB2Uni(sq_grdjb_bzmc);
		if (!(sq_grdjb_bzmc.equals("")))	wheresql+=" and  (sq_grdjb.bzmc='"+sq_grdjb_bzmc+"')";
	}

	sq_grdjb_xm=request.getParameter("sq_grdjb_xm");
	if (sq_grdjb_xm!=null)
	{
		sq_grdjb_xm=cf.GB2Uni(sq_grdjb_xm);
		if (!(sq_grdjb_xm.equals("")))	wheresql+=" and  (sq_grdjb.xm='"+sq_grdjb_xm+"')";
	}
	sq_grdjb_xb=request.getParameter("sq_grdjb_xb");
	if (sq_grdjb_xb!=null)
	{
		sq_grdjb_xb=cf.GB2Uni(sq_grdjb_xb);
		if (!(sq_grdjb_xb.equals("")))	wheresql+=" and  (sq_grdjb.xb='"+sq_grdjb_xb+"')";
	}
	sq_grdjb_jg=request.getParameter("sq_grdjb_jg");
	if (sq_grdjb_jg!=null)
	{
		sq_grdjb_jg=cf.GB2Uni(sq_grdjb_jg);
		if (!(sq_grdjb_jg.equals("")))	wheresql+=" and  (sq_grdjb.jg='"+sq_grdjb_jg+"')";
	}
	sq_grdjb_csrq=request.getParameter("sq_grdjb_csrq");
	if (sq_grdjb_csrq!=null)
	{
		sq_grdjb_csrq=sq_grdjb_csrq.trim();
		if (!(sq_grdjb_csrq.equals("")))	wheresql+="  and (sq_grdjb.csrq>=TO_DATE('"+sq_grdjb_csrq+"','YYYY/MM/DD'))";
	}
	sq_grdjb_csrq=request.getParameter("sq_grdjb_csrq2");
	if (sq_grdjb_csrq!=null)
	{
		sq_grdjb_csrq=sq_grdjb_csrq.trim();
		if (!(sq_grdjb_csrq.equals("")))	wheresql+="  and (sq_grdjb.csrq<=TO_DATE('"+sq_grdjb_csrq+"','YYYY/MM/DD'))";
	}
	sq_grdjb_gz=request.getParameter("sq_grdjb_gz");
	if (sq_grdjb_gz!=null)
	{
		sq_grdjb_gz=cf.GB2Uni(sq_grdjb_gz);
		if (!(sq_grdjb_gz.equals("")))	wheresql+=" and  (sq_grdjb.gz='"+sq_grdjb_gz+"')";
	}
	sq_grdjb_rzsj=request.getParameter("sq_grdjb_rzsj");
	if (sq_grdjb_rzsj!=null)
	{
		sq_grdjb_rzsj=sq_grdjb_rzsj.trim();
		if (!(sq_grdjb_rzsj.equals("")))	wheresql+="  and (sq_grdjb.rzsj>=TO_DATE('"+sq_grdjb_rzsj+"','YYYY/MM/DD'))";
	}
	sq_grdjb_rzsj=request.getParameter("sq_grdjb_rzsj2");
	if (sq_grdjb_rzsj!=null)
	{
		sq_grdjb_rzsj=sq_grdjb_rzsj.trim();
		if (!(sq_grdjb_rzsj.equals("")))	wheresql+="  and (sq_grdjb.rzsj<=TO_DATE('"+sq_grdjb_rzsj+"','YYYY/MM/DD'))";
	}
	sq_grdjb_dj=request.getParameter("sq_grdjb_dj");
	if (sq_grdjb_dj!=null)
	{
		sq_grdjb_dj=cf.GB2Uni(sq_grdjb_dj);
		if (!(sq_grdjb_dj.equals("")))	wheresql+=" and  (sq_grdjb.dj='"+sq_grdjb_dj+"')";
	}
	sq_grdjb_lx=request.getParameter("sq_grdjb_lx");
	if (sq_grdjb_lx!=null)
	{
		sq_grdjb_lx=cf.GB2Uni(sq_grdjb_lx);
		if (!(sq_grdjb_lx.equals("")))	wheresql+=" and  (sq_grdjb.lx='"+sq_grdjb_lx+"')";
	}
	sq_grdjb_sfzh=request.getParameter("sq_grdjb_sfzh");
	if (sq_grdjb_sfzh!=null)
	{
		sq_grdjb_sfzh=cf.GB2Uni(sq_grdjb_sfzh);
		if (!(sq_grdjb_sfzh.equals("")))	wheresql+=" and  (sq_grdjb.sfzh='"+sq_grdjb_sfzh+"')";
	}
	sq_grdjb_zz=request.getParameter("sq_grdjb_zz");
	if (sq_grdjb_zz!=null)
	{
		sq_grdjb_zz=cf.GB2Uni(sq_grdjb_zz);
		if (!(sq_grdjb_zz.equals("")))	wheresql+=" and  (sq_grdjb.zz='"+sq_grdjb_zz+"')";
	}
	sq_grdjb_dh=request.getParameter("sq_grdjb_dh");
	if (sq_grdjb_dh!=null)
	{
		sq_grdjb_dh=cf.GB2Uni(sq_grdjb_dh);
		if (!(sq_grdjb_dh.equals("")))	wheresql+=" and  (sq_grdjb.dh='"+sq_grdjb_dh+"')";
	}
	ls_sql="SELECT dwmc,sq_grdjb.sgd,sq_sgd.sgdmc,sq_grdjb.bzmc,sq_grdjb.xm,sq_grdjb.xb,sq_grdjb.jg,sq_grdjb.csrq,sq_grdjb.gz,sq_grdjb.rzsj,sq_grdjb.dj,sq_grdjb.lx,sq_grdjb.sgzbh,sq_grdjb.sfzh,sq_grdjb.zz,sq_grdjb.dh,sq_grdjb.jjlxr,sq_grdjb.jjlxrdh,sq_grdjb.jjlxrdz,sq_grdjb.pxsm  ";
	ls_sql+=" FROM sq_grdjb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where sq_grdjb.sgd=sq_sgd.sgd and sq_sgd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_sgd.ssfgs,sq_grdjb.sgd,sq_grdjb.bzmc,sq_grdjb.xm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_grdjbList.jsp","","","EditSq_grdjb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sgd","sq_sgd_sgdmc","bzmc","xm","sq_grdjb_xb","sq_grdjb_jg","sq_grdjb_csrq","sq_grdjb_gz","sq_grdjb_rzsj","sq_grdjb_dj","sq_grdjb_lx","sq_grdjb_sfzh","sq_grdjb_zz","sq_grdjb_dh","sq_grdjb_pxsm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sgd","bzmc","xm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSq_grdjb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("sgd","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("bzmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">维护工人</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">所属分公司</td>
	<td  width="3%">施工队</td>
	<td  width="3%">施工队</td>
	<td  width="3%">班长</td>
	<td  width="3%">姓名</td>
	<td  width="2%">性别</td>
	<td  width="5%">籍贯</td>
	<td  width="4%">出生日期</td>
	<td  width="3%">工种</td>
	<td  width="4%">入职时间</td>
	<td  width="4%">等级</td>
	<td  width="3%">类型</td>
	<td  width="5%">上岗证编号</td>
	<td  width="7%">身份证号</td>
	<td  width="8%">住址</td>
	<td  width="8%">电话</td>
	<td  width="3%">紧急联系人</td>
	<td  width="7%">联系人电话</td>
	<td  width="8%">紧急联系人地址</td>
	<td  width="9%">培训说明</td>
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