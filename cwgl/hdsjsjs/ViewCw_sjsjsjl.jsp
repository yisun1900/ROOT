<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

int row=0;
int xh=0;
String dwmc=null;
String sjfw=null;
String sjfw2=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,sjfw,sjfw2";
	ls_sql+=" from  cw_sjsjsjl,sq_dwxx";
	ls_sql+=" where cw_sjsjsjl.sjsbh=sq_dwxx.dwbh(+) and jsjlh='"+jsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=rs.getString("dwmc");
		sjfw=cf.fillNull(rs.getDate("sjfw"));
		sjfw2=cf.fillNull(rs.getDate("sjfw2"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<div align="center"><b>��<%=dwmc%>�������嵥��<%=sjfw%>--><%=sjfw2%>��</b> </div>
<br><b>ǩ����ϸ:</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">���</td>
      <td  width="8%">��ͬ��</td>
       <td  width="6%">���ʦ</td>
     <td  width="22%">���ݵ�ַ</td>
      <td  width="8%"><b><font color="#0000CC">Ԥ����</font></b></td>
      <td  width="6%"><b>���</b></td>
      <td  width="8%"><b>�ɽṤ��</b></td>
      <td  width="61%"><b>��ע</b></td>
    </tr>
    <%

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String sgdmc=null;
	String qyrq=null;
	String ysgcjdmc=null;

	double sjfksbl=0;
	double qye=0;
	double khjsje=0;
	double qdsyjsje=0;
	double qdtcbl=0;
	double qdtcje=0;
	double wgtcbl=0;
	double wgtcje=0;
	double kjgz=0;
	String bz=null;

	double xjqye=0;
	double xjkhjsje=0;
	double xjqdsyjsje=0;
	double xjqdtcje=0;
	double xjwgtcje=0;
	double xjkjgz=0;
	double zjwgtcje=0;

	xh=0;
	xjkhjsje=0;
	xjqdsyjsje=0;
	xjqye=0;
	xjwgtcje=0;
	xjkjgz=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='1' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillHtml(rs.getString("bz"));

		xjqye+=qye;
		xjqdtcje+=qdtcje;
		zjwgtcje+=qdtcje;

		row++;
		xh++;

		%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td><%=xh%></td>
      <td><%=hth%></td>
	  <td><%=sjs%></td>
      <td align="left"><%=fwdz%></td>
      <td><%=qye%></td>
      <td><%=qdtcbl%>%</td>
      <td><%=qdtcje%></td>
      <td align="left"><%=bz%></td>
    </tr>
    <%

	}
	rs.close();
	ps.close();

%> 
    <tr bgcolor="#FFFFFF"  align="center"> 
      <td colspan="3">�� ��</td>
      <td>&nbsp;</td>
      <td><%=cf.formatDouble(xjqye)%></td>
      <td>&nbsp;</td>
      <td><%=cf.formatDouble(xjqdtcje)%></td>
      <td>&nbsp;</td>
    </tr>
  </table>

    <b>������ϸ:</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">���</td>
      <td  width="8%">��ͬ��</td>
      <td  width="6%">���ʦ</td>
      <td  width="22%">���ݵ�ַ</td>
      <td  width="8%"><b><font color="#0000CC">������</font></b></td>
      <td  width="6%"><b>���</b></td>
       <td  width="8%"><b><font color="#0000CC">�ɽṤ��</font></b></td>
     <td  width="8%"><b><font color="#0000CC">�ѽṤ��</font></b></td>
      <td  width="8%"><b>ʵ�칤��</b></td>
      <td  width="21%"><b>��ע</b></td>
    </tr>
	<%

	xh=0;
	xjwgtcje=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,crm_khxx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='2' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillHtml(rs.getString("bz"));


		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td  align="left"><%=fwdz%></td>
		  <td><%=khjsje%></td>
		  <td><%=wgtcbl%>%</td>
		  <td><%=cf.formatDouble(khjsje*wgtcbl/100)%></td>
		  <td><%=qdtcje%></td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">�� ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
  </table>

<b>��ƿͻ���һ�������ϸ����Ʒ��ѽ�50������δ������Ʒ���ɵĿͻ���</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">���</td>
      <td  width="8%">��ͬ��</td>
      <td  width="6%">���ʦ</td>
      <td  width="22%">���ݵ�ַ</td>
      <td  width="8%"><b><font color="#0000CC">ǩԼ��Ʒ�</font></b></td>
      <td  width="8%"><b>��Ӷ�����</b></td>
      <td  width="8%"><b>��Ч��ͼ����</b></td>
      <td  width="8%"><b>�������ۿ�</b></td>
      <td  width="5%"><b>���</b></td>
      <td  width="8%"><b>�ɽṤ��</b></td>
      <td  width="18%"><b>��ע</b></td>
    </tr>
	<%

	//��ƿͻ�
	xjqdtcje=0;

	double kyjfy=0;
	double kxgtfy=0;
	double kqtfy=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='3' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		kyjfy=rs.getDouble("kyjfy");
		kxgtfy=rs.getDouble("kxgtfy");
		kqtfy=rs.getDouble("kqtfy");

		xjqdtcje+=qdtcje;

		zjwgtcje+=qdtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=qye%></td>
		  <td><%=kyjfy%></td>
		  <td><%=kxgtfy%></td>
		  <td><%=kqtfy%></td>

		  <td><%=qdtcbl%>%</td>
		  <td><%=qdtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">�� ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjqdtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>

<b>��ƿͻ��ڶ��������ϸ������ʱ����ǩ�����ѽ�ȫ���δ�������ʦ��ɵĿͻ���</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">���</td>
      <td  width="7%">��ͬ��</td>
      <td  width="6%">���ʦ</td>
      <td  width="18%">���ݵ�ַ</td>
      <td  width="8%"><b><font color="#0000CC">ʵ����Ʒ�</font></b></td>
      <td  width="7%"><b>��Ӷ�����</b></td>
      <td  width="7%"><b>��Ч��ͼ����</b></td>
      <td  width="7%"><b>�������ۿ�</b></td>
      <td  width="5%"><b>���</b></td>
     <td  width="8%"><b><font color="#0000CC">�ѽṤ��</font></b></td>
      <td  width="8%"><b>�ɽṤ��</b></td>
      <td  width="18%"><b>��ע</b></td>
    </tr>
	<%

	//��ƿͻ�
	xjwgtcje=0;

	kyjfy=0;
	kxgtfy=0;
	kqtfy=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='4' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));

		kyjfy=rs.getDouble("kyjfy");
		kxgtfy=rs.getDouble("kxgtfy");
		kqtfy=rs.getDouble("kqtfy");

		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=khjsje%></td>
		  <td><%=kyjfy%></td>
		  <td><%=kxgtfy%></td>
		  <td><%=kqtfy%></td>

		  <td><%=wgtcbl%>%</td>
		  <td><%=qdtcje%>%</td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">�� ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>


