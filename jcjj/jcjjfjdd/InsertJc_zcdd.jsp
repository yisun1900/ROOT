<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>

<head>
<style>
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

String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String jldwmc=null;
double dj=0;
double qye=0;
String gycl=null;
String flmcgg=null;
String bjbz=null;
double xjqye=0;
double zjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;
double allzj=0;

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
    <td colspan="8" class="STYLE2" ><B>ȫװ���ײ�������ϸ
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

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF" align="center"> 
    <td  width="6%">�ռ�</td>
    <td  width="6%">����</td>
    <td  width="8%">��Ʒ���</td>
    <td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
    <td  width="4%">��λ</td>
    <td  width="5%">��������</td>
    <td  width="4%">�µ�������λ</td>
    <td  width="4%">�µ���</td>
    <td  width="4%">���</td>
    <td  width="5%">�Ƿ��账��С��</td>
    <td  width="5%">�µ�����</td>
    <td  width="8%">Ʒ��</td>
    <td  width="15%">��Ӧ��</td>
    <td  width="25%">���ײ�Ʒ˵��</td>
  </tr>

	
<%
	int i=0;
	ls_sql="SELECT distinct jgwzbm";
	ls_sql+=" FROM bj_khzcxm ";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by jgwzbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		jgwzmc=rs1.getString("jgwzbm");

		xjsl=0;
		xjqye=0;
		
		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzcxm,jxc_clxlbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"'";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		allsl+=xjsl;
		allqye+=xjqye;
		

		//�����Ŀ��ϸ
		String tccplbmc=null;
		String ppmc=null;
		String gysmc=null;
		String xh=null;
		String gg=null;
		String jldw=null;
		double sl=0;
		double xdsl=0;
		double sh=0;
		String ptcpsm=null;
		String bjjbmc=null;
		String xdjldw=null;
		double xdb=0;
		String sfxclxs=null;
		ls_sql="SELECT clxlmc,ppmc,gysmc,xh,gg,jldw,sl,xdsl,sh,ptcpsm,bjjbmc,xdjldw,xdb,DECODE(sfxclxs,'1','����ȡ��','2','����ȡ��','3','4��5��','4','������') sfxclxs";
		ls_sql+=" FROM bj_khzcxm,jxc_clxlbm,bdm_bjjbbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm";
		ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzmc+"'";
		ls_sql+=" order by jxc_clxlbm.clxlmc,xh";
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tccplbmc=rs.getString("clxlmc");
			ppmc=rs.getString("ppmc");
			gysmc=rs.getString("gysmc");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=rs.getString("jldw");
			sl=rs.getDouble("sl");
			xdsl=rs.getDouble("xdsl");
			sh=rs.getDouble("sh");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");
			xdjldw=rs.getString("xdjldw");
			xdb=rs.getDouble("xdb");
			sfxclxs=rs.getString("sfxclxs");

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td rowspan="<%=count%>"><%=jgwzmc%></td>
			
				<td><%=bjjbmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=xdjldw%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=sfxclxs%></td>
				<td><%=cf.formatDouble(xdsl)%></td>
				<td><%=ppmc%></td>
				<td><%=gysmc%></td>
				<td align="left" ><%=ptcpsm%></td>
			  </tr>
			  
		
			<%
		}

		while (rs.next())
		{
			tccplbmc=rs.getString("clxlmc");
			ppmc=rs.getString("ppmc");
			gysmc=rs.getString("gysmc");
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			jldw=rs.getString("jldw");
			sl=rs.getDouble("sl");
			xdsl=rs.getDouble("xdsl");
			sh=rs.getDouble("sh");
			ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
			bjjbmc=rs.getString("bjjbmc");
			xdjldw=rs.getString("xdjldw");
			xdb=rs.getDouble("xdb");
			sfxclxs=rs.getString("sfxclxs");

			row++;
			//���ÿ������
			%> 
			  <tr bgcolor="#FFFFFF" align="center"> 
				<td><%=bjjbmc%></td>
				<td><%=tccplbmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldw%></td>
				<td><%=cf.formatDouble(sl)%></td>
				<td><%=xdjldw%></td>
				<td><%=xdb%></td>
				<td><%=sh%>%</td>
				<td><%=sfxclxs%></td>
				<td><%=cf.formatDouble(xdsl)%></td>
				<td><%=ppmc%></td>
				<td><%=gysmc%></td>
				<td align="left" ><%=ptcpsm%></td>
			  </tr>
			  
		
			<%
		}
		rs.close();
		ps.close();
	}
	
	rs1.close();
	ps1.close();
%> 
  		

</table>
<tr bgcolor="#FFFFFF" align="center"> 
<td>&nbsp;</td>
</tr>
<p>&nbsp;</p>
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






