<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%

String cw_sjsjsjl_jsjlh=null;
String cw_sjsjsjl_fgsbh=null;
String cw_sjsjsjl_dwbh=null;
String cw_sjsjsjl_sjsbh=null;
String sjs=null;
String cw_sjsjsjl_sjfw=null;
String cw_sjsjsjl_sjfw2=null;
String tcze=null;
String cw_sjsjsjl_lrr=null;
String cw_sjsjsjl_lrsj=null;
String sq_dwxx_dwmc=null;
String cw_sjsjsjl_spbz=null;
String cw_sjsjsjl_spyj=null;
String cw_sjsjsjl_spr=null;
String cw_sjsjsjl_spsj=null;
String cw_sjsjsjl_bz=null;
String jsjlh=null;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cw_sjsjsjl.jsjlh,cw_sjsjsjl.fgsbh,cw_sjsjsjl.dwbh,cw_sjsjsjl.sjsbh,sjs,cw_sjsjsjl.sjfw,cw_sjsjsjl.sjfw2,cw_sjsjsjl.tcze,cw_sjsjsjl.lrr as cw_sjsjsjl_lrr,cw_sjsjsjl.lrsj as cw_sjsjsjl_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,cw_sjsjsjl.spbz as cw_sjsjsjl_spbz,cw_sjsjsjl.spyj as cw_sjsjsjl_spyj,cw_sjsjsjl.spr as cw_sjsjsjl_spr,cw_sjsjsjl.spsj as cw_sjsjsjl_spsj,cw_sjsjsjl.bz as cw_sjsjsjl_bz ";
	ls_sql+=" from  cw_sjsjsjl,sq_dwxx";
	ls_sql+=" where cw_sjsjsjl.lrbm=sq_dwxx.dwbh and  (cw_sjsjsjl.jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cw_sjsjsjl_jsjlh=cf.fillNull(rs.getString("jsjlh"));
		cw_sjsjsjl_fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cw_sjsjsjl_dwbh=cf.fillNull(rs.getString("dwbh"));
		cw_sjsjsjl_sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cw_sjsjsjl_sjfw=cf.fillNull(rs.getDate("sjfw"));
		cw_sjsjsjl_sjfw2=cf.fillNull(rs.getDate("sjfw2"));
		tcze=cf.fillNull(rs.getString("tcze"));
		cw_sjsjsjl_lrr=cf.fillNull(rs.getString("cw_sjsjsjl_lrr"));
		cw_sjsjsjl_lrsj=cf.fillNull(rs.getDate("cw_sjsjsjl_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		cw_sjsjsjl_spbz=cf.fillNull(rs.getString("cw_sjsjsjl_spbz"));
		cw_sjsjsjl_spyj=cf.fillNull(rs.getString("cw_sjsjsjl_spyj"));
		cw_sjsjsjl_spr=cf.fillNull(rs.getString("cw_sjsjsjl_spr"));
		cw_sjsjsjl_spsj=cf.fillNull(rs.getDate("cw_sjsjsjl_spsj"));
		cw_sjsjsjl_bz=cf.fillNull(rs.getString("cw_sjsjsjl_bz"));
	}
	rs.close();
	ps.close();
%>


<div align="center">���ʦ�����¼</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> �����¼��</td>
    <td width="32%"> <%=cw_sjsjsjl_jsjlh%> </td>
    <td align="right" width="18%"> �ֹ�˾</td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sjsjsjl_fgsbh+"'",cw_sjsjsjl_fgsbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ����</td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+cw_sjsjsjl_dwbh+"'",cw_sjsjsjl_dwbh,true);
