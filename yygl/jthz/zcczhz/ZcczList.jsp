<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>主材产值汇总表</title>
</head>

<body>
<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String date_ss=null;
String date_se=null;
String date_bs=null;
String date_be=null;
String zqs=request.getParameter("zqs");//周期数
try
{
	conn=cf.getConnection();

	ls_sql="SELECT yy_rqsd_szs,yy_rqsd_sze,yy_rqsd_bzs,yy_rqsd_bze ";
	ls_sql+=" FROM yy_rqsd ";
	ls_sql+=" where zqs='"+zqs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		date_ss=cf.fillNull(rs.getDate("yy_rqsd_szs"));
		date_se=cf.fillNull(rs.getDate("yy_rqsd_sze"));
		date_bs=cf.fillNull(rs.getDate("yy_rqsd_bzs"));
		date_be=cf.fillNull(rs.getDate("yy_rqsd_bze"));
	}
	rs.close();
	ps.close();
	
%>
<table width="100%" border="0" style="FONT-SIZE:14" cellpadding="1" cellspacing="0">
<tr >
<td colspan="14" align="center">主材产值汇总表</td>
</tr>
<tr class=xl96 height=28 >
 <td width="11%" height="28" align="right">上周日期：</td>
 <td width="20%"><%=date_ss%> 至 <%=date_se%></td>
<td width="11%" align="right">本周日期：</td>
 <td width="20%" ><%=date_bs%> 至 <%=date_be%></td>
  <td colspan="10">&nbsp;</td>
  </tr>
  </table>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
 <tr height=28  align="center" bgcolor="#CCCCCC"  >
  <td width="10%">分公司</td>
  <td width="7%">本月累计</td>
  <td width="6%">设计师人数</td>
  <td width="7%">本月设计师人均主材产值</td>
  <td width="6%">家居顾问人数</td>
  <td width="7%">本月家居顾问人均主材产值</td>
  <td width="7%">去年同期月度主材产值</td>
  <td width="7%">主材产值本月计划</td>
  <td width="7%">本月达成率</td>
  <td width="7%">本月累计工程产值</td>
  <td width="7%">本月主材/工程占比</td>
  <td width="7%">上周计划</td>
  <td width="7%">上周完成</td>
  <td width="7%">本周预计</td>
  </tr>
