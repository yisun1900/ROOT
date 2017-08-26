<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%//saw
String yhjs=(String)session.getAttribute("yhjs");

ybl.common.PageObject pageObject=new ybl.common.PageObject();
String ls_sql=null;
String wheresql=" WHERE (dm_xsjl.dwbh=sq_dwxx.dwbh and dm_xsjl.plbm=xt_plbm.plbm) ";
String xsrq=null;
String xsrq2=null;
String dwbh=null;

	String ywxh=null;
	String cpbm=null;
	String zkl=null;
	String sjzkl=null;
	String khlx=null;
	String khbh=null;
	String jyfs=null;
	String czy=null;
	String zkcx=null;
	String shbz=null;
	String shr=null;
	String shrq=null;
	String sfjs=null;

	String bkbh=null;
	String plbm=null;
	String pmbm=null;
	String cplb=null;
	String jlzl=null;
	String zszl=null;
	String pszl=null;
	String lsj=null;
	String bqj=null;
	String sxj=null;
	String jwbm=null;
	String xsbddbh=null;
	jwbm=request.getParameter("jwbm");
	if (jwbm!=null)
	{
		if (!(jwbm.equals("")))	wheresql+="  and (dm_xsjl.jwbm='"+jwbm+"')";
	}
	xsbddbh=request.getParameter("xsbddbh");
	if (xsbddbh!=null)
	{
		if (!(xsbddbh.equals("")))	wheresql+="  and (dm_xsjl.xsbddbh='"+xsbddbh+"')";
	}

	bkbh=request.getParameter("bkbh");
	if (bkbh!=null)
	{
		bkbh=cf.GB2Uni(bkbh);
		if (!(bkbh.equals("")))	wheresql+="  and (bkbh='"+bkbh+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		plbm=cf.GB2Uni(plbm);
		if (!(plbm.equals("")))	wheresql+="  and (plbm='"+plbm+"')";
	}
	pmbm=request.getParameter("pmbm");
	if (pmbm!=null)
	{
		pmbm=cf.GB2Uni(pmbm);
		if (!(pmbm.equals("")))	wheresql+="  and (pmbm='"+pmbm+"')";
	}
	cplb=request.getParameter("cplb");
	if (cplb!=null)
	{
		cplb=cf.GB2Uni(cplb);
		if (!(cplb.equals("")))	wheresql+="  and (cplb='"+cplb+"')";
	}

	jlzl=request.getParameter("jlzl");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl>="+jlzl+") ";
	}
	jlzl=request.getParameter("jlzl2");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl<="+jlzl+") ";
	}
	zszl=request.getParameter("zszl");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl>="+zszl+") ";
	}
	zszl=request.getParameter("zszl2");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl<="+zszl+") ";
	}
	pszl=request.getParameter("pszl");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl>="+pszl+") ";
	}
	pszl=request.getParameter("pszl2");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl<="+pszl+") ";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj<="+lsj+") ";
	}
	bqj=request.getParameter("bqj");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj>="+bqj+") ";
	}
	bqj=request.getParameter("bqj2");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj<="+bqj+") ";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj>="+sxj+") ";
	}
	sxj=request.getParameter("sxj2");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj<="+sxj+") ";
	}


	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+="  and (dm_xsjl.dwbh='"+dwbh+"')";
	}
	ywxh=request.getParameter("ywxh");
	if (ywxh!=null)
	{
		ywxh=cf.GB2Uni(ywxh);
		if (!(ywxh.equals("")))	wheresql+="  and (dm_xsjl.ywxh='"+ywxh+"')";
	}
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+="  and (dm_xsjl.cpbm='"+cpbm+"')";
	}
	zkl=request.getParameter("zkl");
	if (zkl!=null)
	{
		zkl=zkl.trim();
		if (!(zkl.equals("")))	wheresql+=" and  (zkl="+zkl+") ";
	}
	sjzkl=request.getParameter("sjzkl");
	if (sjzkl!=null)
	{
		sjzkl=sjzkl.trim();
		if (!(sjzkl.equals("")))	wheresql+=" and  (dm_xsjl.sjzkl="+sjzkl+") ";
	}
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		khlx=cf.GB2Uni(khlx);
		if (!(khlx.equals("")))	wheresql+="  and (dm_xsjl.khlx='"+khlx+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (dm_xsjl.khbh='"+khbh+"')";
	}
	jyfs=request.getParameter("jyfs");
	if (jyfs!=null)
	{
		jyfs=cf.GB2Uni(jyfs);
		if (!(jyfs.equals("")))	wheresql+="  and (dm_xsjl.jyfs='"+jyfs+"')";
	}
	czy=request.getParameter("czy");
	if (czy!=null)
	{
		czy=cf.GB2Uni(czy);
		if (!(czy.equals("")))	wheresql+="  and (czy='"+czy+"')";
	}
	xsrq=request.getParameter("xsrq");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and dm_xsjl.xsrq>=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
	xsrq2=request.getParameter("xsrq2");
	if (xsrq2!=null)
	{
		xsrq2=xsrq2.trim();
		if (!(xsrq2.equals("")))	wheresql+="  and dm_xsjl.xsrq<=TO_DATE('"+xsrq2+"','YYYY-MM-DD')";
	}
	zkcx=request.getParameter("zkcx");
	if (zkcx!=null)
	{
		zkcx=cf.GB2Uni(zkcx);
		if (!(zkcx.equals("")))	wheresql+="  and (dm_xsjl.zkcx='"+zkcx+"')";
	}
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+="  and (shbz='"+shbz+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+="  and (shr='"+shr+"')";
	}
	shrq=request.getParameter("shrq");
	if (shrq!=null)
	{
		shrq=shrq.trim();
		if (!(shrq.equals("")))	wheresql+="  and dm_xsjl.shrq=TO_DATE('"+shrq+"','YYYY/MM/DD')";
	}
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=sfjs.trim();
		if (!(sfjs.equals("")))	wheresql+=" and (sfjs="+sfjs+") ";
	}
	
	ls_sql="SELECT '',dm_xsjl.ywxh ywxh,dm_xsjl.cpbm cpbm,DECODE(cplb,'B','素金','A','镶嵌'),bkbh,plmc,dwmc,dm_xsjl.bqj,dm_xsjl.sxj,TO_CHAR(dm_xsjl.sjzkl),DECODE(sfjs,0,'否',1,'是'),dm_xsjl.khbh  ";
	ls_sql+=" FROM dm_xsjl,sq_dwxx,xt_plbm ";
    ls_sql+=wheresql;
	ls_sql+=" order by dm_xsjl.dwbh,ywxh";
