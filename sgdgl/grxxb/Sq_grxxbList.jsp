<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_grxxb_sgd=null;
	String sq_grxxb_bzmc=null;
	String sq_grxxb_xm=null;
	String sq_grxxb_xb=null;
	String sq_grxxb_jg=null;
	String sq_grxxb_csrq=null;
	String sq_grxxb_gz=null;
	String sq_grxxb_rzsj=null;
	String sq_grxxb_dj=null;
	String sq_grxxb_lx=null;
	String sq_grxxb_sfzh=null;
	String sq_grxxb_zz=null;
	String sq_grxxb_dh=null;

	String lzsj=null;
	lzsj=request.getParameter("lzsj");
	if (lzsj!=null)
	{
		lzsj=lzsj.trim();
		if (!(lzsj.equals("")))	wheresql+="  and (sq_grxxb.lzsj>=TO_DATE('"+lzsj+"','YYYY/MM/DD'))";
	}
	lzsj=request.getParameter("lzsj2");
	if (lzsj!=null)
	{
		lzsj=lzsj.trim();
		if (!(lzsj.equals("")))	wheresql+="  and (sq_grxxb.lzsj<=TO_DATE('"+lzsj+"','YYYY/MM/DD'))";
	}

	String sgzbh=null;
	sgzbh=request.getParameter("sgzbh");
	if (sgzbh!=null)
	{
		sgzbh=cf.GB2Uni(sgzbh);
		if (!(sgzbh.equals("")))	wheresql+=" and  (sq_grxxb.sgzbh like '%"+sgzbh+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_grxxb.ssfgs='"+fgs+"')";

	sq_grxxb_sgd=request.getParameter("sq_grxxb_sgd");
	if (sq_grxxb_sgd!=null)
	{
		sq_grxxb_sgd=cf.GB2Uni(sq_grxxb_sgd);
		if (!(sq_grxxb_sgd.equals("")))	wheresql+=" and  (sq_grxxb.sgd='"+sq_grxxb_sgd+"')";
	}
	sq_grxxb_bzmc=request.getParameter("sq_grxxb_bzmc");
	if (sq_grxxb_bzmc!=null)
	{
		sq_grxxb_bzmc=cf.GB2Uni(sq_grxxb_bzmc);
		if (!(sq_grxxb_bzmc.equals("")))	wheresql+=" and  (sq_grxxb.bzmc='"+sq_grxxb_bzmc+"')";
	}

	sq_grxxb_xm=request.getParameter("sq_grxxb_xm");
	if (sq_grxxb_xm!=null)
	{
		sq_grxxb_xm=cf.GB2Uni(sq_grxxb_xm);
		if (!(sq_grxxb_xm.equals("")))	wheresql+=" and  (sq_grxxb.xm='"+sq_grxxb_xm+"')";
	}
	sq_grxxb_xb=request.getParameter("sq_grxxb_xb");
	if (sq_grxxb_xb!=null)
	{
		sq_grxxb_xb=cf.GB2Uni(sq_grxxb_xb);
		if (!(sq_grxxb_xb.equals("")))	wheresql+=" and  (sq_grxxb.xb='"+sq_grxxb_xb+"')";
	}
	sq_grxxb_jg=request.getParameter("sq_grxxb_jg");
	if (sq_grxxb_jg!=null)
	{
		sq_grxxb_jg=cf.GB2Uni(sq_grxxb_jg);
		if (!(sq_grxxb_jg.equals("")))	wheresql+=" and  (sq_grxxb.jg='"+sq_grxxb_jg+"')";
	}
	sq_grxxb_csrq=request.getParameter("sq_grxxb_csrq");
	if (sq_grxxb_csrq!=null)
	{
		sq_grxxb_csrq=sq_grxxb_csrq.trim();
		if (!(sq_grxxb_csrq.equals("")))	wheresql+="  and (sq_grxxb.csrq>=TO_DATE('"+sq_grxxb_csrq+"','YYYY/MM/DD'))";
	}
	sq_grxxb_csrq=request.getParameter("sq_grxxb_csrq2");
	if (sq_grxxb_csrq!=null)
	{
		sq_grxxb_csrq=sq_grxxb_csrq.trim();
		if (!(sq_grxxb_csrq.equals("")))	wheresql+="  and (sq_grxxb.csrq<=TO_DATE('"+sq_grxxb_csrq+"','YYYY/MM/DD'))";
	}
	sq_grxxb_gz=request.getParameter("sq_grxxb_gz");
	if (sq_grxxb_gz!=null)
	{
		sq_grxxb_gz=cf.GB2Uni(sq_grxxb_gz);
		if (!(sq_grxxb_gz.equals("")))	wheresql+=" and  (sq_grxxb.gz='"+sq_grxxb_gz+"')";
	}
	sq_grxxb_rzsj=request.getParameter("sq_grxxb_rzsj");
	if (sq_grxxb_rzsj!=null)
	{
		sq_grxxb_rzsj=sq_grxxb_rzsj.trim();
		if (!(sq_grxxb_rzsj.equals("")))	wheresql+="  and (sq_grxxb.rzsj>=TO_DATE('"+sq_grxxb_rzsj+"','YYYY/MM/DD'))";
	}
	sq_grxxb_rzsj=request.getParameter("sq_grxxb_rzsj2");
	if (sq_grxxb_rzsj!=null)
	{
		sq_grxxb_rzsj=sq_grxxb_rzsj.trim();
		if (!(sq_grxxb_rzsj.equals("")))	wheresql+="  and (sq_grxxb.rzsj<=TO_DATE('"+sq_grxxb_rzsj+"','YYYY/MM/DD'))";
	}
	sq_grxxb_dj=request.getParameter("sq_grxxb_dj");
	if (sq_grxxb_dj!=null)
	{
		sq_grxxb_dj=cf.GB2Uni(sq_grxxb_dj);
		if (!(sq_grxxb_dj.equals("")))	wheresql+=" and  (sq_grxxb.dj='"+sq_grxxb_dj+"')";
	}
	sq_grxxb_lx=request.getParameter("sq_grxxb_lx");
	if (sq_grxxb_lx!=null)
	{
		sq_grxxb_lx=cf.GB2Uni(sq_grxxb_lx);
		if (!(sq_grxxb_lx.equals("")))	wheresql+=" and  (sq_grxxb.lx='"+sq_grxxb_lx+"')";
	}
	sq_grxxb_sfzh=request.getParameter("sq_grxxb_sfzh");
	if (sq_grxxb_sfzh!=null)
	{
		sq_grxxb_sfzh=cf.GB2Uni(sq_grxxb_sfzh);
		if (!(sq_grxxb_sfzh.equals("")))	wheresql+=" and  (sq_grxxb.sfzh='"+sq_grxxb_sfzh+"')";
	}
	sq_grxxb_zz=request.getParameter("sq_grxxb_zz");
	if (sq_grxxb_zz!=null)
	{
		sq_grxxb_zz=cf.GB2Uni(sq_grxxb_zz);
		if (!(sq_grxxb_zz.equals("")))	wheresql+=" and  (sq_grxxb.zz='"+sq_grxxb_zz+"')";
	}
	sq_grxxb_dh=request.getParameter("sq_grxxb_dh");
	if (sq_grxxb_dh!=null)
	{
		sq_grxxb_dh=cf.GB2Uni(sq_grxxb_dh);
		if (!(sq_grxxb_dh.equals("")))	wheresql+=" and  (sq_grxxb.dh='"+sq_grxxb_dh+"')";
	}
	ls_sql="SELECT dwmc,sq_grxxb.ssfgs,sq_sgd.sgdmc,sq_grxxb.bzmc,sq_grxxb.lx,sq_grxxb.xm,sq_grxxb.dj,sq_grxxb.xb,sq_grxxb.jg,sq_grxxb.csrq,sq_grxxb.gz,sq_grxxb.rzsj,sq_grxxb.lzsj,sq_grxxb.sgzbh,sq_grxxb.sfzh,sq_grxxb.yhk,sq_grxxb.zz,sq_grxxb.dh,sq_grxxb.jjlxr,sq_grxxb.jjlxrdh,sq_grxxb.jjlxrdz,sq_grxxb.pxsm  ";
	ls_sql+=" FROM sq_grxxb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where sq_grxxb.sgd=sq_sgd.sgd(+) and sq_grxxb.ssfgs=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_grxxb.ssfgs,sq_grxxb.sgd,sq_grxxb.bzmc,sq_grxxb.xm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_grxxbList.jsp","","","EditSq_grxxb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sgd","sq_sgd_sgdmc","bzmc","xm","sq_grxxb_xb","sq_grxxb_jg","sq_grxxb_csrq","sq_grxxb_gz","sq_grxxb_rzsj","sq_grxxb_dj","sq_grxxb_lx","sq_grxxb_sfzh","sq_grxxb_zz","sq_grxxb_dh","sq_grxxb_pxsm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ssfgs","xm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","批量离职"};//按钮的显示名称
	String[] buttonLink={"DeleteSq_grxxb.jsp","pllz.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("ssfgs","1");//列参数对象加入Hash表
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
	<td  width="5%">分公司</td>
	<td  width="3%">分公司</td>
	<td  width="3%">施工队</td>
	<td  width="3%">班长</td>
	<td  width="3%">类型</td>
	<td  width="3%">姓名</td>
	<td  width="4%">等级</td>
	<td  width="2%">性别</td>
	<td  width="8%">籍贯</td>
	<td  width="4%">出生日期</td>
	<td  width="3%">工种</td>
	<td  width="4%">入职时间</td>
	<td  width="4%">离职时间</td>
	<td  width="5%">上岗证编号</td>
	<td  width="6%">身份证号</td>
	<td  width="6%">银行卡</td>
	<td  width="6%">住址</td>
	<td  width="6%">电话</td>
	<td  width="2%">紧急联系人</td>
	<td  width="5%">联系人电话</td>
	<td  width="5%">紧急联系人地址</td>
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