<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String mbmc=cf.GB2Uni(request.getParameter("mbmc"));
int pos=mbmc.indexOf("+");
String yhdlm=mbmc.substring(pos+1);
mbmc=mbmc.substring(0,pos);

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
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

String bjjbbm="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx ";
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
<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2">
        <div align="center">
          <b><font size="5">查看模板（名称：<%=mbmc%>--<%=yhdlm%>）</font></b></div>
      </td>
    </tr>
  </table>
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="5%">序号</td>
	<td  width="10%">报价类型</td>
    <td  width="10%">项目编号</td>
    <td  width="20%">项目名称</td>
	<td  width="12%">项目大类</td>
	<td  width="13%">项目小类</td>
    <td  width="10%" >计量单位</td>
	<td  width="10%">饰面</td>
	<td  width="10%">工程量</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_bjmbfjxx.jgwzbm";
	ls_sql+=" FROM bj_bjmbfjxx ";
    ls_sql+=" where bj_bjmbfjxx.mbmc='"+mbmc+"' and bj_bjmbfjxx.yhdlm='"+yhdlm+"'";
	ls_sql+=" order by bj_bjmbfjxx.xuhao ";
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
			<td colspan="9"> 
			  <div align="center"><b><i><font size="3">结构位置：<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		String xmdlmc=null;
		String xmxlmc=null;
		String smmc=null;
		String bjlx=null;
		//输出项目明细
		ls_sql="SELECT bj_bjmb.xh,bj_jzbjb.xmbh,bj_jzbjb.xmmc,smmc,xmdlmc,xmxlmc ,jdm_jldwbm.jldwmc,smmc,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlx";
		ls_sql+=" FROM bj_bjmbgclmx,bj_bjmb,bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,jdm_jldwbm  ";
		ls_sql+=" where bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";

		ls_sql+=" and bj_bjmbgclmx.mbmc='"+mbmc+"' and bj_bjmbgclmx.yhdlm='"+yhdlm+"' and bj_bjmbgclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjmbgclmx.dqbm=bj_jzbjb.dqbm and bj_bjmbgclmx.xmbh=bj_jzbjb.xmbh";
		ls_sql+=" and bj_bjmbgclmx.dqbm=bj_bjmb.dqbm and bj_bjmbgclmx.xmbh=bj_bjmb.xmbh and bj_bjmb.yhdlm='"+yhdlm+"' and bj_bjmb.mbmc='"+mbmc+"'";
		ls_sql+=" and bj_jzbjb.bjjbbm='"+bjjbbm+"'";
		ls_sql+=" order by bj_bjmbgclmx.fjnxh,bj_bjmb.xh";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			xh=cf.fillHtml(rs.getString("xh"));
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));
			xmdlmc=cf.fillHtml(rs.getString("xmdlmc"));
			xmxlmc=cf.fillHtml(rs.getString("xmxlmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			smmc=cf.fillHtml(rs.getString("smmc"));
			bjlx=cf.fillHtml(rs.getString("bjlx"));


			xjsl+=sl;
			xjqye+=qye;
			allsl+=sl;
			allqye+=qye;

			row++;

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td ><%=bjlx%></td>
				<td ><%=xmbh%></td>
				<td ><%=xmmc%></td>
				<td ><%=xmdlmc%></td>
				<td ><%=xmxlmc%></td>
				<td ><%=jldwmc%></td>
				<td ><%=smmc%></td>
				<td >&nbsp;</td>
			  </tr>
			<%
			
		}
		ps.close();
		rs.close();

		//输出小计
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="9"><b><i><font size="3"><%=oldjgwzmc%>小计：<%=cf.formatDouble(xjqye,"#########.##")%>元&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
		  </tr>
		<%
	
	}
	rs1.close();
	ps1.close();
%> 
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>