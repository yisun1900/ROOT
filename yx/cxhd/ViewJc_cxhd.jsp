<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwmc=null;

String cxhdmc=null;
String fgsbh=null;
int dj=0;
double fxgck=0;
double fxzck=0;

double zdzk=0;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double qtsfxmzk=0;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

String zjxzklx=null;
String sfybfxmzk=null;

String hdlx=null;
String kgxqthd=null;
String zklx="";
String bz=null;
String fjmc=null;
String jsbz=null;
String spbz=null;


String yxbffydz="";//�Ƿ������ַ��ô���  1������9��������

double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;

double gczjxfzk=10;
double glfzjxzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;
double qtsfxmzjxzk=10;


String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh,dj,fxgck,fxzck,zdzk,gcfzk,glfzk,hdlx,kgxqthd,zklx,bz,sjzk,sjfzk,qtsfxmzk";
	ls_sql+=" ,zjxzklx,sfybfxmzk,fjmc,DECODE(jsbz,'N','δ����','Y','����' ) jsbz,DECODE(spbz,'N','δ����','Y','����') spbz";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsbz=cf.fillNull(rs.getString("jsbz"));
		spbz=cf.fillNull(rs.getString("spbz"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		sfybfxmzk=cf.fillNull(rs.getString("sfybfxmzk"));

		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dj=rs.getInt("dj");
		fxgck=rs.getDouble("fxgck");
		fxzck=rs.getDouble("fxzck");
		zdzk=rs.getDouble("zdzk");
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		hdlx=cf.fillNull(rs.getString("hdlx"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
		zklx=cf.fillNull(rs.getString("zklx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk ";
	ls_sql+=" from  jc_cxhdbffyzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
	ls_sql+=" from  jc_cxhdtczk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");
	}
	rs.close();
	ps.close();

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
	ls_sql+=" from  jc_cxhdzjxzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
		qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx  ";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
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
  <td width="32%"><%=dwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���������</td>
  <td><%=cxhdmc%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����</td>
  <td><%
	cf.radioToken(out, "1+�޻&2+��˾�&3+С���&4+չ��",hdlx,true);
%></td>
  <td align="right">�Ƿ�ɹ��������</td>
  <td><%
	cf.radioToken(out, "1+���ɹ���&2+�ɹ���",kgxqthd,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><%=dj%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�౶���ֹ��̿�</td>
  <td><%=fxgck%>������</td>
  <td align="right">�౶�������Ŀ�</td>
    <td><%=fxzck%>������</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td colspan="3"><A HREF="/yx/cxhd/file/<%=fjmc%>" target="_blank">����鿴��<%=fjmc%></A></td>
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
</table>




<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">��ۿ�</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right">�ۿ�����</td>
  <td width="32%"><%
	cf.radioToken(out, "4+���ۿ�&1+��������&2+�������&3+���ַ��ô���",zklx,true);
%></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ۿ�</td>
  <td><%=zdzk%></td><td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>���̷Ѳ��ִ���</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right">���̣����ķ��ۿ�</td>
  <td width="32%"><%=clfzk%></td>
  <td width="18%" align="right">���̣����ķ��ۿ�</td>
    <td width="32%"><%=zcfzk%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">���̣��˹����ۿ�</td>
  <td><%=rgfzk%></td>
  <td align="right">���̣�������ۿ�</td>
    <td><%=ysfzk%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">���̣���е���ۿ�</td>
  <td><%=jxfzk%></td>
  <td align="right">���̣���ķ��ۿ�</td>
    <td><%=shfzk%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">���̣��������ۿ�</td>
  <td><%=qtfzk%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >
<tr bgcolor="#FFFFCC">
  <td align="right">�������ۿ�����</td>
  <td>
	
<%
	cf.radioToken(out, "1+ͬ��ͬ&2+�����ۿ�",zjxzklx,true);
%></td>
  <td align="right">�Ƿ��в�����Ŀ����</td>
  <td>
<%
	cf.radioToken(out, "Y+��&N+��",sfybfxmzk,true);
%>

</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���̷��ۿ�</td>
  <td width="32%"> 
    <%=gcfzk%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
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
  <td align="right">�����շ���Ŀ�ۿ�</td>
  <td><%=qtsfxmzk%></td></tr>
</table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">�ײͱ�׼�۸��ۿ�</td>
      <td width="32%"><%=bzjgzk%></td>
      <td width="18%" align="right">������ӽ���ۿ�</td>
      <td width="32%"><%=mjzjzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">������������ۿ�</td>
      <td><%=zcsjzk%></td>
      <td align="right">���ĳ����Ӽ��ۿ�</td>
      <td><%=zcclzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���շ������ۿ�</td>
      <td><%=zcsfzk%></td>
      <td align="right">���ļ����ۿ�</td>
      <td><%=zcjmzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">���������ۿ�</td>
      <td><%=ddzccjzk%></td>
      <td align="right">ѡ�������ۿ�</td>
      <td><%=ddzcclzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ײ���ʩ�����ۿ�</td>
      <td><%=tcwgczk%></td>
      <td align="right">���̳����Ӽ��ۿ�</td>
      <td><%=tcgcclzk%></td>
    </tr>
  </table>
<P>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">�����������ۿ�</td>
      <td width="32%"><%=gczjxfzk%></td>
      <td width="18%" align="right">������������ۿ�</td>
      <td width="32%"><%=glfzjxzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">˰���������ۿ�</td>
      <td><%=sjzjxzk%></td>
      <td align="right">��Ʒ��������ۿ�</td>
      <td><%=sjfzjxzk%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ�������ۿ�</td>
      <td><%=qtsfxmzjxzk%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td colspan="3" align="center">���ֱ�����Ŀ�ۿ�</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="38%"><strong>��Ŀ����</strong></td>
  <td width="24%"><strong>�ۿ�</strong></td>
  </tr>
<%
	int row=0;
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
<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">���Чʱ��</td>
  </tr>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><strong>ʱ���</strong></td>
		  <td>��ʼʱ��(>=)</td>
		  <td>��������ʱ��(<=)</td>
		  <td>ǩ������ʱ��(<=)</td>
  </tr>
<%
	String kssj=null;
	String cxjssj=null;
	String qdjssj=null;
	row=0;
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
		<tr align="center" bgcolor="#FFFFFF">
		  <td width="10%"><strong><%=row%></strong></td>
		  <td width="30%"><%=kssj%></td>
		  <td width="30%"><%=cxjssj%></td>
		  <td width="30%"><%=qdjssj%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
</table>


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
	String zsjs=null;
	double zsgdje=0;
	double zsbfb=0;
	ls_sql="SELECT DECODE(djjzsfs,'1','�̶����','2','���̷Ѱٷֱ�','3','�����ٷֱ�') djjzsfs,DECODE(zsjs,'1','�̶����','2','���̷Ѱٷֱ�','3','�����ٷֱ�') zsjs";
	ls_sql+=" FROM jc_hddjj";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=djjzsfs%></td>
		  <td><%=zsjs%></td>
		  <td><%=zsbfb%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>


<P>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">ҵ��ϵ������</td>
	<td  width="25%">ҵ��ϵ������</td>
	<td  width="25%">ҵ��ϵ��</td>
</tr>
<%
	String yjxsbm=null;
	String yjxsmc=null;
	String yjxsstr=null;
	double yjxs=0;

	ls_sql="SELECT yjxsbm,yjxsmc";
	ls_sql+=" FROM jc_cxhdyjxsbm  ";
	ls_sql+=" order by  yjxsbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yjxsbm=cf.fillNull(rs.getString("yjxsbm"));
		yjxsmc=cf.fillNull(rs.getString("yjxsmc"));

		yjxs=0;
		ls_sql="SELECT yjxs";
		ls_sql+=" FROM jc_cxhdyjxs";
		ls_sql+=" where jc_cxhdyjxs.cxhdbm='"+cxhdbm+"' and yjxsbm='"+yjxsbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yjxs=rs1.getDouble("yjxs");
		}
		rs1.close();
		ps1.close();

		if (yjxs==0)
		{
			yjxsstr="&nbsp;";
		}
		else{
			yjxsstr=""+yjxs;
		}


		%>
		<tr align="center">
			<td><%=yjxsbm%>
			</td>
			<td><%=yjxsmc%></td>
			<td><%=yjxsstr%>
			</td>
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