//	out.println(ls_sql);
    pageObject.sql=ls_sql;
//进行对象初始化
	pageObject.initPage("","","","");
	pageObject.setPageRow(20000);

%>
<%
	String dwmc=null;

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	try {
		conn=cf.getConnection();    //得到连接
		
		ls_sql="select dwmc from sq_dwxx ";
		ls_sql+=" where dwbh='"+dwbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwmc=rs.getString(1);
		}

		rs.close();
		ps.close();
	}
	catch (Exception e) {
		try{
			out.println("getDate.Exception: " + e);
			out.println("sql=" + ls_sql);
		}
		catch (Exception e1){}
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn);    //释放连接
		}
		catch (Exception e){}
	}

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2"><%=dwmc%>销售明细</font></B>
  <BR>（<%=xsrq%>--<%=xsrq2%>）
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(1);
	pageObject.printPageLink(100,false);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%" height="2">序号</td>
	<td  width="10%" height="2">业务序号</td>
	<td  width="12%" height="2">产品编码</td>
	<td  width="5%" height="2">类别</td>
	<td  width="8%" height="2">版库编号</td>
	<td  width="17%" height="2">品名</td>
	<td  width="20%" height="2">销售单位</td>
	<td  width="7%" height="2">标签价</td>
	<td  width="8%" height="2">实销价</td>
	<td  width="6%" height="2">折扣率</td>
	<td  width="5%" height="2">结算</td>
	<td  width="10%" height="2">水质分析卡号</td>
</tr>
<%
	pageObject.printDate(true);
	pageObject.printCount();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>