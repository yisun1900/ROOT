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
	ls_sql+=" from  jc_gysjs";
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
  <B><font size="3">�����ڴＯ�ɼҾ������̻����㵥(�����¼��:<%=jsjlh%>)</font></B>
</CENTER>

<div align="center">���̽��㣨��Ӧ�̣�<%=gys%>��Ʒ�ƣ�<%=ppbm%>��</div> 
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center" height="23">
	<td  width="9%">�ͻ�����</td>
	<td  width="7%">����ȷ������</td>
	<td  width="8%">Ʒ������</td>
	<td  width="5%">���ۺ�ͬ��</td>
	<td  width="6%">��ͬ�ܶ� </td>
	<td  width="6%">����Ʒ���Ϸ�</td>
	<td  width="6%">�ؼ�Ʒ���Ϸ�</td> 
	<td  width="6%">��װ��Զ�̷�</td>
	<td  width="5%">����Ʒ����</td>
	<td  width="5%">�ؼ�Ʒ����</td>
	<td  width="4%">��װ�ѱ���</td>
	<td  width="4%">Զ�̷ѱ���</td>
	<td  width="6%">���Ϸѽ����</td>
	<td  width="6%">������</td>
	<td  width="6%">��Ʒ����</td>
	<td  width="4%">��������</td>
	
	<td  width="67%">��ע</td>
</tr>
  <%
	String bjjbmc=null;
	String dwmc=null;
	String zcdlbm=null;
	String khxm=null;
	String clgw=null;
	String getddbh=null;
	String getzcxlbm=null;
	String getppbm=null;
	String getddlx=null;
	String getxshth=null;
	double getwdzje=0;
	double gethkze=0;
	double getzqclf=0;
	double getzcpclf=0;
	double gettjpclf=0;

	double getfdbl=0;
	double gettjpfdbl=0;
	double getazfjsbl=0;
	double getycfjsbl=0;
	double getfdje=0;

	double getqyf=0;
	double getclfjsje=0;
	double getfkje=0;
	String getddqrsj=null;
	String getbz=null;

	double allwdzje=0;
	double allhkze=0;
	double allzqclf =0;
	double allzcpclf=0;
	double alltjpclf=0;
	double allfdje=0;

	double allqyf=0;
	double allclfjsje =0;
 
	ls_sql="SELECT bjjbmc,dwmc,jc_zcdd.zcdlbm,crm_khxx.khxm,jc_zcdd.clgw,jc_zcdd.ddbh,zcxlbm,ppbm,jc_zcdd.xshth,jc_zcdd.wdzje,jc_zcdd.ddqrsj ";
	ls_sql+=" ,jc_zcdd.hkze,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.fdbl,jc_zcdd.tjpfdbl,round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2)+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2) fdje,jc_zcdd.bz,jc_zcdd.zqclf,jc_zcdd.qtf+jc_zcdd.ycf qyf,round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2) clfjsje,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','����','A','��������','B','��������շ�','C','ѡ��','D','�ײ�������','E','ɢ��') ddlx";
	ls_sql+=" ,jc_zcdd.azfjsbl,jc_zcdd.ycfjsbl";
	ls_sql+=" FROM jc_zcdd,jc_gysjsmx,crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where jc_gysjsmx.ddbh=jc_zcdd.ddbh(+)";//9�����ɼҾ�����
	ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh(+)"; 
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)"; 
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)"; 
	ls_sql+=" and jc_gysjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" order by crm_khxx.khxm,jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		zcdlbm=cf.fillHtml(rs.getString("zcdlbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		clgw=cf.fillNull(rs.getString("clgw"));
		getddbh=cf.fillNull(rs.getString("ddbh"));
		getzcxlbm=cf.fillHtml(rs.getString("zcxlbm"));
		getppbm=cf.fillHtml(rs.getString("ppbm"));
		getddlx=cf.fillHtml(rs.getString("ddlx"));

		getxshth=cf.fillHtml(rs.getString("xshth"));
		getwdzje=rs.getDouble("wdzje");
		gethkze=rs.getDouble("hkze");
		getzcpclf=rs.getDouble("zcpclf");
		gettjpclf=rs.getDouble("tjpclf");
		getfdbl=rs.getDouble("fdbl");
		gettjpfdbl=rs.getDouble("tjpfdbl");
		getfdje=rs.getDouble("fdje");
		getqyf=rs.getDouble("qyf");
		getazfjsbl=rs.getDouble("azfjsbl");
		getycfjsbl=rs.getDouble("ycfjsbl");

		getddqrsj=cf.fillHtml(rs.getDate("ddqrsj"));
		getbz=cf.fillHtml(rs.getString("bz"));
		getzqclf=rs.getDouble("zqclf");
		getclfjsje=rs.getDouble("clfjsje");

		allwdzje+=getwdzje;
		allwdzje=cf.round(allwdzje,2);
		allhkze+=gethkze;
		allhkze=cf.round(allhkze,2);
		allfdje+=getfdje;
		allfdje=cf.round(allfdje,2);

		allqyf+=getqyf;
		allqyf=cf.round(allqyf,2);
		allzqclf+=getzqclf;
		allzqclf=cf.round(allzqclf,2);

		allzcpclf+=getzcpclf;
		allzcpclf=cf.round(allzcpclf,2);

		alltjpclf+=gettjpclf;
		alltjpclf=cf.round(alltjpclf,2);
		
	
		allclfjsje+=getclfjsje;
		allclfjsje=cf.round(allclfjsje,2);


		%>
		<tr bgcolor="#FFFFF"  align="center" height="23">
			<td><%=khxm%>(<%=bjjbmc%>��<%=dwmc%>)</td>
			<td><%=getddbh%><BR><%=getddqrsj%></td>
			<td><%=getppbm%></td>
			<td><%=getxshth%></td>
			<td><%=gethkze%></td>
			<td><%=getzcpclf%></td>
			<td><%=gettjpclf%></td>
			<td><%=getqyf%></td>
			<td><%=getfdbl%>%</td>
			<td><%=gettjpfdbl%>%</td>
			<td><%=getazfjsbl%>%</td>
			<td><%=getycfjsbl%>%</td>
			<td><%=getclfjsje%></td>
			<td><%=getfdje%></td>
			<td><%=zcdlbm%></td>
			<td><%=getddlx%></td>
			
			<td><%=getbz%></td>
		</tr>
		<%


	 }
	 rs.close();
	 ps.close();
%> 
	<tr bgcolor="#FFFFF"  align="center" height="23">
		<td colspan="4">�� ��</td>
		<td><%=allhkze%></td>
		<td><%=allzcpclf%></td>
		<td><%=alltjpclf%></td>
		<td><%=allqyf%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allclfjsje%></td>
		<td><%=allfdje%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFF"  align="center" height="23">
		<td colspan="4">�۳�����</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=-1*kcfy%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFF"  align="center" height="23">
		<td colspan="4">Ӧ������</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.round(allfdje-kcfy,2)%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>


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
</table>


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
    <td width="27%">�����ڴ�����ˣ�</td>
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
    <td height="40" colspan="5">��ע����˶����϶�����ϸ����û�����⣬��ǩ��ȷ�ϣ�������Я��������Ʊ�������ڴ���ȡ֧Ʊ������Ʊ̧ͷ�������ڴ</td>
  </tr>
</table>
</body>
</html>

