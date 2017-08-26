<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObject=new ybl.common.PageObject();
String yhjs=(String)session.getAttribute("yhjs");
String xsrq=null;
String xsrq2=null;
//马学中2003.9.24修改cp_cpxx为cp_cpxx1,原因：销售的产品信息在cp_cpxx1中
String ls_sql=null;
String wheresql=" WHERE cp_cpxx1.plbm=xt_plbm.plbm ";
  wheresql+=" and cp_cpxx1.bsjbbm=xt_cpbsjbbm.bsjbbm(+) and cp_cpxx1.wlzt='05' and cp_cpxx1.bkbh=v_bk.bkbh(+)";


	String bkbh=null;
	String zqh=null;
	String cplb=null;
	String hplx=null;
	String pmbm=null;
	String jldm=null;
	String zzl=null;
	String jlzl=null;
	String zszl=null;
	String pszl=null;
	String zsh=null;
	String szdw=null;
	String lsj=null;
	String bqj=null;
	String wlzt=null;
	String ls="";
	String bkflbm=null;
	String plbm=null;
	String gckh=null;
	String rkrq=null;
	String yrkrq=null;
	String sxj=null;
	String rkph=null;
    String gkbz=null;
	String dwbh=null;
		dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+="  and (cp_cpxx1.dwbh='"+dwbh+"')";
	}
	gkbz=request.getParameter("gkbz");
	if (gkbz!=null)
	{
		gkbz=cf.GB2Uni(gkbz);
		if (!(gkbz.equals("")))	wheresql+="  and (cp_cpxx1.gkbz='"+gkbz+"')";
	}
	xsrq=request.getParameter("xsrq");
	if (xsrq!=null)
	{
		xsrq=xsrq.trim();
		if (!(xsrq.equals("")))	wheresql+="  and xsrq>=TO_DATE('"+xsrq+"','YYYY-MM-DD')";
	}
	xsrq2=request.getParameter("xsrq2");
	if (xsrq2!=null)
	{
		xsrq2=xsrq2.trim();
		if (!(xsrq2.equals("")))	wheresql+="  and xsrq<=TO_DATE('"+xsrq2+"','YYYY-MM-DD')";
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

	yrkrq=request.getParameter("yrkrq");
	if (yrkrq!=null)
	{
		if (!(yrkrq.equals("")))	wheresql+="  and cp_cpxx1.yrkrq>=TO_DATE('"+yrkrq+"','YYYY-MM-DD')";
	}
	yrkrq=request.getParameter("yrkrq2");
	if (yrkrq!=null)
	{
		if (!(yrkrq.equals("")))	wheresql+="  and cp_cpxx1.yrkrq<=TO_DATE('"+yrkrq+"','YYYY-MM-DD')";
	}
	rkrq=request.getParameter("rkrq");
	if (rkrq!=null)
	{
		if (!(rkrq.equals("")))	wheresql+="  and cp_cpxx1.rkrq>=TO_DATE('"+rkrq+"','YYYY-MM-DD')";
	}
	rkrq=request.getParameter("rkrq2");
	if (rkrq!=null)
	{
		if (!(rkrq.equals("")))	wheresql+="  and cp_cpxx1.rkrq<=TO_DATE('"+rkrq+"','YYYY-MM-DD')";
	}

	rkph=request.getParameter("rkph");
	if (rkph!=null)
	{
		if (!(rkph.equals("")))	wheresql+="  and (cp_cpxx1.rkph='"+rkph+"' )";
	}
	gckh=request.getParameter("gckh");
	if (gckh!=null)
	{
		if (!(gckh.equals("")))	wheresql+="  and (cp_cpxx1.gckh='"+gckh+"' )";
	}
	bkflbm=request.getParameter("bkflbm");
	if (bkflbm!=null)
	{
		if (!(bkflbm.equals("")))	wheresql+="  and (v_bk.bkflbm='"+bkflbm+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		if (!(plbm.equals("")))	wheresql+="  and (cp_cpxx1.plbm='"+plbm+"')";
	}

	wlzt=request.getParameter("wlzt");
	if (wlzt!=null)
	{
		wlzt=cf.GB2Uni(wlzt);
		if (!(wlzt.equals("")))	wheresql+="  and (cp_cpxx1.wlzt='"+wlzt+"')";
	}
	bkbh=request.getParameter("bkbh");
	if (bkbh!=null)
	{
		bkbh=cf.GB2Uni(bkbh);
		if (!(bkbh.equals("")))	wheresql+="  and (cp_cpxx1.bkbh='"+bkbh+"')";
	}
	zqh=request.getParameter("zqh");
	if (zqh!=null)
	{
		zqh=cf.GB2Uni(zqh);
		if (!(zqh.equals("")))	wheresql+=" and  (zqh>='"+zqh+"')";
	}
	zqh=request.getParameter("zqh2");
	if (zqh!=null)
	{
		zqh=cf.GB2Uni(zqh);
		if (!(zqh.equals("")))	wheresql+=" and  (zqh<='"+zqh+"')";
	}
	cplb=request.getParameter("cplb");
	if (cplb!=null)
	{
		cplb=cf.GB2Uni(cplb);
		if (!(cplb.equals("")))	wheresql+="  and (cp_cpxx1.cplb='"+cplb+"')";
	}
	hplx=request.getParameter("hplx");
	if (hplx!=null)
	{
		hplx=cf.GB2Uni(hplx);
		if (!(hplx.equals("")))	wheresql+="  and (cp_cpxx1.hplx='"+hplx+"')";
	}
	pmbm=request.getParameter("pmbm");
	if (pmbm!=null)
	{
		pmbm=cf.GB2Uni(pmbm);
		if (!(pmbm.equals("")))	wheresql+="  and (cp_cpxx1.pmbm='"+pmbm+"')";
	}
	jldm=request.getParameter("jldm");
	if (jldm!=null)
	{
		jldm=cf.GB2Uni(jldm);
		if (!(jldm.equals("")))	wheresql+="  and (cp_cpxx1.jldm='"+jldm+"')";
	}
	zzl=request.getParameter("zzl");
	if (zzl!=null)
	{
		zzl=zzl.trim();
		if (!(zzl.equals("")))	wheresql+=" and  (zzl>="+zzl+") ";
	}
	zzl=request.getParameter("zzl2");
	if (zzl!=null)
	{
		zzl=zzl.trim();
		if (!(zzl.equals("")))	wheresql+=" and  (zzl<="+zzl+") ";
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
	zsh=request.getParameter("zsh");
	if (zsh!=null)
	{
		zsh=cf.GB2Uni(zsh);
		if (!(zsh.equals("")))	wheresql+="  and (zsh='"+zsh+"')";
	}
	szdw=request.getParameter("szdw");
	if (szdw!=null)
	{
		szdw=cf.GB2Uni(szdw);
		if (!(szdw.equals("")))	wheresql+="  and (cp_cpxx1.szdw='"+szdw+"')";
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

	ls_sql="SELECT cpbm,cp_cpxx1.bkbh,gckh,plmc,jlzl,zsgg,psgg,bqj,sxj,xsrq,rkrq,yrkrq,TO_CHAR(zqh),bsjbmc";
	ls_sql+=" FROM cp_cpxx1,xt_plbm,xt_cpbsjbbm,v_bk  ";
    ls_sql+=wheresql;
    ls_sql+=" order by xsrq";
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
		ls_sql+=" where dwbh='"+szdw+"'";
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
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%" >产品编码</td>
	<td  width="7%" >版库编号</td>
	<td  width="5%" >工厂款号</td>
	<td  width="12%" >品名</td>
	<td  width="5%" >金重</td>
	<td  width="5%" >主石</td>
	<td  width="5%" >配石</td>
	<td  width="5%" >标签价</td>
	<td  width="5%" >实销价</td>
	<td  width="9%" >销售日期</td>
	<td  width="9%" >入库日期</td>
	<td  width="9%" >生产日期</td>
	<td  width="5%" >子圈号</td>
	<td  width="7%" >宝石级别</td>
</tr>
<%
	pageObject.printDateSum();
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