<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_dwxx_dwmc=null;
String dj=null;
double gcfzk=0;
double gczxzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double gcfjzk=0;
double jzk=0;
String fjmc=null;
String hdlx=null;
String zklx=null;
String jsbz=null;
String spbz=null;
String bz=null;
String yxscdz=null;
String kgxqthd=null;

double clfzk=0;
double zcfzk=0;
double rgfzk=0;
double ysfzk=0;
double jxfzk=0;
double shfzk=0;
double qtfzk=0;

String cxhdbm=null;
String fgsbh=request.getParameter("fgsbh");
String cxhdmc=cf.GB2Uni(cf.getParameter(request,"cxhdmc"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cxhd.cxhdbm,jc_cxhd.cxhdmc,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_cxhd.dj as dj,jc_cxhd.gcfzk as gcfzk,jc_cxhd.gczxzk as gczxzk,jc_cxhd.glfzk as glfzk,jc_cxhd.fjmc as fjmc,jc_cxhd.hdlx as hdlx,jc_cxhd.zklx as zklx,jc_cxhd.jsbz as jsbz,jc_cxhd.spbz as spbz,jc_cxhd.bz as bz,jc_cxhd.sjzk as sjzk,jc_cxhd.sjfzk,jc_cxhd.gcfjzk,jc_cxhd.jzk,jc_cxhd.yxscdz as yxscdz,jc_cxhd.kgxqthd as kgxqthd ";
	ls_sql+=" ,clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";	
	ls_sql+=" from  jc_cxhd,sq_dwxx";
	ls_sql+=" where jc_cxhd.fgsbh=sq_dwxx.dwbh and jc_cxhd.fgsbh='"+fgsbh+"' and jc_cxhd.cxhdmc='"+cxhdmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");

		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		dj=cf.fillNull(rs.getString("dj"));
		gcfzk=rs.getDouble("gcfzk");
		gczxzk=rs.getDouble("gczxzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		gcfjzk=rs.getDouble("gcfjzk");
		jzk=rs.getDouble("jzk");
		fjmc=cf.fillNull(rs.getString("fjmc"));
		hdlx=cf.fillNull(rs.getString("hdlx"));
		zklx=cf.fillNull(rs.getString("zklx"));
		jsbz=cf.fillNull(rs.getString("jsbz"));
		spbz=cf.fillNull(rs.getString("spbz"));
		bz=cf.fillNull(rs.getString("bz"));
		yxscdz=cf.fillNull(rs.getString("yxscdz"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
	}
	rs.close();
	ps.close();

	String xqmc="";
	ls_sql="SELECT xqmc";
	ls_sql+=" FROM jc_cxhdxq  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  xqmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xqmc+=cf.fillNull(rs.getString("xqmc"))+"��";
	}
	rs.close();
	ps.close();

	String dmmc="";
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM jc_cxhddm,sq_dwxx  ";
	ls_sql+=" where jc_cxhddm.dwbh=sq_dwxx.dwbh and cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  dwmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dmmc+=cf.fillNull(rs.getString("dwmc"))+"��";
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �����</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ���������  </td>
  <td width="32%"> 
    <%=cxhdbm%>  </td>
  <td align="right" width="18%">�ֹ�˾ </td>
  <td width="32%"><%=sq_dwxx_dwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���������</td>
  <td><%=cxhdmc%></td>
  <td align="right">�����</td>
  <td><%
	cf.radioToken(out, "1+�޻&2+��˾�&3+С���&4+չ��",hdlx,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�ɹ��������</td>
  <td width="32%"><%
	cf.radioToken(out, "1+���ɹ���&2+�ɹ���",kgxqthd,true);
%></td>
  <td align="right" width="18%">����</td>
  <td width="32%"> 
    <%=dj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td colspan="3"><A HREF="/jcjj/cxhd/file/<%=fjmc%>" target="_blank">����鿴��<%=fjmc%></A></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><strong>�μӻС��</strong></td>
  <td colspan="3"><%=xqmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><strong>�μӻ����</strong></td>
  <td colspan="3"><%=dmmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ������־ </td>
  <td><%
	cf.radioToken(out, "N+δ����&Y+����",jsbz,true);
%>  </td>
  <td align="right"> ������־ </td>
  <td><%
	cf.radioToken(out, "N+δ����&Y+����",spbz,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> ��ע </td>
  <td colspan="3"><%=bz%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">���Чʱ��</td>
  </tr>
<%
	String kssj=null;
	String cxjssj=null;
	String qdjssj=null;
	int row=0;
	ls_sql="SELECT kssj,cxjssj,qdjssj";
	ls_sql+=" FROM jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		qdjssj=cf.fillNull(rs.getDate("qdjssj"));

		row++;

		%>
		<tr bgcolor="#FFFFFF">
		  <td colspan="2" align="center"><strong>ʱ��Σ�<%=row%></strong></td>
		  <td align="right">��ʼʱ��(>=)</td>
		  <td><%=kssj%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">��������ʱ��(<=)</td>
		  <td><%=cxjssj%></td>
		  <td align="right">ǩ������ʱ��(<=)</td>
		  <td><%=qdjssj%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>

<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">��ۿ�</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ۿ�����</td>
  <td><%
	cf.radioToken(out, "4+���ۿ�&1+ǩԼ��ֱ�Ӵ���&2+ǩԼ����ۣ�����ʱ����",zklx,true);
%></td>
  <td align="right">�Ƿ�����˫�ش���</td>
  <td><%
	cf.radioToken(out, "1+��������ۿ��ۼ�&2+�������������&9+������",yxscdz,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���̷��ۿ�</td>
  <td width="32%"> 
    <%=gcfzk%>  </td>
  <td align="right" width="18%">���������ۿ�</td>
  <td width="32%"> 
    <%=gczxzk%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    ������ۿ�  </td>
  <td width="32%"> 
    <%=glfzk%>  </td>
  <td align="right" width="18%">˰���ۿ�</td>
  <td width="32%"><%=sjzk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ��ۿ�</td>
  <td><%=sjfzk%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>�ǻ���ۿ�</p></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���̷Ѿ��ۿ�</td>
  <td colspan="3"><%=gcfjzk%><strong>��&gt;0��&lt;=10��</strong> �ͻ���Ҫ�����������Ŀ�����ù��̷Ѵ���</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ȫ�����ۿ�</td>
  <td colspan="3"><%=jzk%><strong>��&gt;0��&lt;=10��</strong> �ͻ���Ҫ�����������Ŀ������ȫ������</td>
  </tr>
</table>
<P>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td colspan="3" align="center">���ֱ�����Ŀ�ۿ�</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="38%"><strong>��Ŀ����</strong></td>
  <td width="24%"><strong>�ۿ�</strong></td>
  </tr>
<%
	String xmflmc=null;
	double zk=0;
	ls_sql="SELECT xmflmc,zk";
	ls_sql+=" FROM jc_hdbfxmdz,bdm_xmflbm  ";
	ls_sql+=" where jc_hdbfxmdz.xmflbm=bdm_xmflbm.xmflbm and cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  jc_hdbfxmdz.xmflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflmc=cf.fillNull(rs.getString("xmflmc"));
		zk=rs.getDouble("zk");

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=xmflmc%></td>
		  <td><%=zk%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<P>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="7" align="center" bgcolor="#FFFFCC">��ѡ������Ϣ</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="31%"><strong>������Ŀ</strong></td>
  <td width="7%"><strong>������λ</strong></td>
  <td width="9%"><strong>�ɱ�����</strong></td>
  <td width="9%"><strong>�г�����</strong></td>
  <td width="9%"><strong>������������</strong></td>
  <td width="9%"><strong>������������</strong></td>
  <td width="26%"><strong>��ע</strong></td>
  </tr>
<%
	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String getbz=null;
	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz ";
	ls_sql+=" FROM jc_hdzsxx";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslxx=rs.getString("zsslxx");
		zsslsx=rs.getString("zsslsx");
		getbz=cf.fillHtml(rs.getString("bz"));

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=zsxm%></td>
		  <td><%=jldw%></td>
		  <td><%=cbdj%></td>
		  <td><%=scdj%></td>
		  <td><%=zsslxx%></td>
		  <td><%=zsslsx%></td>
		  <td align="left"><%=getbz%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="7" align="center" bgcolor="#FFFFCC">��ѡ������Ϣ</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="31%"><strong>������Ŀ</strong></td>
  <td width="7%"><strong>������λ</strong></td>
  <td width="9%"><strong>�ɱ�����</strong></td>
  <td width="9%"><strong>�г�����</strong></td>
  <td width="9%"><strong>������������</strong></td>
  <td width="9%"><strong>������������</strong></td>
  <td width="26%"><strong>��ע</strong></td>
  </tr>
<%
	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz ";
	ls_sql+=" FROM jc_hddxzsxx";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslxx=rs.getString("zsslxx");
		zsslsx=rs.getString("zsslsx");
		getbz=cf.fillHtml(rs.getString("bz"));

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=zsxm%></td>
		  <td><%=jldw%></td>
		  <td><%=cbdj%></td>
		  <td><%=scdj%></td>
		  <td><%=zsslxx%></td>
		  <td><%=zsslsx%></td>
		  <td align="left"><%=getbz%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>

<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="7" align="center" bgcolor="#FFFFCC">��������ʹ���ȯ</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="40%"><strong>����ȯ���ͷ�ʽ</strong></td>
  <td width="30%"><strong>���͹̶����</strong></td>
  <td width="30%"><strong>���Ͱٷֱ�</strong></td>
  </tr>
<%
	String djjzsfs=null;
	double zsgdje=0;
	double zsbfb=0;
	ls_sql="SELECT DECODE(djjzsfs,'1','�̶����','2','���̷Ѱٷֱ�','3','�����ٷֱ�') djjzsfs,zsgdje,zsbfb ";
	ls_sql+=" FROM jc_hddjj";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsgdje=rs.getDouble("zsgdje");
		zsbfb=rs.getDouble("zsbfb");

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=djjzsfs%></td>
		  <td><%=zsgdje%></td>
		  <td><%=zsbfb%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
