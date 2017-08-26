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
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


	ls_sql=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.dwbh=sq_dwxx.dwbh";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=" and cw_qmjzmx.zt in('2')";
	ls_sql+=wheresql;
	ls_sql+=" group by sq_dwxx.dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);

	jpgFileName =yblc.bar(ls_sql,"（"+dwmc+"）店面产值对比","","签约额",2000,400,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >





</body>
</html>