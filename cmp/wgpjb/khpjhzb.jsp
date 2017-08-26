<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>客户评价汇总表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}
	
String wheresql="";
String lrsj=null;
lrsj=request.getParameter("lrsj");
if (lrsj!=null)
{
	if (!(lrsj.equals("")))	wheresql+="  and (crm_khpjb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
}
String lrsj2=null;
lrsj2=request.getParameter("lrsj2");
if (lrsj2!=null)
{
	if (!(lrsj2.equals("")))	wheresql+="  and (crm_khpjb.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	int xmsl=0;
	int xskd=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xskd=110+50+xmsl*90;


%>


<body bgcolor="#FFFFFF">
  
<div align="center">客户评价汇总表（<%=lrsj%> 至 <%=lrsj2%>）</div>
  <table width="<%=xskd%>px" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr align="center" bgcolor="#FFFFFF">
      <td rowspan="3" width="110px">&nbsp;</td>
      <td rowspan="3" width="50px">实收数量</td>
    <%
	String spjrybm=null;
	String spjry=null;
	String pjxmbm=null;
	String pjxm=null;
	int sl=0;


	ls_sql=" select spjrybm,spjry,count(*)";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ls_sql+=" group by spjrybm,spjry";
	ls_sql+=" order by spjrybm,spjry";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
		sl=rs.getInt(3);

		%>
		  <td colspan="<%=sl*2%>"><%=spjry%></td>
		<%
	}
	rs.close();
	ps.close();

%>
    </tr>

    <tr align="center" bgcolor="#FFFFFF">
    <%
	ls_sql=" select spjrybm,spjry,pjxmbm,pjxm";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ls_sql+=" order by spjrybm,spjry,pjxmbm,pjxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
		pjxmbm=rs.getString("pjxmbm");
		pjxm=rs.getString("pjxm");

%>
      <td colspan="2"><%=pjxm%></td>
<%
	}
	rs.close();
	ps.close();
%>
    </tr>

    <tr align="center" bgcolor="#FFFFFF">
    <%
	ls_sql=" select spjrybm,spjry,pjxmbm,pjxm";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ls_sql+=" order by spjrybm,spjry,pjxmbm,pjxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
		pjxmbm=rs.getString("pjxmbm");
		pjxm=rs.getString("pjxm");

%>
      <td width="50px">份数</td>
      <td width="40px">比例</td>
<%
	}
	rs.close();
	ps.close();
%>
    </tr>

<%
	int fgssl=0;
	int[] zsl=new int[xmsl+1];
	double bl=0;
	
	String fgsbh=null;
	String fgsmc=null;
	String bgcolor="#FFFFFF";
	int row=0;
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ls_sql+=" order by dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("dwbh"));
		fgsmc=cf.fillNull(rs.getString("dwmc"));

		row++;

		if (row%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else {
			bgcolor="#E8E8FF";
		}


		//分公司实收数量
		fgssl=0;
		ls_sql=" select count(distinct crm_khpjb.khbh) sl";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fgssl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		zsl[0]+=fgssl;

%>
    <tr align="center" bgcolor="<%=bgcolor%>">
      <td><%=fgsmc%></td>
      <td><A HREF="ViewPjKhmx.jsp?fgsbh=<%=fgsbh%>&lrsj=<%=lrsj%>&lrsj2=<%=lrsj2%>" target="_blank"><%=fgssl%></A></td>
<%
		bl=0;
		int col=0;
		ls_sql="select spjrybm,spjry,pjxmbm,pjxm,sum(sl)";
		ls_sql+=" from ( ";
		
		ls_sql+=" select spjrybm,spjry,pjxmbm,pjxm,count(*) sl";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khpjb.xmflbm='07'";
		ls_sql+=wheresql;
		ls_sql+=" group by spjrybm,spjry,pjxmbm,pjxm";

		ls_sql+=" UNION ALL ";

		ls_sql+=" select spjrybm,spjry,pjxmbm,pjxm,0 sl";
		ls_sql+=" from crm_pjxmbm";
		ls_sql+=" where xmflbm='07'";
		
		ls_sql+=" ) ";

		ls_sql+=" group by spjrybm,spjry,pjxmbm,pjxm";
		ls_sql+=" order by spjrybm,spjry,pjxmbm,pjxm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			spjrybm=rs1.getString("spjrybm");
			spjry=rs1.getString("spjry");
			pjxmbm=rs1.getString("pjxmbm");
			pjxm=rs1.getString("pjxm");
			sl=rs1.getInt(5);

			col++;

			zsl[col]+=sl;

			if (fgssl==0)
			{
				bl=0;
			}
			else{
				bl=sl*100.0/fgssl;
			}

			%>
			  <td><A HREF="ViewPjKhmx.jsp?fgsbh=<%=fgsbh%>&lrsj=<%=lrsj%>&lrsj2=<%=lrsj2%>&spjrybm=<%=spjrybm%>&pjxmbm=<%=pjxmbm%>" target="_blank"><%=sl%></A></td>
			  <td><%=cf.formatDouble(bl)%>%</td>
			<%
		
		}
		rs1.close();
		ps1.close();
%>
	</tr>
<%

	}
	rs.close();
	ps.close();
	
%> 
    <tr align="center" bgcolor="#FFFFFF">
      <td><B>合  计</B></td>
      <td><B><%=zsl[0]%></B></td>
	<%
	for (int i=1;i<xmsl+1 ;i++ )
	{
		if (zsl[0]==0)
		{
			bl=0;
		}
		else{
			bl=zsl[i]*100.0/zsl[0];
		}

		out.println("<td><B>"+zsl[i]+"</B></td>");
		out.println("<td><B>"+cf.formatDouble(bl)+"%</B></td>");
	}
	%>

	</tr>
  </table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

