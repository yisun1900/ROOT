<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%

String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String fssj=null;
String khxm=null;
double jzjje=0;
double zhguanlif=0;
double zjxsuijin=0;
double kglf=0;
double zjxrzf=0;
double zjxdjjje=0;
double kqtk=0;


int row=0;

String xmmc=null;
String bgxm=null;
String jldw=null;
double dj=0;
double sl=0;
double je=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_zjxdj.zjxxh,crm_zjxdj.khbh,crm_zjxdj.fssj,crm_khxx.khxm,jzjje,crm_zjxdj.zhguanlif,crm_zjxdj.zjxsuijin,crm_zjxdj.kglf,zjxrzf,zjxdjjje,crm_zjxdj.kqtk ";
	ls_sql+=" from  crm_zjxdj,crm_khxx";
	ls_sql+=" where crm_zjxdj.khbh=crm_khxx.khbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fssj=cf.fillNull(rs.getDate("fssj"));
		khxm=cf.fillNull(rs.getString("khxm"));
		jzjje=rs.getDouble("jzjje");
		zhguanlif=rs.getDouble("zhguanlif");
		zjxsuijin=rs.getDouble("zjxsuijin");
		kglf=rs.getDouble("kglf");
		zjxrzf=rs.getDouble("zjxrzf");
		zjxdjjje=rs.getDouble("zjxdjjje");
		kqtk=rs.getDouble("kqtk");

	}
	else{
		rs.close();
		ps.close();

		return;
	}
%>
<html>
<head>
<title>ʩ��Ǣ�̱����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>

<body bgcolor="#FFFFFF">
<div align="center">
<p><b>
<font size="5">ʩ&nbsp;��&nbsp;Ǣ&nbsp;��&nbsp;��&nbsp;��&nbsp;�����г���֤�����������</font>
</b></p>
</div>

<table width="100%" height="72" border="0">
  <tr>
    <td width="50%">�ͻ����׷�����<%=khxm%></td>
    <td width="50%">����ǰ&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������&nbsp;��</td>
  </tr>
  <tr>
    <td>�������������ϼƽ�<%=cf.formatDouble(jzjje+zhguanlif+zjxsuijin+kglf+zjxrzf+zjxdjjje-kqtk)%>Ԫ</td>
    <td>������ڣ�<%=fssj%></td>
  </tr>
</table>
<p>�������</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">�ϼ�</td>
   </tr>
<%

try {
	conn=cf.getConnection();

	String lx=null;
	String lxmc=null;

	double allje=0;
	double xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','����','2','����') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='1'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<tr bgcolor="#FFFFF"  align="left"> 
	  <td colspan="4">����ϼƽ�<%=cf.formatDouble(xj)%>Ԫ</td>
	</tr>
  <p>���̼��</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">�ϼ�</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','����','2','����') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<tr bgcolor="#FFFFF"  align="left"> 
	  <td colspan="4">����ϼƽ�<%=cf.formatDouble(xj)%>Ԫ</td>
	</tr>
          
<table width="100%" height="72" border="0">
  <tr>
    <td width="25%">������</td>
    <td width="25%">��װ���ʦ��</td>
    <td width="25%">��Ŀ�ܼң�</td>
    <td width="25%">�ͻ���</td>
  </tr>
  <tr>
    <td width="25%">���ڣ�</td>
    <td width="25%">���ڣ�</td>
    <td width="25%">���ڣ�</td>
    <td width="25%">���ڣ�</td>
  </tr>
</table>


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>��·������Ŀ����������Ԥ�յ�·��<%=%>Ԫ��</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">�ϼ�</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','����','2','����') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
          <p>��·����ϼƼ�ȥԤ�յ�·��<%=%>Ԫ</p>
          <hr>
<p>ˮ·������Ŀ����������Ԥ��ˮ·��<%=%>Ԫ��</p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="50%">��Ŀ����</td>
    <td  width="10%">��λ</td>
	<td  width="10%">����</td>
    <td  width="10%">����</td>
    <td  width="20%">�ϼ�</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','����','2','����') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		  <td><%=je%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
          <p>ˮ·����ϼƼ�ȥԤ��ˮ·��<%=%>Ԫ</p>
          <hr>
          <p>����������ã�<%=%></p>
<table width="100%" border="1" cellpadding="1" cellspacing="0"  bgcolor="#000000" style='FONT-SIZE: 14px'>
<tr bgcolor="#FFFFFF"  align="center"> 
    <td  width="25%">��Ŀ</td>
    <td  width="10%">����</td>
	<td  width="55%">���㷽��</td>
    <td  width="10%">�ϼƽ��</td>
  </tr>
<%
	xj=0;

	ls_sql="select xmmc,jldw,dj,sl,je,lx,DECODE(lx,'1','����','2','����') lxmc";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmmc=cf.fillHtml(rs.getString("xmmc"));
		jldw=cf.fillHtml(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><%=bgxm%></td>
          <td><%=jldw%></td>
          <td><%=sl%></td>
		  <td><%=dj%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<table width="100%" height="72" border="0">
            <tr>
              <td width="25%">������</td>
              <td width="25%">��װ���ʦ��</td>
              <td width="25%">��Ŀ�ܼң�</td>
              <td width="25%">�ͻ���</td>
            </tr>
            <tr>
              <td width="25%">���ڣ�</td>
              <td width="25%">���ڣ�</td>
              <td width="25%">���ڣ�</td>
              <td width="25%">���ڣ�</td>
            </tr>
</table>
<p>��ע��</p>
<p>&nbsp;</p>
<p>����ǰ����ҵ�񲿼���ȷ�ϣ�</p>
<p>&nbsp;</p>
<p>������ֹ�˾����һ������ȷ�ϣ�</p>
<p>&nbsp;</p>

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