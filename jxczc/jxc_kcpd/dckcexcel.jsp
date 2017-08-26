<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>		
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>Excel</title>
<meta http-equiv="Content-Type" content="excel; charset=GBK">
<style type="text/css">
����.xian{BORDER-LEFT-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-TOP-STYLE: none}
</style> 
</head>

<body bgcolor="#FFFFFF" align="center">
 <table width="150%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="0" cellspacing="0" align="center">
	<tr bgcolor="CCCCCC" align="center" > 
	<td  width="3%">���</td>
	<td  width="5%">����</td>
	<td  width="9%">�ֿ�</td>
	<td  width="9%">����</td>
	<td  width="10%">��������</td>
	<td  width="10%">��������</td>
	<td  width="10%">���ϱ���</td>
	<td  width="13%">��������</td>	
	<td  width="12%">�ͺ�</td>
	<td  width="12%">���</td>
	<td  width="10%">Ʒ��</td>
	<td  width="6%">�ڲ�����</td>
	<td  width="6%">�������</td>
	<td  width="6%">ʵ������</td>
    </tr>
		
<%
String ls_sql=null;
String pdph=request.getParameter("pdph");
String dqmc=null; 
String ckmc=null; 
String hjmc=null; 
String hwmc=null; 
String clbm=null; 
String clmc=null; 
String zljb=null; 
String xh=null; 
String gg=null;
String ppmc=null; 
String nbbm=null; 
double kcsl=0; 
String scph=null; 
String scrq=null; 

String ckbh=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;

String bg1="E8E8FF";
String bg2="FFFFFF";
int i=0;
try {
	conn=cf.getConnection();

	ls_sql="SELECT dqmc,jxc_kcb.ppmc,ckmc,jxc_kcb.hjbh,hjmc,jxc_kcb.clbm,jxc_kcb.clmc,jxc_kcb.xh,jxc_kcb.gg,jxc_kcb.nbbm,jxc_kcb.scph,jxc_kcb.scrq,sum(kcsl) kcsl";
	ls_sql+=" FROM jxc_kcpdjl,jxc_kcb,jxc_ckmc,jxc_hjmc,dm_dqbm ";
	ls_sql+=" where jxc_kcpdjl.pdph='"+pdph+"'";
	ls_sql+=" and jxc_kcpdjl.dqbm=jxc_kcb.dqbm  ";
	ls_sql+=" and jxc_kcpdjl.ckbh=jxc_kcb.ckbh  ";
	ls_sql+=" and jxc_kcpdjl.dqbm=dm_dqbm.dqbm  ";
	ls_sql+=" and jxc_kcb.ckbh=jxc_ckmc.ckbh(+) ";
	ls_sql+=" and jxc_kcb.hjbh=jxc_hjmc.hjbh(+) ";
	ls_sql+=" and jxc_kcb.cllb='2'  ";//0������Ʒ���ģ�1�����ģ�2�����Ʒ����
	ls_sql+=" group by dqmc,jxc_kcb.ppmc,ckmc,jxc_kcb.hjbh,hjmc,jxc_kcb.clbm,jxc_kcb.clmc,jxc_kcb.xh,jxc_kcb.gg,jxc_kcb.nbbm,jxc_kcb.scph,jxc_kcb.scrq";
	ls_sql+=" order by jxc_kcb.hjbh,jxc_kcb.scph,jxc_kcb.clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		i+=1;
		dqmc=cf.fillNull(rs.getString("dqmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ckmc=cf.fillNull(rs.getString("ckmc"));
		hjmc=cf.fillNull(rs.getString("hjmc"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		kcsl=rs.getDouble("kcsl");
		scph=cf.fillHtml(rs.getString("scph"));
		scrq=cf.fillHtml(rs.getDate("scrq"));


		%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center" >
		<td><%=i%></td>
		<td><%=dqmc%></td>
		<td><%=ckmc%></td>
		<td><%=hjmc%></td>
		<td><%=scph%></td>
		<td><%=scrq%></td>
		<td><%=clbm%></td>
		<td><%=clmc%></td>
		<td><%=xh%></td>
		<td><%=gg%></td>
		<td><%=ppmc%></td>
		<td><%=nbbm%></td>
		<td><%=kcsl%></td>
		<td>&nbsp;</td>
		</tr>
	<%}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
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
</table>
</body>
</html>
