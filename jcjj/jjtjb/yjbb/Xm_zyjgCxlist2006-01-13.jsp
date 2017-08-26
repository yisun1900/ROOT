<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
		String zgsmc=(String)session.getAttribute("zgsmc");
%>
<html>
<head>
<title>统计表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body <body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<center><B>项目专员定单统计表</B></center><BR>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String cxrq=request.getParameter("cxrq");
	String cxrq2=request.getParameter("cxrq2");
	Connection conn  = null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	String ls_sql=null;
	ResultSet rs=null;
	String yhmc=null;
	String mmsl=null;
	int lx=0;
	double htje=0;
	int lx1=0;
	double htje1=0;
	int lx2=0;
	double htje2=0;
	int lx3=0;
	double htje3=0;
	int lx4=0;
	double htje4=0;
	double htje5=0;
	double zt_fkje=0;
	double zt_fkje1=0;
	double zt_fkje2=0;
	double zt_fkje3=0;
%>


<table  width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:12">
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="4%">项目专员</td>
	<td  width="6%">家居类型</td>
	<td  width="6%">定单数量</td>
	<td  width="6%">实收总金额</td>
	<td  width="6%">合同总金额</td>
</tr>
<%

try {
		conn=cf.getConnection();
		ls_sql="select yhmc from sq_yhxx where zwbm='10' order by yhmc ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
				yhmc=rs.getString("yhmc");
				//out.print(yhmc);
				//统计木门及总收款
				ls_sql=" SELECT count(*) lstscs,sum(jc_mmydd.htje) htje,sum(cw_khfkjl.fkje) as zt_fkje ";
				ls_sql+=" from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and jc_mmydd.khbh=cw_khfkjl.khbh and jc_mmydd.htrq<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_mmydd.htrq>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and xmzy='"+yhmc+"'";
				//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery(ls_sql);
				if (rs1.next())
				{
					lx=rs1.getInt("lstscs");
					htje=rs1.getDouble("htje");
					zt_fkje=rs1.getDouble("zt_fkje");

				    out.print(zt_fkje);
					//out.print(lx);
				}
				rs1.close();
				ps1.close();
				//统计橱柜及总收款
				ls_sql=" SELECT count(*) lstscs,sum(jc_cgdd.htze) htje,sum(cw_khfkjl.fkje) as zt_fkje  ";
				ls_sql+=" from jc_cgdd,crm_khxx,cw_khfkjl where crm_khxx.khbh=jc_cgdd.khbh and jc_cgdd.khbh=cw_khfkjl.khbh and jc_cgdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_cgdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and xmzy='"+yhmc+"'";
				//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery(ls_sql);
				if (rs1.next())
				{
					lx1=rs1.getInt("lstscs");
					htje1=rs1.getDouble("htje");
					zt_fkje1=rs1.getDouble("zt_fkje");

					//out.print(htje);
					//out.print(lx);
				}
				rs1.close();
				ps1.close();
                //统计家具及总收款
				ls_sql=" SELECT count(*) lstscs,sum(jc_jjdd.htze) htje,sum(cw_khfkjl.fkje) as zt_fkje  ";
				ls_sql+=" from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and jc_jjdd.khbh=cw_khfkjl.khbh  and jc_jjdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_jjdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and xmzy='"+yhmc+"'";
				//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery(ls_sql);
				if (rs1.next())
				{
					lx2=rs1.getInt("lstscs");
					htje2=rs1.getDouble("htje");
					zt_fkje2=rs1.getDouble("zt_fkje");

					//out.print(htje);
					//out.print(lx);
				}
				rs1.close();
				ps1.close();
                //统计主材及总收款
				ls_sql=" SELECT count(*) lstscs,sum(jc_zcdd.hkze) htje,sum(cw_khfkjl.fkje) as zt_fkje ";
				ls_sql+=" from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and jc_zcdd.khbh=cw_khfkjl.khbh and jc_zcdd.qhtsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.qhtsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD') and xmzy='"+yhmc+"'";
				//ls_sql+=" group by b.dwmc,crm_khxx.dwbh,a.dwmc";
				out.print(ls_sql);
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery(ls_sql);
				if (rs1.next())
				{
					lx3=rs1.getInt("lstscs");
					htje3=rs1.getDouble("htje");
					zt_fkje3=rs1.getDouble("zt_fkje");

					//out.print(htje);
					//out.print(lx);
				}
				rs1.close();
				ps1.close();

				htje4=htje+htje2+htje3+htje1;
		%>

		<tr align="center">
		<td  width="4%"><%=yhmc%></td>
		<td  width="6%">木门</td>
		
		<td  width="6%"><%=lx%></td>
	
		<td  width="12%"><%=zt_fkje%></td>
		<td  width="12%"><%=htje%></td>

		</tr>
		<tr align="center">
		<td  width="4%"><%=yhmc%></td>
		<td  width="6%">橱柜</td>
	
		<td  width="6%"><%=lx1%></td>
		
		<td  width="12%"><%=zt_fkje1%></td>
		<td  width="12%"><%=htje1%></td>

		</tr>
		<tr align="center">
		<td  width="4%"><%=yhmc%></td>
		<td  width="6%">家具</td>
		
		<td  width="12%"><%=lx2%></td>
		
		<td  width="6%"><%=zt_fkje2%></td>
		<td  width="6%"><%=htje2%></td>

		</tr>
		<tr align="center">
		<td  width="4%"><%=yhmc%></td>
		<td  width="6%">主材</td>
		
		<td  width="6%"><%=lx3%></td>
		
		<td  width="12%"><%=zt_fkje3%></td>
		<td  width="12%"><%=htje3%></td>

		</tr>
		
		<!--  <tr align="center">
		<td  width="4%">小计</td>
		<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
		
		<td  width="6%">&nbsp;&nbsp;&nbsp;</td>
		
		<td  width="12%" >&nbsp;&nbsp;&nbsp;<font color="red"><%=htje4%></font></td>

		</tr>-->
		
<%
		htje5=htje5+htje4;

		}
		rs.close();
		ps.close();

}

catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>
<tr  align="center">
    <td  width="4%"><font color="red">合计(元)</td>
	<td  width="6%">  &nbsp;&nbsp;&nbsp; </td>
	<td  width="6%"> &nbsp;&nbsp;&nbsp;</td>
	
	
	
	<td  width="6%">&nbsp;</td>
	<td  width="6%"><font color="red"><%=htje5%></td>

</tr>
</table>

<table  width="100%" border="0" cellpadding="1" cellspacing="0" style="FONT-SIZE:16">
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<TR><td align="right"><%=zgsmc%>家居管理中心</td><td>&nbsp;&nbsp;</td></tr>
</table></body>
</html>