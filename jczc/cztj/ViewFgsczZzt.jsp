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

	
	String wheresql=request.getParameter("wheresql");
	String wheresql1=request.getParameter("wheresql1");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String jzbz=request.getParameter("jzbz");


	String ls_sql =null;
	ls_sql=" SELECT dwmc,sum(qye) qye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N����Y����
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=" and a.sfjms='N'";//N����Y����
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);

	jpgFileName =yblc.bar(ls_sql,"��Ӫ�ֹ�˾��ֵռ��","","ǩԼ��",2000,400,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >


<P>
<%

	ls_sql=" SELECT dwmc,sum(qye) qye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and sq_dwxx.sfjms='Y'";//N����Y����
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=" and a.sfjms='Y'";//N����Y����
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);

	jpgFileName =yblc.bar(ls_sql,"�����̲�ֵռ��","","ǩԼ��",1000,400,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >

<P>
<%
	ls_sql=" SELECT dwmc,sum(qye) qye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);

	jpgFileName =yblc.bar(ls_sql,"ȫ��(��Ӫ������)��ֵռ��","","ǩԼ��",2000,400,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >




</body>
</html>