<b>ǩ���ͻ��˵����˵�δ����Ŀͻ���</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">���</td>
      <td  width="8%">��ͬ��</td>
      <td  width="6%">���ʦ</td>
      <td  width="22%">���ݵ�ַ</td>
      <td  width="6%"><b><font color="#0000CC">ǩ����ɽ��</font></b></td>
      <td  width="6%"><b><font color="#0000CC">�깤��ɽ��</font></b></td>
      <td  width="8%"><b>�ɽṤ��</b></td>
      <td  width="18%"><b>��ע</b></td>
    </tr>
	<%

	//��ƿͻ�
	xjwgtcje=0;
	double qdwgtcje=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.qdsyjsje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy,crm_khxx.wgtcje qdwgtcje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='5' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		qdsyjsje=rs.getDouble("qdsyjsje");
		qdwgtcje=rs.getDouble("qdwgtcje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));


		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=qdsyjsje%></td>
		  <td><%=qdwgtcje%></td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">�� ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>



<b>��Ʒ��˵����˵�δ����Ŀͻ���</b>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="4%">���</td>
      <td  width="8%">��ͬ��</td>
      <td  width="6%">���ʦ</td>
      <td  width="22%">���ݵ�ַ</td>
      <td  width="6%"><b><font color="#0000CC">��Ʒ��״���ɽ��</font></b></td>
      <td  width="6%"><b><font color="#0000CC">��ƷѶ�����ɽ��</font></b></td>
      <td  width="8%"><b>�ɽṤ��</b></td>
      <td  width="18%"><b>��ע</b></td>
    </tr>
	<%

	//��ƿͻ�
	xjwgtcje=0;
	double sjfsctcje=0;
	double sjfectcje=0;

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc,crm_khxx.qyrq,ysgcjdmc,crm_khxx.sjfsctcje";
	ls_sql+=" ,cw_sjsjsmx.kyjfy,cw_sjsjsmx.kxgtfy,cw_sjsjsmx.kqtfy,crm_khxx.sjfectcje";
	ls_sql+=" ,cw_sjsjsmx.sjfksbl,cw_sjsjsmx.qye,cw_sjsjsmx.khjsje,cw_sjsjsmx.qdtcbl,cw_sjsjsmx.qdtcje,cw_sjsjsmx.wgtcbl,cw_sjsjsmx.wgtcje,cw_sjsjsmx.bz";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,cw_sjsjsmx";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and cw_sjsjsmx.jsjlh='"+jsjlh+"' and cw_sjsjsmx.lx='6' ";
    ls_sql+=" and cw_sjsjsmx.khbh=crm_khxx.khbh";
    ls_sql+=" order by qyrq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
		sjfsctcje=rs.getDouble("sjfsctcje");
		sjfectcje=rs.getDouble("sjfectcje");

		sjfksbl=rs.getDouble("sjfksbl");
		qye=rs.getDouble("qye");
		khjsje=rs.getDouble("khjsje");
		qdtcbl=rs.getDouble("qdtcbl");
		qdtcje=rs.getDouble("qdtcje");
		wgtcbl=rs.getDouble("wgtcbl");
		wgtcje=rs.getDouble("wgtcje");
		bz=cf.fillNull(rs.getString("bz"));


		xjwgtcje+=wgtcje;

		zjwgtcje+=wgtcje;

		row++;
		xh++;

		%> 
		<tr bgcolor="#FFFFFF"  align="center"> 
		  <td><%=xh%></td>
		  <td><%=hth%></td>
		  <td><%=sjs%></td>
		  <td align="left"><%=fwdz%></td>
		  <td><%=sjfsctcje%></td>
		  <td><%=sjfectcje%></td>
		  <td><%=wgtcje%></td>
		  <td align="left"><%=bz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%> 
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">�� ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(xjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFFF"  align="center"> 
	  <td colspan="3">�� ��</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=cf.formatDouble(zjwgtcje)%></td>
	  <td>&nbsp;</td>
	</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function f_do(formName)
{
	formName.action="SaveEditCw_sjsjsjl.jsp";
	formName.submit();
	return true;
} 

function f_delete(formName,khbh,lx)
{
	if ( confirm("ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		formName.action="DeleteCw_sjsjsmx.jsp?khbh="+khbh+"&lx="+lx;
		formName.submit();
		return true;
	}
} 

function f_qdjs(FormName,xh)
{
	var kjgz=0;//�ɽṤ��=Ԥ����*���/100
	kjgz=FormName.qye[xh].value*FormName.td[xh].value/100.0;
	kjgz=round(kjgz,2);
	FormName.kjgz[xh].value=kjgz;
} 

function f_wgjs(FormName,xh)
{
	var kjgz=0;//�ɽṤ��=������*���/100
	kjgz=FormName.khjsje[xh].value*FormName.td[xh].value/100.0;
	kjgz=round(kjgz,2);
	FormName.kjgz[xh].value=kjgz;

	var wgtcje=0;//ʵ�칤��=Ԥ����*���/100
	wgtcje=FormName.kjgz[xh].value*1.0-FormName.qdsyjsje[xh].value*1.0;
	wgtcje=round(wgtcje,2);
	FormName.wgtcje[xh].value=wgtcje;
} 



//-->
</script>