<%
	
	double sjsrjcz=0;//本月设计师人均主材产值
	double jjgwrjcz=0;//本月家居顾问人均主材产值
	double bydcl=0;//本月达成率
	double zcgczb=0;//本月主材/工程占比

	int xjsjsrs=0;//设计师人数
	int xjjjgwrs=0;//家居顾问人数

	double xjyy_jjbqntq=0;//去年同期月度主材产值
	double xjyy_jjbbyjh=0;//本月计划
	double xjyy_jjbylj=0;//本月累计
	double xjyy_jjbszjh=0;//上周计划
	double xjyy_jjbszwc=0;//上周完成
	double xjyy_jjbbzyj=0;//本周预计

	double xjyy_jjbdmbylj=0;//所属店面本月累计工程产值

	String dwmc=null;
	String dwbh=null;
	ls_sql="select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx in('F0') and cxbz='N'";
    ls_sql+=" order by dwbh";
    ps1=conn.prepareStatement(ls_sql);
    rs1=ps1.executeQuery();
	while(rs1.next())
	{
		dwbh=rs1.getString("dwbh");	
		dwmc=rs1.getString("dwmc");

		int sjsrs=0;//设计师人数
		int jjgwrs=0;//家居顾问人数

		double yy_jjbqntq=0;//去年同期月度主材产值
		double yy_jjbbyjh=0;//本月计划
		double yy_jjbylj=0;//本月累计
		double yy_jjbszjh=0;//上周计划
		double yy_jjbszwc=0;//上周完成
		double yy_jjbbzyj=0;//本周预计

		double yy_jjbdmbylj=0;//所属店面本月累计工程产值


		ls_sql="select count(*) jjgwrs,sum(yy_jjb.yy_jjbqntq),sum(yy_jjb.yy_jjbylj)";
		ls_sql+=" ,sum(yy_jjb.yy_jjbszjh),sum(yy_jjb.yy_jjbszwc),sum(yy_jjb.yy_jjbbzyj),sum(yy_jjb.yy_jjbdmbylj) ";
		ls_sql+=" from yy_jjb";
		ls_sql+=" where  ssfgs='"+dwbh+"' and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			jjgwrs=rs.getInt(1);
			yy_jjbqntq=rs.getDouble(2);

			yy_jjbylj=rs.getDouble(3);

			yy_jjbszjh=rs.getDouble(4);
			yy_jjbszwc=rs.getDouble(5);
			yy_jjbbzyj=rs.getDouble(6);
			yy_jjbdmbylj=rs.getDouble(7);
		}
		rs.close();
		ps.close();


		ls_sql="select yy_sjjjb_byjh ";
		ls_sql+=" from YY_SJ";
		ls_sql+=" where yy_sj_fgs='"+dwbh+"'";
		ls_sql+=" and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			yy_jjbbyjh=rs.getDouble("yy_sjjjb_byjh");
		}
		rs.close();
		ps.close();

		ls_sql="select count(*) sjsrs ";
		ls_sql+=" from yy_sjb";
		ls_sql+=" where  ssfgs='"+dwbh+"' and zqs='"+zqs+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if(rs.next())
		{
			sjsrs=rs.getInt("sjsrs");
		}
		rs.close();
		ps.close();

		if(sjsrs==0)
		{
			sjsrjcz=0;
		}
		else{
			sjsrjcz=cf.round(yy_jjbylj/sjsrs,2);
		}

		if(jjgwrs==0)
		{
			jjgwrjcz=0;
		}
		else{
			jjgwrjcz=cf.round(yy_jjbylj/jjgwrs,2);
		}

		if(yy_jjbbyjh==0)
		{
			bydcl=0;
		}
		else
		{
			bydcl=cf.round(yy_jjbylj*100.0/yy_jjbbyjh,2);
		}

		if(yy_jjbdmbylj==0)
		{
			zcgczb=0;
		}
		else
		{
			zcgczb=cf.round(yy_jjbylj*100.0/yy_jjbdmbylj,2);
		}

		xjsjsrs+=sjsrs;//设计师人数
		xjjjgwrs+=jjgwrs;//家居顾问人数

		xjyy_jjbqntq+=yy_jjbqntq;//去年同期月度主材产值
		xjyy_jjbbyjh+=yy_jjbbyjh;//本月计划
		xjyy_jjbylj+=yy_jjbylj;//本月累计
		xjyy_jjbszjh+=yy_jjbszjh;//上周计划
		xjyy_jjbszwc+=yy_jjbszwc;//上周完成
		xjyy_jjbbzyj+=yy_jjbbzyj;//本周预计

		xjyy_jjbdmbylj+=yy_jjbdmbylj;//所属店面本月累计工程产值

		%>
		<tr bgcolor="#FFFFFF" align="center">
			<td><%=dwmc%></td>
			<td><%=yy_jjbylj%></td>
			<td><%=sjsrs%></td>
			<td><%=sjsrjcz%></td>
			<td><%=jjgwrs%></td>
			<td><%=jjgwrjcz%></td>

			<td><%=yy_jjbqntq%></td>
			<td><%=yy_jjbbyjh%></td>

			<td><%=bydcl%>%</td>

			<td><%=yy_jjbdmbylj%></td>
			<td><%=zcgczb%>%</td>
			<td><%=yy_jjbszjh%></td>
			<td><%=yy_jjbszwc%></td>
			<td><%=yy_jjbbzyj%></td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	if(xjsjsrs==0)
	{
		sjsrjcz=0;
	}
	else{
		sjsrjcz=cf.round(xjyy_jjbylj/xjsjsrs,2);
	}

	if(xjjjgwrs==0)
	{
		jjgwrjcz=0;
	}
	else{
		jjgwrjcz=cf.round(xjyy_jjbylj/xjjjgwrs,2);
	}

	if(xjyy_jjbbyjh==0)
	{
		bydcl=0;
	}
	else
	{
		bydcl=cf.round(xjyy_jjbylj*100.0/xjyy_jjbbyjh,2);
	}

	if(xjyy_jjbdmbylj==0)
	{
		zcgczb=0;
	}
	else
	{
		zcgczb=cf.round(xjyy_jjbylj*100.0/xjyy_jjbdmbylj,2);
	}
%>
<tr bgcolor="#FFFFFF" align="center">
	<td>小计</td>
	<td><%=cf.round(xjyy_jjbylj,2)%></td>
	<td><%=xjsjsrs%></td>
	<td><%=cf.round(sjsrjcz,2)%></td>
	<td><%=xjjjgwrs%></td>
	<td><%=cf.round(jjgwrjcz,2)%></td>

	<td><%=cf.round(xjyy_jjbqntq,2)%></td>
	<td><%=cf.round(xjyy_jjbbyjh,2)%></td>

	<td><%=cf.round(bydcl,2)%>%</td>

	<td><%=cf.round(xjyy_jjbdmbylj,2)%></td>
	<td><%=cf.round(zcgczb,2)%>%</td>
	<td><%=cf.round(xjyy_jjbszjh,2)%></td>
	<td><%=cf.round(xjyy_jjbszwc,2)%></td>
	<td><%=cf.round(xjyy_jjbbzyj,2)%></td>
</tr>
</table>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print(ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