%> </td>
    <td align="right" width="18%"> ���ʦ</td>
    <td width="32%"> <%=sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">ʱ�䷶Χ��</td>
    <td width="32%"><%=cw_sjsjsjl_sjfw%> </td>
    <td align="right" width="18%">ʱ�䷶Χ��</td>
    <td width="32%"><%=cw_sjsjsjl_sjfw2%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="2" align="right" bgcolor="#FFCCFF">����ܶ�</td>
    <td colspan="3" bgcolor="#FFCCFF" height="2"><%=tcze%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ¼����</td>
    <td width="32%"> <%=cw_sjsjsjl_lrr%> </td>
    <td align="right" width="18%"> ¼��ʱ��</td>
    <td width="32%"> <%=cw_sjsjsjl_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> ¼�벿��</td>
    <td width="32%"> <%=sq_dwxx_dwmc%> </td>
    <td align="right" width="18%"> ����״̬</td>
    <td width="32%"> <%
	cf.selectToken(out,"1+��ʼ����&2+�������&3+����ͨ��&4+����δͨ��",cw_sjsjsjl_spbz,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">����ʱ��</td>
    <td width="32%"><%=cw_sjsjsjl_spsj%></td>
    <td align="right" width="18%"> ������</td>
    <td width="32%"> <%=cw_sjsjsjl_spr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">�������</td>
    <td colspan="3"><%=cw_sjsjsjl_spyj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">��ע </td>
    <td colspan="3"><%=cw_sjsjsjl_bz%></td>
  </tr>
</table>

<center>��ǩ�����㣭��������ϸ��</center>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="7%">ǩ������</td>
	<td  width="6%">�������</td>
	<td  width="6%">��ɻ���</td>
	<td  width="6%">����ɱ���</td>
	<td  width="6%">����ɽ��</td>
	<td  width="6%">��ɱ��� </td>
	<td  width="6%">��ɽ��</td>
	<td  width="6%">��������</td>
	<td  width="6%">ʵ�����</td>
	<td  width="21%">��ע</td>
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
	String sjsjsbz=null;

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

	ls_sql="SELECT cw_sjsjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(sjsjsbz,'0','δ����','1','ǩ������','2','�깤����') sjsjsbz";
	ls_sql+=" ,DECODE(cw_sjsjsmx.qdlx,'1','���г�����װ','2','�г�����װ','3','��װ') qdlx,DECODE(cw_sjsjsmx.tclx,'1','ǩ�����','2','�깤���','3','��ƿͻ�','4','�˵�') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_sjsjsmx.bz ";
	ls_sql+=" FROM cw_sjsjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_sjsjsmx.khbh=crm_khxx.khbh and cw_sjsjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_sjsjsmx.tclx='1'";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
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
		sjsjsbz=rs.getString("sjsjsbz");

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
			<td><A HREF="ViewCw_sjsjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">�ۿ�</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%></td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%></td>
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
	<td  width="7%">ǩ������</td>
	<td  width="6%">�������</td>
	<td  width="6%">��ɻ���</td>
	<td  width="6%">����ɱ���</td>
	<td  width="6%">����ɽ��</td>
	<td  width="6%">��ɱ��� </td>
	<td  width="6%">��ɽ��</td>
	<td  width="6%">��������</td>
	<td  width="6%">ʵ�����</td>
	<td  width="21%">��ע</td>
</tr>
	<%

	alltcjs=0;
	allytcje=0;
	allbctcje=0;
	allzjqtfy=0;
	allsjtcje=0;

	ls_sql="SELECT cw_sjsjsmx.khbh,hth,khxm,fwdz,sgdmc,zjxm,qyrq,qye,sfke,ysgcjdmc,DECODE(sjsjsbz,'0','δ����','1','ǩ������','2','�깤����') sjsjsbz";
	ls_sql+=" ,DECODE(cw_sjsjsmx.qdlx,'1','���г�����װ','2','�г�����װ','3','��װ') qdlx,DECODE(cw_sjsjsmx.tclx,'1','ǩ�����','2','�깤���','3','��ƿͻ�','4','�˵�') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_sjsjsmx.bz ";
	ls_sql+=" FROM cw_sjsjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_sjsjsmx.khbh=crm_khxx.khbh and cw_sjsjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and cw_sjsjsmx.tclx='2'";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
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
		sjsjsbz=rs.getString("sjsjsbz");

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
			<td><A HREF="ViewCw_sjsjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">�ۿ�</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%></td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%></td>
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