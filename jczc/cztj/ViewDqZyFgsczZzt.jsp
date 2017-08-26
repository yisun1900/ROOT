<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	ybl.common.YBLChart  yblc=new ybl.common.YBLChart();
	String jpgFileName =null;

	
	String ls_sql=null;
	String wheresql="";
	String ssdqbm=request.getParameter("ssdqbm");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

	String ssdqmc=cf.executeQuery("select ssdqmc from sq_ssdqbm where ssdqbm='"+ssdqbm+"'");

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


	ls_sql=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
	ls_sql+=" and sq_dwxx.ssdqbm='"+ssdqbm+"'";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);

	jpgFileName =yblc.bar(ls_sql,"（"+ssdqmc+"）大区分公司产值占比（自营）","","签约额",950,400,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >





</body>
</html>