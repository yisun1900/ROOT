<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String fgs=request.getParameter("fgs");

String wheresql="";

if (!(fgs.equals("")))
{
	wheresql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>员工结构统计表</B><BR>
</CENTER>

<%
	int sl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM dm_dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();
%>

<table border="1" width="<%=(150+180*sl+90)%>px" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
	<tr bgcolor="#CCCCCC"  align="center" > 
		<td rowspan="2" width="150px">分公司</td>
<%
	String 	dwtjflbm=null;
	String 	dwtjflmc=null;
	ls_sql="SELECT dwtjflbm,dwtjflmc";
	ls_sql+=" FROM dm_dwtjflbm";
	ls_sql+=" order by dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwtjflbm=rs.getString("dwtjflbm");
		dwtjflmc=rs.getString("dwtjflmc");

		%>
		<td colspan="2"><%=dwtjflmc%></td>
		<%
	}
	rs.close();
	ps.close();
%>
	<td rowspan="2" width="90px">小计</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center" > 
<%
	ls_sql="SELECT dwtjflbm,dwtjflmc";
	ls_sql+=" FROM dm_dwtjflbm";
	ls_sql+=" order by dwtjflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		%>
		<td  width="90px">数量</td>
		<td  width="90px">占比</td>
		<%
	}
	rs.close();
	ps.close();
%>
  </tr>
  <%

	String 	dwbh=null;
	String 	dwmc=null;
	ls_sql="SELECT dwbh,dwmc";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwlx in('A0','F0')";
	ls_sql+=wheresql;
	ls_sql+=" order by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dwbh=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");

		int fgszs=0;
		
		ls_sql=" SELECT count(distinct sq_yhxx.sfzh)";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sq_yhxx.ssfgs='"+dwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fgszs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		
		
		%>
		  <tr align="center"> 
			<td><%=dwmc%></td>
		<%

		int bmsl=0;
		double bmzb=0;
		ls_sql=" SELECT dwtjflbm,dwtjflmc,sum(bmsl)";
		ls_sql+=" FROM ( ";
		
		ls_sql+=" SELECT dm_dwflbm.dwtjflbm,dwtjflmc,count(distinct sq_yhxx.sfzh) bmsl";
		ls_sql+=" FROM sq_yhxx,sq_dwxx,dm_dwflbm,dm_dwtjflbm";
		ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sq_yhxx.ssfgs='"+dwbh+"' and sq_yhxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and sq_dwxx.dwflbm=dm_dwflbm.dwflbm and dm_dwflbm.dwtjflbm=dm_dwtjflbm.dwtjflbm ";
		ls_sql+=" group by dm_dwflbm.dwtjflbm,dwtjflmc";

		ls_sql+=" UNION ALL ";

		ls_sql+=" SELECT dwtjflbm,dwtjflmc,0 bmsl";
		ls_sql+=" FROM dm_dwtjflbm";
		
		ls_sql+=" ) ";

		ls_sql+=" group by dwtjflbm,dwtjflmc";
		ls_sql+=" order by dwtjflbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			dwtjflmc=rs1.getString("dwtjflmc");
			bmsl=rs1.getInt(3);

			if (fgszs==0)
			{
				bmzb=0;
			}
			else{
				bmzb=bmsl*100.0/fgszs;
			}

			%>
			<td ><%=bmsl%></td>
			<td ><%=cf.round(bmzb,1)%>%</td>
			<%
		
		}
		rs1.close();
		ps1.close();

		%>
			<td ><%=fgszs%></td>
		  </tr> 
		<%

	}
	rs.close();
	ps.close();

	//总计

	int fgszs=0;
	
	ls_sql=" SELECT count(distinct sq_yhxx.sfzh)";
	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sq_yhxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=wheresql;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		fgszs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	
	
	%>
	  <tr align="center"> 
		<td>总 计</td>
	<%

	int bmsl=0;
	double bmzb=0;
	ls_sql=" SELECT dwtjflbm,dwtjflmc,sum(bmsl)";
	ls_sql+=" FROM ( ";
	
	ls_sql+=" SELECT dm_dwflbm.dwtjflbm,dwtjflmc,count(distinct sq_yhxx.sfzh) bmsl";
	ls_sql+=" FROM sq_yhxx,sq_dwxx,dm_dwflbm,dm_dwtjflbm";
	ls_sql+=" where sq_yhxx.sfzszg in('Y','N') and sq_yhxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and sq_dwxx.dwflbm=dm_dwflbm.dwflbm and dm_dwflbm.dwtjflbm=dm_dwtjflbm.dwtjflbm ";
	ls_sql+=wheresql;
	ls_sql+=" group by dm_dwflbm.dwtjflbm,dwtjflmc";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT dwtjflbm,dwtjflmc,0 bmsl";
	ls_sql+=" FROM dm_dwtjflbm";
	
	ls_sql+=" ) ";

	ls_sql+=" group by dwtjflbm,dwtjflmc";
	ls_sql+=" order by dwtjflbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		dwtjflmc=rs1.getString("dwtjflmc");
		bmsl=rs1.getInt(3);

		if (fgszs==0)
		{
			bmzb=0;
		}
		else{
			bmzb=bmsl*100.0/fgszs;
		}

		%>
		<td ><%=bmsl%></td>
		<td ><%=cf.round(bmzb,1)%>%</td>
		<%
	
	}
	rs1.close();
	ps1.close();

	%>
		<td ><%=fgszs%></td>
	  </tr> 
	<%

%> 
</table>
</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " +e+"!"+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>

