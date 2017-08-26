<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj= new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String cksj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (sq_ckdhrz.ip='"+ip+"')";
	}

	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_ckdhrz.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	cksj=request.getParameter("cksj");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (sq_ckdhrz.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}
	cksj=request.getParameter("cksj2");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (sq_ckdhrz.cksj<=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}


	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (sq_ckdhrz.khbh='"+khbh+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT a.dwmc,b.dwmc bm,zwmc,sq_ckdhrz.yhdlm,sq_yhxx.yhmc ,count(*) cc";
	ls_sql+=" FROM sq_yhxx,sq_ckdhrz,sq_dwxx a,sq_dwxx b ,dm_zwbm ";
    ls_sql+=" where sq_ckdhrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.ssfgs=a.dwbh(+) and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
    ls_sql+=wheresql;
	ls_sql+=" group by sq_ckdhrz.yhdlm,sq_yhxx.yhmc,a.dwmc,b.dwmc,zwmc";
	ls_sql+=" order by cc desc";
    
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(3000);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="14%">分公司</td>
	<td  width="14%">部门</td>
	<td  width="14%">职务</td>
	<td  width="14%">用户登陆名</td>
	<td  width="10%">用户名称</td>
	<td  width="14%">查看次数</td>
	
	
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>