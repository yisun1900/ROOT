<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
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

String xh=null;
String xmbh=null;
String xmmc=null;

String jgwzbm=null;
String jgwzmc=null;
String oldjgwzmc="";
String jldwmc=null;
double dj=0;
double sl=0;
double qye=0;
String gycl=null;
double xjqye=0;
double xjsl=0;
double allqye=0;
double allsl=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String cxhdbm=null;

String sjsdh="";
String bzdh="&nbsp;";

try {
	conn=cf.getConnection();
	ls_sql="SELECT cxhdbm,sgd,sgbz,crm_khxx.dwbh,dwmc,khxm,lxfs,fwdz,hth,sjs,kgrq,jyjdrq,jgrq,qye,DECODE(bjjb,'A','��ͨ','B','��Ʒ','C','�ֻ�÷��') bjjb";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		cxhdbm=cf.fillHtml(rs.getString("cxhdbm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		dwbh=cf.fillHtml(rs.getString("dwbh"));
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		qye=rs.getDouble("qye");
		bjjb=cf.fillHtml(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillHtml(rs.getString("dh"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>

  <table width="100%" border="0" style='FONT-SIZE: 18px'>
    <tr> 
      <td width="35%"><span lang=EN-US><img src="../../images/tubiao111.jpg" v:shapes="_x0000_i1025"></span></td>
      <td width="65%"><b>ȫװ���ײͺ�ͬ�������ײ���������ϸ(<%=cf.today()%>)</b></td>
    </tr>
  </table>
  <table width="100%" border="0" style='FONT-SIZE: 15px'>
    <tr>
      <td width="63%">�������ࣺ
        <input type="checkbox" name="checkbox4" value="checkbox">
        ����
      </td>
      <td width="37%">&nbsp;</td>
    </tr>
  </table>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
  <tr> 
    <td width="12%" height="29" align="center"> 
      �ͻ�����    </td>
    <td width="22%" height="29"><%=khxm%></td>
    <td width="12%" height="29" align="center"> 
      ǩԼ����    </td>
    <td width="26%" height="29"><%=dwmc%></td>
    <td width="14%" height="29" align="center"> 
      �� ͬ ��    </td>
    <td width="14%" height="29"><%=hth%></td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      ��ϵ��ʽ    </td>
    <td width="22%"><%=lxfs%></td>
    <td width="12%" align="center"> 
      ��װ���ʦ    </td>
    <td width="26%" style='FONT-SIZE: 14px'><%=sjs%>��<%=sjsdh%>��</td>
    <td width="14%" align="center"> 
      ͬ��������    </td>
    <td width="14%"><%=kgrq%></td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      ʩ����ַ    </td>
    <td colspan="3"><%=fwdz%> </td>
    <td width="14%" align="center"> 
      ͬ�깤����    </td>
    <td width="14%"><%=jgrq%></td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      <div align="center" style='FONT-SIZE: 14px'>��װǩԼ��    </td>
    <td width="22%"><%=qye%>Ԫ</td>
    <td width="12%" align="center"> 
      �����    </td>
    <td width="26%"><%=cxhdbm%></td>
    <td width="14%" align="center"> 
      ����    </td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="12%" align="center"> 
      �ֳ��೤&nbsp;    </td>
    <td width="22%"><%=sgbz%></td>
    <td width="12%" align="center"> 
      ��ϵ�绰    </td>
    <td colspan="3"><%=bzdh%> </td>
  </tr>
  <tr height="29"> 
    <td colspan="2" align="center"> 
      �Ƿ��Ѷ���������ʽ��Ʒ    </td>
    <td colspan="2"> 
      <div align="left"> 
        <input type="checkbox" name="checkbox" value="checkbox">
        ���� 
        <input type="checkbox" name="checkbox2" value="checkbox">
        ľ�� 
        <input type="checkbox" name="checkbox3" value="checkbox">
        �Ҿ�
    </td>
    <td width="14%" align="center" > 
      <div align="center" style='FONT-SIZE: 13px'>ԭ�ɼҾ����ʦ    </td>
    <td width="14%">&nbsp;</td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 15px'>
  <tr height="39"> 
    <td colspan="9" align="center"> 
      <font size="4">�� �� �� �� �� ˵ ��</font>    </td>
  </tr>
  <tr align="center" height="29"> 
    <td width="15%"> 
      ��������    </td>
    <td width="12%"> 
      ��Ҫ��������    </td>
    <td width="10%"> 
      ���    </td>
    <td width="13%"> 
      Ʒ��/ɫ��    </td>
    <td width="8%">����</td>
    <td width="8%">����</td>
    <td width="9%">���</td>
    <td width="11%"> 
      <div align="center" style='FONT-SIZE: 14px'>�Ƿ�������    </td>
    <td width="14%"> 
      ����˵��    </td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr height="29"> 
    <td width="15%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
    <td width="10%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr align="center" height="29"> 
    <td width="15%"> 
      �Ҿ����ʦ    </td>
    <td width="12%">&nbsp;</td>
    <td width="10%"> 
      �ɵ���Ա    </td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">�Ҿӹ���</td>
    <td width="14%">&nbsp;</td>
  </tr>
  <tr align="center" height="29"> 
    <td width="15%"> 
      ��ϵ�绰    </td>
    <td width="12%">&nbsp;</td>
    <td width="10%"> 
      �ɵ�����    </td>
    <td width="13%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="9%">&nbsp;</td>
    <td width="11%">���������</td>
    <td width="14%">&nbsp;</td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("��������: " + e);
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