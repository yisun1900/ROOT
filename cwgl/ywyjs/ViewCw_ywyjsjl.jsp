<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%

String cw_ywyjsjl_jsjlh=null;
String cw_ywyjsjl_fgsbh=null;
String cw_ywyjsjl_dwbh=null;
String cw_ywyjsjl_sjsbh=null;
String ywy=null;
String cw_ywyjsjl_sjfw=null;
String cw_ywyjsjl_sjfw2=null;
String tcze=null;
String cw_ywyjsjl_lrr=null;
String cw_ywyjsjl_lrsj=null;
String sq_dwxx_dwmc=null;
String cw_ywyjsjl_spbz=null;
String cw_ywyjsjl_spyj=null;
String cw_ywyjsjl_spr=null;
String cw_ywyjsjl_spsj=null;
String cw_ywyjsjl_bz=null;
String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_ywyjsjl.jsjlh,cw_ywyjsjl.fgsbh,cw_ywyjsjl.dwbh,cw_ywyjsjl.sjsbh,ywy,cw_ywyjsjl.sjfw,cw_ywyjsjl.sjfw2,cw_ywyjsjl.tcze,cw_ywyjsjl.lrr as cw_ywyjsjl_lrr,cw_ywyjsjl.lrsj as cw_ywyjsjl_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,cw_ywyjsjl.spbz as cw_ywyjsjl_spbz,cw_ywyjsjl.spyj as cw_ywyjsjl_spyj,cw_ywyjsjl.spr as cw_ywyjsjl_spr,cw_ywyjsjl.spsj as cw_ywyjsjl_spsj,cw_ywyjsjl.bz as cw_ywyjsjl_bz ";
	ls_sql+=" from  cw_ywyjsjl,sq_dwxx";
	ls_sql+=" where cw_ywyjsjl.lrbm=sq_dwxx.dwbh and  (cw_ywyjsjl.jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_ywyjsjl_jsjlh=cf.fillNull(rs.getString("jsjlh"));
		cw_ywyjsjl_fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cw_ywyjsjl_dwbh=cf.fillNull(rs.getString("dwbh"));
		cw_ywyjsjl_sjsbh=cf.fillNull(rs.getString("sjsbh"));
		ywy=cf.fillNull(rs.getString("ywy"));
		cw_ywyjsjl_sjfw=cf.fillNull(rs.getDate("sjfw"));
		cw_ywyjsjl_sjfw2=cf.fillNull(rs.getDate("sjfw2"));
		tcze=cf.fillNull(rs.getString("tcze"));
		cw_ywyjsjl_lrr=cf.fillNull(rs.getString("cw_ywyjsjl_lrr"));
		cw_ywyjsjl_lrsj=cf.fillNull(rs.getDate("cw_ywyjsjl_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		cw_ywyjsjl_spbz=cf.fillNull(rs.getString("cw_ywyjsjl_spbz"));
		cw_ywyjsjl_spyj=cf.fillNull(rs.getString("cw_ywyjsjl_spyj"));
		cw_ywyjsjl_spr=cf.fillNull(rs.getString("cw_ywyjsjl_spr"));
		cw_ywyjsjl_spsj=cf.fillNull(rs.getDate("cw_ywyjsjl_spsj"));
		cw_ywyjsjl_bz=cf.fillNull(rs.getString("cw_ywyjsjl_bz"));
	}
	rs.close();
	ps.close();
%>


<div align="center">ҵ��Ա�����¼</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> �����¼��</td>
    <td width="32%"> <%=cw_ywyjsjl_jsjlh%> </td>
    <td align="right" width="18%">&nbsp; </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">�ֹ�˾</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_ywyjsjl_fgsbh+"'",cw_ywyjsjl_fgsbh,true);
%> </td>
    <td align="right" width="18%"> ҵ��Ա</td>
    <td width="32%"> <%=ywy%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">ʱ�䷶Χ��</td>
    <td width="32%"><%=cw_ywyjsjl_sjfw%> </td>
    <td align="right" width="18%">ʱ�䷶Χ��</td>
    <td width="32%"><%=cw_ywyjsjl_sjfw2%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="2" align="right" bgcolor="#FFCCFF">����ܶ�</td>
    <td colspan="3" bgcolor="#FFCCFF" height="2"><%=tcze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ¼����</td>
    <td width="32%"> <%=cw_ywyjsjl_lrr%> </td>
    <td align="right" width="18%"> ¼��ʱ��</td>
    <td width="32%"> <%=cw_ywyjsjl_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ¼�벿��</td>
    <td width="32%"> <%=sq_dwxx_dwmc%> </td>
    <td align="right" width="18%"> ����״̬</td>
    <td width="32%"> <%
	cf.selectToken(out,"1+��ʼ����&2+�������&3+����ͨ��&4+����δͨ��",cw_ywyjsjl_spbz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">����ʱ��</td>
    <td width="32%"><%=cw_ywyjsjl_spsj%></td>
    <td align="right" width="18%"> ������</td>
    <td width="32%"> <%=cw_ywyjsjl_spr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�������</td>
    <td colspan="3"><%=cw_ywyjsjl_spyj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">��ע </td>
    <td colspan="3"><%=cw_ywyjsjl_bz%></td>
  </tr>
</table>

<center>��ǩ�����㣭��������ϸ��</center>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="5%">ǩ������</td>
	<td  width="5%">�������</td>
	<td  width="6%">��ɻ���</td>
	<td  width="6%">����ɱ���</td>
	<td  width="7%">����ɽ��</td>
	<td  width="5%">��ɱ��� </td>
	<td  width="7%">��ɽ��</td>
	<td  width="6%">��������</td>
	<td  width="7%">ʵ�����</td>
	<td  width="22%">��ע</td>
</tr>
	<%
	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sgdmc=null;
	String zjxm=null;
	String qyrq=null;
	double qye=0;
	double sfke=0;
	String ysgcjdmc=null;
	String ywyjsbz=null;

	String qdlx=null;
	String tclx=null;
	double sjfksbl=0;
	double tcjs=0;
	double ytcbl=0;
	double ytcje=0;
	double bctcbl=0;
	double bctcje=0;
	double zjqtfy=0;
	double sjtcje=0;
	String tcbz=null;

	double alltcjs=0;
	double allytcje=0;
	double allbctcje=0;
	double allzjqtfy=0;
	double allsjtcje=0;

	String bgcolor="#E8E8FF";

	int row=0;
	int row1=0;

	ls_sql="SELECT cw_ywyjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(ywyjsbz,'0','δ����','1','ǩ������','2','�깤����') ywyjsbz";
	ls_sql+=" ,DECODE(cw_ywyjsmx.qdlx,'1','��װ','3','��װ') qdlx,DECODE(cw_ywyjsmx.tclx,'1','ǩ�����','2','�깤���','3','��ƿͻ�','4','�˵�') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_ywyjsmx.bz ";
	ls_sql+=" FROM cw_ywyjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_ywyjsmx.khbh=crm_khxx.khbh and cw_ywyjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_ywyjsmx.tclx='1'";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		ywyjsbz=rs.getString("ywyjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row++;
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="ViewCw_ywyjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">�ۿ�</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>

<center>���깤���㣭��������ϸ��</center>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="5%">ǩ������</td>
	<td  width="5%">�������</td>
	<td  width="6%">��ɻ���</td>
	<td  width="6%">����ɱ���</td>
	<td  width="7%">����ɽ��</td>
	<td  width="5%">��ɱ��� </td>
	<td  width="7%">��ɽ��</td>
	<td  width="6%">��������</td>
	<td  width="7%">ʵ�����</td>
	<td  width="22%">��ע</td>
</tr>
	<%

	alltcjs=0;
	allytcje=0;
	allbctcje=0;
	allzjqtfy=0;
	allsjtcje=0;

	ls_sql="SELECT cw_ywyjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(ywyjsbz,'0','δ����','1','ǩ������','2','�깤����') ywyjsbz";
	ls_sql+=" ,DECODE(cw_ywyjsmx.qdlx,'1','��װ','3','��װ') qdlx,DECODE(cw_ywyjsmx.tclx,'1','ǩ�����','2','�깤���','3','��ƿͻ�','4','�˵�') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_ywyjsmx.bz ";
	ls_sql+=" FROM cw_ywyjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_ywyjsmx.khbh=crm_khxx.khbh and cw_ywyjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_ywyjsmx.tclx='2'";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		ywyjsbz=rs.getString("ywyjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row1++;
		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="ViewCw_ywyjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">�ۿ�</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>


<center>���˵����㣭��������ϸ��</center>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="5%">ǩ������</td>
	<td  width="5%">�������</td>
	<td  width="6%">��ɻ���</td>
	<td  width="6%">����ɱ���</td>
	<td  width="7%">����ɽ��</td>
	<td  width="5%">��ɱ��� </td>
	<td  width="7%">��ɽ��</td>
	<td  width="6%">��������</td>
	<td  width="7%">ʵ�����</td>
	<td  width="22%">��ע</td>
</tr>
	<%

	alltcjs=0;
	allytcje=0;
	allbctcje=0;
	allzjqtfy=0;
	allsjtcje=0;

	ls_sql="SELECT cw_ywyjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(ywyjsbz,'0','δ����','1','ǩ������','2','�깤����') ywyjsbz";
	ls_sql+=" ,DECODE(cw_ywyjsmx.qdlx,'1','��װ','3','��װ') qdlx,DECODE(cw_ywyjsmx.tclx,'1','ǩ�����','2','�깤���','3','��ƿͻ�','4','�˵�') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_ywyjsmx.bz ";
	ls_sql+=" FROM cw_ywyjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_ywyjsmx.khbh=crm_khxx.khbh and cw_ywyjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_ywyjsmx.tclx='4'";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		ywyjsbz=rs.getString("ywyjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row1++;
		if (row1%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="ViewCw_ywyjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">�ۿ�</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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