<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
@media print{
	INPUT {display:none}
}
.STYLE2 {font-size: 18px}
</style>

</head>


<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;

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
String ssfgs=null;
String dzbjbz=null;
String fwmj=null;
String fjtcbz="";

String mark="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc,fgsbh,fwmj,fjtcbz";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjbmc"));
		ssfgs=rs.getString("fgsbh");
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fjtcbz=cf.fillNull(rs.getString("fjtcbz"));
	}
	rs.close();
	ps.close();

	if (fjtcbz.equals("Y"))//Y���ֽ⣻N��δ�ֽ⣻M�����ײ�
	{
		out.println("<font color=\"#FF0000\">�����ѷֽⶩ��</font>");
		return;
	}
	else if (fjtcbz.equals("M"))//Y���ֽ⣻N��δ�ֽ⣻M�����ײ�
	{
		out.println("<font color=\"#FF0000\">���󣡷��ײͿͻ�</font>");
		return;
	}

%>
<body >


<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>

  <tr bgcolor="#FFFFFF" align="center"> 
    <td colspan="8" class="STYLE2" ><B>��װ������ϸ
      <label>
      <input type="button" value="���ɶ���" <%=mark%> onClick="window.open('SaveInsertJc_zcdd.jsp?khbh=<%=khbh%>')">
      </label>
    </B></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" >�ͻ�������<%=khxm%></td>
    <td colspan="3" >���̸����ˣ�</td>
    <td width="27%" >�� �� ʦ��<%=sjs%></td>
	<td width="21%" >�Ƶ����ڣ�<%=cf.today()%></td>
  </tr>
    <tr bgcolor="#FFFFFF"> 
    <td colspan="12"  >�ͻ���ַ��<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" >�ͻ��绰��<%=lxfs%></td>
    <td align="left" >����ʱ�䣺</td>
	<td >���������<%=fwmj%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="4%" >���</td>
    <td  width="10%" >��Ŀ����</td>
    <td  width="10%" >��ĿС��</td>
    <td  width="8%" >��Ŀ���</td>
    <td  width="18%" >��Ŀ����</td>
	<td  width="5%" >��λ</td>
    <td  width="5%" >����</td>
    <td  width="30%" >��������������˵��</td>
	<td  width="10%" >�������ƹ��</td>
  </tr>

	
<%
	String jgwzmc=null;

	double allsl=0;

	int i=0;
	ls_sql="SELECT jgwzbm";
	ls_sql+=" FROM bj_fjxx ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xuhao ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		double xjsl=0;
		
		String xmdlmc=null;
		String xmxlmc=null;
		String xmbh=null;
		String xmmc=null;
		String jldwmc=null;

		double sl=0;
		String gycl=null;
		String flmcgg=null;
		String bjbz=null;

		//�����Ŀ��ϸ
		ls_sql="SELECT bj_bjxmmx.xmbh,xmmc,bdm_xmdlbm.xmdlmc,bdm_xmxlbm.xmxlmc,jldwmc,bj_gclmx.sl,gycl,bj_bjxmmx.flmcgg,bj_bjxmmx.bz";
		ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bj_gclmx,bdm_xmdlbm,bdm_xmxlbm  ";
		ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) ";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm(+)  ";
		ls_sql+=" and bj_bjxmmx.xmxlbm=bdm_xmxlbm.xmxlbm(+)  ";
		ls_sql+=" and bj_bjxmmx.xmflbm='07'";//������
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_gclmx.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" order by bj_bjxmmx.xmdlbm,bj_bjxmmx.xmxlbm,bj_bjxmmx.xmbh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xmbh=cf.fillHtml(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));
			xmdlmc=cf.fillHtml(rs.getString("xmdlmc"));
			xmxlmc=cf.fillHtml(rs.getString("xmxlmc"));

			jldwmc=cf.fillHtml(rs.getString("jldwmc"));
			sl=rs.getDouble("sl");
			gycl=cf.fillHtml(rs.getString("gycl"));
			flmcgg=cf.fillHtml(rs.getString("flmcgg"));
			bjbz=cf.fillHtml(rs.getString("bz"));

			xjsl+=sl;
			xjsl=cf.round(xjsl,2);

			allsl+=sl;
			allsl=cf.round(allsl,2);

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=row%></td>
				<td ><%=xmdlmc%></td>
				<td ><%=xmxlmc%></td>
				<td ><%=xmbh%></td>
				<td ><%=xmmc%></td>
				<td ><%=jldwmc%></td>
				<td ><%=sl%></td>
				<td align="left"><%=gycl%></td>
				<td align="left"><%=flmcgg%></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();

		//�������
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td colspan="3">[<%=jgwzmc%>]С��</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td colspan="2"><%=xjsl%></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		  </tr>
		<%
	}
	rs1.close();
	ps1.close();
%> 
  		
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="3">�� ��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td colspan="2"><%=allsl%></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>

</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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






