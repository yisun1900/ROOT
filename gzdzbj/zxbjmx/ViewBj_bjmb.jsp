<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
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


try {
	conn=cf.getConnection();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2">
        <div align="center">
          <b><font size="5">�鿴ģ�壨���ƣ�<%=mbmc%>--<%=yhdlm%>��</font></b></div>
      </td>
    </tr>
  </table>
</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="5%">���</td>
	<td  width="10%">��������</td>
    <td  width="10%">��Ŀ���</td>
    <td  width="20%">��Ŀ����</td>
	<td  width="12%">��Ŀ����</td>
	<td  width="13%">��ĿС��</td>
    <td  width="10%" >������λ</td>
	<td  width="10%">����</td>
	<td  width="10%">������</td>
  </tr>

<%
	int i=0;
	ls_sql="SELECT bj_gzmbfjxx.jgwzbm";
	ls_sql+=" FROM bj_gzmbfjxx ";
    ls_sql+=" where bj_gzmbfjxx.mbmc='"+mbmc+"' and bj_gzmbfjxx.yhdlm='"+yhdlm+"'";
	ls_sql+=" order by bj_gzmbfjxx.xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		//�������
		%> 
		  <tr bgcolor="#FFFFFF"> 
			<td colspan="9"> 
			  <div align="center"><b><i><font size="3">�ṹλ�ã�<%=jgwzmc%></font></i></b></div>
			</td>
		  </tr>
		<%

		String xmdlmc=null;
		String xmxlmc=null;
		String smmc=null;
		String bjlx=null;
		//�����Ŀ��ϸ
		ls_sql="SELECT bj_gzmbxm.xh,bj_gzbjb.xmbh,bj_gzbjb.xmmc,smmc,xmdlmc,xmxlmc ,jdm_jldwbm.jldwmc,smmc,DECODE(bjlx,'1','��׼��Ŀ','2','�Զ�����Ŀ') bjlx";
		ls_sql+=" FROM bj_gzmbgclmx,bj_gzmbxm,bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,jdm_jldwbm  ";
		ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
		ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=" and bj_gzmbgclmx.mbmc='"+mbmc+"' and bj_gzmbgclmx.yhdlm='"+yhdlm+"' and bj_gzmbgclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_gzmbgclmx.dqbm=bj_gzbjb.dqbm and bj_gzmbgclmx.xmbh=bj_gzbjb.xmbh";
		ls_sql+=" and bj_gzmbgclmx.dqbm=bj_gzmbxm.dqbm and bj_gzmbgclmx.xmbh=bj_gzmbxm.xmbh and bj_gzmbxm.yhdlm='"+yhdlm+"' and bj_gzmbxm.mbmc='"+mbmc+"'";
		ls_sql+=" order by bj_gzmbxm.xh";
	//	out.println(ls_sql);
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

			//���ÿ������
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

		//���С��
		%> 
		  <tr bgcolor="#FFFFFF" align="right"> 
			<td colspan="9"><b><i><font size="3"><%=oldjgwzmc%>С�ƣ�<%=cf.formatDouble(xjqye,"#########.##")%>Ԫ&nbsp;&nbsp;&nbsp;&nbsp;</font></i></b></td>
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
	out.print("��������: " + e);
	out.print("��������: " + ls_sql);
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