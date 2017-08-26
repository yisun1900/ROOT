<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

String dqbm=null;
String xmbh=null;
String xmmc=null;


String ssfgs=null;
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


String cldlbm=null;


try {
	conn=cf.getConnection();


	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="8" ><img src="/images/tubiao.jpg" ></td>
  </tr>
</table>
<div align="center"> <b>材料品牌取定表</b> 
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr > 
    <td >


<%
	//输出项目明细
	ls_sql="SELECT distinct jxc_clbm.cldlbm";
	ls_sql+=" FROM bj_khglfxb,jdm_jldwbm,jxc_clbm  ";
	ls_sql+=" where trim(bj_khglfxb.glfxclbm)=jxc_clbm.nbbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=" and bj_khglfxb.khbh='"+khbh+"'";
	ls_sql+=" order by jxc_clbm.cldlbm";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
%>
<%=cldlbm%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="9%" >编码</td>
    <td  width="15%" >材料名称</td>
    <td  width="12%" >品牌</td>
    <td  width="15%" >规格</td>
    <td  width="8%" >单位</td>
    <td  width="12%" >市场指导价（元）</td>
    <td  width="15%" >供应商</td>
	<td  width="14%">备注</td>
  </tr>

<%
		String nbbm=null;
		String glfxclmc=null;
		String ppmc=null;
		String gg=null;
		String jldwmc=null;
		String dj=null;
		String gysmc=null;

		ls_sql="SELECT distinct jxc_clbm.nbbm,bj_khglfxb.glfxclmc,jxc_clbm.ppmc,jxc_clbm.gg,jdm_jldwbm.jldwmc,bj_khglfxb.dj,jxc_cljgb.gysmc";
		ls_sql+=" FROM bj_khglfxb,jdm_jldwbm,jxc_clbm,jxc_cljgb  ";
		ls_sql+=" where trim(bj_khglfxb.glfxclbm)=jxc_clbm.nbbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=" and jxc_clbm.clbm=jxc_cljgb.clbm and jxc_cljgb.dqbm='"+dqbm+"'";
		ls_sql+=" and bj_khglfxb.khbh='"+khbh+"' and jxc_clbm.cldlbm='"+cldlbm+"'";
		ls_sql+=" order by jxc_clbm.nbbm";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			nbbm=cf.fillHtml(rs1.getString("nbbm"));
			glfxclmc=cf.fillHtml(rs1.getString("glfxclmc"));
			ppmc=cf.fillHtml(rs1.getString("ppmc"));
			gg=cf.fillHtml(rs1.getString("gg"));
			jldwmc=cf.fillHtml(rs1.getString("jldwmc"));
			dj=cf.fillHtml(rs1.getString("dj"));
			gysmc=cf.fillHtml(rs1.getString("gysmc"));

			//输出每行数据
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=nbbm%></td>
				<td><%=glfxclmc%></td>
				<td><%=ppmc%></td>
				<td><%=gg%></td>
				<td><%=jldwmc%></td>
				<td><%=dj%></td>
				<td><%=gysmc%></td>
				<td>&nbsp;</td>
			  </tr>
			<%
		}
		rs1.close();
		ps1.close();

		%>
		</table>
		<%

	}
	rs.close();
	ps.close();

	%> 
	</td>
  </tr>
</table>
<BR>	
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr > 
    <td>本材料单价为市场指导价，随市场价格变动进行增减。</td>
  </tr>
  <tr > 
    <td>理解本预算，同意施工，业主签字<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期：<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U>年<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U>月<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U>日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司电话：0551-2679998 2665600</td>
  </tr>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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