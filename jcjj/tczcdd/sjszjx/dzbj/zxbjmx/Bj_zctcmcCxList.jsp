<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String lx=request.getParameter("lx");

if (zjxxh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String xmmc=null;
String jldwmc=null;
String jgwzmc=null;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;'  scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="">
<input type="hidden" name="khbh" value="<%=khbh%>" >
<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
  <table border="0" cellspacing="1" cellpadding="1" width="100%" style='FONT-SIZE: 12px' bgcolor="#999999">
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="9%">���</td>
	<td  width="30%">�ײ�����</td>
	<td  width="18%">�۸�</td>
	<td  width="11%">ѡ���ײ�</td>
	<td  width="11%">ѡ���ͺ�</td>
	<td  width="11%">¼���ײ�����</td>
	<td  width="10%">ɾ��</td>
    </tr>

<%
	String bjjb=null;
	String ssfgs=null;
	ls_sql="SELECT bjjb,ssfgs";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	String tcbm=null;
	String tcmc=null;
	String tcj=null;
	ls_sql="SELECT tcbm,tcmc,tcj";
	ls_sql+=" FROM bj_zctcmc";
    ls_sql+=" where dqbm='"+dqbm+"'";
    ls_sql+=" and lx='"+lx+"'";//1���Ҿ��ײͣ�2�������ƻ�
    ls_sql+=" order by tcmc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		tcbm=rs.getString("tcbm");
		tcmc=rs.getString("tcmc");
		tcj=rs.getString("tcj");

		String zjlx="";//1��ԭ�ײͣ�3��ɾ���ײͣ�4�������ײ�
		ls_sql="SELECT zjlx";
		ls_sql+=" FROM bj_khzctcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zjlx=cf.fillNull(rs1.getString("zjlx"));
		}
		rs1.close();
		ps1.close();

		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//���ÿ������
		if (zjlx.equals("3"))
		{
			%> 
			<tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=(row+1)%></td>
				<td><A HREF="ViewBj_zctcmx.jsp?tcbm=<%=tcbm%>" target="lrbjframe"><%=tcmc%></A></td>
				<td><%=tcj%></td>
				<td>&nbsp;</td>
				<td colspan="2">��ɾ��</td>
				<td><A HREF="HyDeleteZctcmc.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&tcbm=<%=tcbm%>" >��ԭ</A></td>
			</tr>
			<%
		}
		else if (!zjlx.equals(""))
		{
			%> 
			<tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=(row+1)%></td>
				<td><A HREF="ViewBj_zctcmx.jsp?tcbm=<%=tcbm%>" target="lrbjframe"><%=tcmc%></A></td>
				<td><%=tcj%></td>
				<td>&nbsp;</td>
				<td><A HREF="Bj_khzctcmxList.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&tcbm=<%=tcbm%>&lx=<%=lx%>" target="lrbjframe">ѡ��</A></td>
				<td><A HREF="InsertBj_zctcmx.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&tcbm=<%=tcbm%>&lx=<%=lx%>" target="_blank">¼��</A></td>
				<td><A HREF="DeleteZctcmc.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&tcbm=<%=tcbm%>" target="lrbjframe">ɾ��</A></td>
			</tr>
			<%
		}
		else{
			%> 
			<tr bgcolor="<%=bgcolor%>" align="center"> 
				<td><%=(row+1)%></td>
				<td><A HREF="ViewBj_zctcmx.jsp?tcbm=<%=tcbm%>" target="lrbjframe"><%=tcmc%></A></td>
				<td><%=tcj%></td>
				<td><A HREF="SaveZctcmc.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&tcbm=<%=tcbm%>&lx=<%=lx%>" >ѡ��</A></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<%
		}

		row++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("��������: " + e);
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
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

parent.parent.guol.editform.fjlr.disabled=false;

//-->
</script>

