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
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and cw_qmjzmx.zt in('2')";
	ls_sql+=" and sq_dwxx.sfjms='N'";//N：否；Y：是
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=" and a.sfjms='N'";//N：否；Y：是
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);


	jpgFileName =yblc.pie3D(ls_sql,"自营分公司产值占比",950,580,1,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >

<P>

<%
	ls_sql=" SELECT dwmc,sum(qye) qye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and cw_qmjzmx.zt in('2')";
	ls_sql+=" and sq_dwxx.sfjms='Y'";//N：否；Y：是
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=" and a.sfjms='Y'";//N：否；Y：是
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by dwmc";
	ls_sql+=" order by qye desc";

//	out.println(ls_sql);


	jpgFileName =yblc.pie3D(ls_sql,"加盟商产值占比",950,580,1,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >

<P>
<%
	ls_sql=" SELECT dwmc,sum(qye) qye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc,sum(qye) qye";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.fgsbh=sq_dwxx.dwbh";
	ls_sql+=" and cw_qmjzmx.zt in('2')";
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by dwmc";
	ls_sql+=" order by qye desc";


	jpgFileName =yblc.pie3D(ls_sql,"全部(自营加盟商)产值占比",950,580,1,request,session);
%>
	<img src="<%=jpgFileName%>" border=0 >

</body>
</html>