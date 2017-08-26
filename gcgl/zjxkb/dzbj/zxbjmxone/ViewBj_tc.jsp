<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String fgsbh=request.getParameter("fgsbh");
String tcmc=cf.GB2Uni(request.getParameter("sctcmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;

String bjjbbm=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=rs.getString(1);
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>

  <table width="100%" border="0">
    <tr> 
      <td colspan="2">
        <div align="center">
          <b><font size="5">查看套餐（名称：<%=tcmc%>）</font></b></div>
      </td>
    </tr>
  </table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"> 
    <td  width="4%" align="center">序号</td>
    <td  width="7%" align="center">项目编号</td>
    <td  width="15%" align="center">项目名称</td>
    <td  width="7%" align="center">单位</td>
    <td  width="8%" align="center">单价（元）</td>
    <td  width="6%" align="center">数量</td>
    <td  width="8%" align="center">金额（元）</td>
    <td  width="45%" align="center">工艺做法及材料说明</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_tcfjxx.jgwzbm";
	ls_sql+=" FROM bj_tcfjxx ";
    ls_sql+=" where fgsbh='"+fgsbh+"' and bj_tcfjxx.tcmc='"+tcmc+"'";
	ls_sql+=" order by bj_tcfjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		//输出标题
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="8"> 
			  <div align="center"><b><i><font size="3">结构位置：<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		//输出项目明细
		ls_sql="SELECT bj_tcbjxmmx.xmbh||DECODE(bj_jzbjb.bjlx,'1','','2','增') xmbh,bj_jzbjb.xmmc,jldwmc,bj_jzbjb.bj,bj_tcgclmx.sl,bj_tcgclmx.sl*bj_jzbjb.bj as je,bj_jzbjb.gycl";
		ls_sql+=" FROM bj_tcbjxmmx,bj_jzbjb,jdm_jldwbm,bj_tcgclmx  ";
		ls_sql+=" where bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm ";
		ls_sql+=" and bj_tcbjxmmx.fgsbh='"+fgsbh+"' and bj_tcgclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_tcbjxmmx.fgsbh=bj_tcgclmx.fgsbh and bj_tcbjxmmx.xmbh=bj_tcgclmx.xmbh";
		ls_sql+=" and bj_tcbjxmmx.xmbh=bj_jzbjb.xmbh and bj_tcbjxmmx.dqbm=bj_jzbjb.dqbm";
		ls_sql+=" and bj_jzbjb.bjjbbm='"+bjjbbm+"'";
		ls_sql+=" and bj_tcbjxmmx.tcmc='"+tcmc+"'";
		ls_sql+=" and bj_tcgclmx.tcmc='"+tcmc+"'";
		ls_sql+=" order by bj_tcgclmx.fjnxh,bj_tcbjxmmx.xmpx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			dj=rs.getDouble("bj");
			sl=rs.getDouble("sl");
			qye=rs.getDouble("je");
			gycl=cf.fillHtml(rs.getString("gycl"));


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;

			row++;
			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF"> 
				<td align="center" width="4%"><%=row%></td>
				<td align="center" width="7%"><%=xmbh%></td>
				<td align="center" width="15%"><%=xmmc%></td>
				<td align="center" width="7%"><%=jldwmc%></td>
				<td align="center" width="8%"><%=dj%></td>
				<td align="center" width="6%"><%=cf.formatDouble(sl)%></td>
				<td align="center" width="8%"><%=cf.formatDouble(qye,"#########.##")%></td>
				<td align="left" width="45%"><%=gycl%></td>
			  </tr>
			<%
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="8"><b><i><font size="3"><%=oldjgwzmc%>小计：<%=cf.formatDouble(xjqye,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
%> 
  <tr bgcolor="#FFFFFF" align="right"> 
	<td colspan="8"><b><i><font size="3">总 计：<%=cf.formatDouble(allqye,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
  </tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("发生意外: " + ls_sql);
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