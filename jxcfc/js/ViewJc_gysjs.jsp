<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String shr=null;
String shsj=null;
String gys=null;
String ppbm=null;
String jssj=null;
String jsr=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double kcfy=0;
double jsje=0;
String jssm=null;
try {
	conn=cf.getConnection();

	ls_sql="select gys,ppbm,jssj,jsr,cbzj,ycfzj,qtfzj,kcfy,jsje,jssm,shr,shsj ";
	ls_sql+=" from  jc_fcgysjs";
	ls_sql+=" where  (jsjlh="+jsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gys=cf.fillNull(rs.getString("gys"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));
		cbzj=rs.getDouble("cbzj");
		ycfzj=rs.getDouble("ycfzj");
		qtfzj=rs.getDouble("qtfzj");
		kcfy=rs.getDouble("kcfy");
		jsje=rs.getDouble("jsje");
		jssm=cf.fillNull(rs.getString("jssm"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
	}
	rs.close();
	ps.close();
%>


<CENTER >
  <B><font size="3">���ĳ��̽���</font></B>
</CENTER>

<div align="center">����Ӧ�̣�<%=gys%>��Ʒ�ƣ�<%=ppbm%>��</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%">�ͻ�����</td>
    <td  width="14%">��ַ</td>
    <td  width="8%">��������</td>
    <td  width="7%">����ʱ��</td>
    <td  width="16%">��������</td>
    <td  width="12%">���</td>
    <td  width="12%">�ͺ�</td>
    <td  width="5%">��λ</td>
    <td  width="6%">����</td>
    <td  width="6%">����</td>
    <td  width="8%">�����ܼ�</td>
  </tr>
  <%

	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String getckph=null;
	String getcksj=null;
	int row=0;
	double zjsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;

	ls_sql =" select distinct jxc_clpsd.khbh,khxm,fwdz,jxc_ckd.ckph,jxc_ckd.cksj";
	ls_sql+=" from jc_fcgysjsmx,jxc_ckd,jxc_clpsd,crm_khxx";
	ls_sql+=" where jc_fcgysjsmx.ckph=jxc_ckd.ckph ";
	ls_sql+=" and jxc_ckd.lydh=jxc_clpsd.psph " ;
	ls_sql+=" and jxc_clpsd.khbh=crm_khxx.khbh" ;
	ls_sql+=" and jc_fcgysjsmx.jsjlh="+jsjlh;
    ls_sql+=" order by jxc_clpsd.khbh,jxc_ckd.ckph";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		fwdz=cf.fillNull(rs1.getString("fwdz"));
		getckph=cf.fillNull(rs1.getString("ckph"));
		getcksj=cf.fillNull(rs1.getDate("cksj"));

		
		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM jxc_ckmx ";
		ls_sql+=" where ckph='"+getckph+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String clmc=null;
		String gg=null;
		String xh=null;
		String jldwbm=null;
		double cksl=0;
		double cbdj=0;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;

//		String getckph=null;


		ls_sql =" SELECT clmc,gg,xh,jldwbm,cksl,cbdj,ROUND(NVL(cbdj*cksl,0),2) je ";
		ls_sql+=" FROM jxc_ckmx ";
		ls_sql+=" where ckph='"+getckph+"'";
		ls_sql+=" order by clmc,xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clmc=cf.fillHtml(rs.getString("clmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xh=cf.fillHtml(rs.getString("xh"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			cksl=rs.getDouble("cksl");
			cbdj=rs.getDouble("cbdj");
			je=rs.getDouble("je");


			xjsl+=cksl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;


			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td rowspan="<%=count%>"><%=khxm%></td>
				<td  rowspan="<%=count%>"><%=fwdz%></td>
				<td><%=getckph%></td>
				<td><%=getcksj%></td>
				<td><%=clmc%></td>
				<td ><%=gg%></td>
				<td ><%=xh%></td>
				<td ><%=jldwbm%></td>
				<td ><%=cksl%></td>
				<td ><%=cbdj%></td>
				<td ><%=je%></td>
			  </tr>
			  <%
		}

		while (rs.next())//��ʾͬһ�ͻ����¶���
		{
			clmc=cf.fillHtml(rs.getString("clmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xh=cf.fillHtml(rs.getString("xh"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			cksl=rs.getDouble("cksl");
			cbdj=rs.getDouble("cbdj");
			je=rs.getDouble("je");

			xjsl+=cksl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td><%=getckph%></td>
				<td><%=getcksj%></td>
				<td ><%=clmc%></td>
				<td ><%=gg%></td>
				<td ><%=xh%></td>
				<td ><%=jldwbm%></td>
				<td ><%=cksl%></td>
				<td ><%=cbdj%></td>
				<td ><%=je%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();
		

		zjsl+=xjsl;
		zjje+=xjje;
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;

		zjsl=cf.round(zjsl,2);
		zjje=cf.round(zjje,2);
		zjycf=cf.round(zjycf,2);
		zjqtfy=cf.round(zjqtfy,2);
		zjcxhdje=cf.round(zjcxhdje,2);
		
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="8"><font size="2"><b>[<%=khxm%>]С�� </b></font></td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjje)%></td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	
	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="8"><font size="3"><b>�ܼƣ�<%=(zjje-kcfy)%>Ԫ</b></font></td>
		<td><%=cf.formatDouble(zjsl)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
	  </tr>
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
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 
</table>

<P>
<table border="0" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr>
    <td>����˵��:<%=jssm%></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="20%">&nbsp;</td>
  </tr>
  <tr>
    <td width="27%">����ˣ�<%=shr%></td>
    <td width="27%">�����ˣ�</td>
    <td width="24%">�ɹ���ˣ�</td>
    <td colspan="2">����ȷ�ϣ�</td>
  </tr>
  <tr>
    <td>���ڣ�<%=shsj%></td>
    <td height="25">���ڣ�</td>
    <td>���ڣ�</td>
    <td colspan="2">���ڣ�</td>
  </tr>
  <tr>
    <td height="40" colspan="5">��ע����˶����϶�����ϸ����û�����⣬��ǩ��ȷ�ϣ�������Я��������Ʊ��������ȡ֧Ʊ��</td>
  </tr>
</table>
</body>
</html>

