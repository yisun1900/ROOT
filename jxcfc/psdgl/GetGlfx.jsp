<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");
String dqbm=request.getParameter("dqbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

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
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allxhl=0;
double allclf=0;
double xjxhl=0;
double xjclf=0;

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

double clfbfb=0;//���ӱ������޹��Ϸ�����Ĭ�ϲ��ϷѰٷֱ�


try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,wdzgce";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		zjqye=rs.getDouble("wdzgce");
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center">
  <input name="button" type="button" onClick="window.open('SaveGetGlfx.jsp?khbh=<%=khbh%>&psph=<%=psph%>&dqbm=<%=dqbm%>','_self')"  value="���Ϸ���ת��">
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>�ͻ�������<%=khxm%></td>
    <td>��ϵ��ʽ��<%=lxfs%> </td>
    <td>��ǰ��<%=cf.formatDouble(zjqye,"#########.##")%>Ԫ</td>
  </tr>
  <tr> 
    <td>���̵ص㣺<%=fwdz%></td>
    <td>�� �� ʦ��<%=sjs%></td>
    <td>���̵ȼ���<%=bjjb%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="5%" >���</td>
    <td  width="12%" >���ϱ���</td>
    <td  width="25%" >��������</td>
    <td  width="12%" >�ͺ�</td>
    <td  width="12%" >���</td>
    <td  width="8%" >��λ</td>
    <td  width="8%" >���ϵ���</td>
    <td  width="8%" >������</td>
    <td  width="11%" >���Ϸ�</td>
  </tr>

<%
	int i=0;


	//�����Ŀ��ϸ

		String glflbm=null;
		String glflmc=null;
		String glbxh=null;
		String glfxclmc=null;
		String jldwbm=null;
		String glfxclbm=null;
		String pp=null;
		double cldj=0;
		double xhl=0;


		double clf=0;

		xjxhl=0;
		xjclf=0;

		ls_sql="SELECT bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,bj_khglfxb.glfxclbm,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc,sum(bj_khglfxb.xhl*bj_gclmx.sl) xhl";
		ls_sql+=" FROM jdm_jldwbm,bdm_glflbm,bj_khglfxb,bj_gclmx  ";
		ls_sql+=" where bj_khglfxb.glflbm=bdm_glflbm.glflbm(+) and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
		ls_sql+=" and bj_gclmx.khbh='"+khbh+"'  and bj_khglfxb.glflbm='1'";//���Ϸ�
		ls_sql+=" and bj_gclmx.khbh=bj_khglfxb.khbh and bj_gclmx.dqbm=bj_khglfxb.dqbm and bj_gclmx.xmbh=bj_khglfxb.xmbh ";
		ls_sql+=" group by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,bj_khglfxb.glfxclbm,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc ";
		ls_sql+=" order by bj_khglfxb.glflbm,bdm_glflbm.glflmc,bj_khglfxb.glfxclmc,bj_khglfxb.glfxclbm,bj_khglfxb.jldwbm,jdm_jldwbm.jldwmc ";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			glflbm=cf.fillNull(rs.getString("glflbm"));
			glflmc=cf.fillHtml(rs.getString("glflmc"));
			glfxclbm=rs.getString("glfxclbm");
			glfxclmc=cf.fillNull(rs.getString("glfxclmc"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			jldwmc=cf.fillHtml(rs.getString("jldwmc"));

			xhl=rs.getDouble("xhl");


			cldj=0;
			String xh=null;
			String gg=null;
			ls_sql=" select jxc_cljgb.dgzjg,jxc_clbm.xh,jxc_clbm.gg";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
			ls_sql+=" and  jxc_clbm.nbbm='"+glfxclbm.trim()+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
//			out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cldj=rs1.getDouble("dgzjg");
				xh=cf.fillHtml(rs1.getString("xh"));
				gg=cf.fillHtml(rs1.getString("gg"));
			}
			rs1.close();
			ps1.close();

			clf=cldj*xhl;
			clf=cf.round(clf,2);



			allxhl+=xhl;
			allclf+=clf;
			xjxhl+=xhl;
			xjclf+=clf;

			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td ><%=row%></td>
				<td><%=cf.fillHtml(glfxclbm)%></td>
				<td><%=glfxclmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldwmc%></td>
				<td><%=cldj%></td>
				<td><%=cf.formatDouble(xhl)%></td>
				<td><%=cf.formatDouble(clf)%></td>
			  </tr>
			<%
			row++;
		}
		rs.close();
		ps.close();

	//���С��
	%> 
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td colspan="5"><B>��  ��  ��  С  ��</B></td>
		<td >&nbsp;</td>
		<td >&nbsp;</td>
		<td ><%=cf.formatDouble(xjxhl,"#########.##")%></td>
		<td ><%=cf.formatDouble(xjclf,"#########.##")%></td>
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