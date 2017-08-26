<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String dwmc=null;
String cgsjs=null;
String sjsdh=null;


String ddbh=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cgdd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,sq_dwxx.dwmc,jc_cgdd.cgsjs";
	ls_sql+=" from  jc_cgdd,crm_khxx,sq_dwxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.dwbh=sq_dwxx.dwbh and  (jc_cgdd.ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillHtml(rs.getString("hth"));
		cgsjs=cf.fillNull(rs.getString("cgsjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	//�Ҿ����ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where yhmc ='"+cgsjs+"' and zwbm='12'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">���񶩵� </div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">      �������</td>
    <td width="29%"> <%=ddbh%> </td>
    <td width="20%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">�ͻ����</td>
    <td width="29%"><%=khbh%></td>
    <td width="20%" align="right">��ͬ��</td>
    <td width="30%"><%=hth%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right" bgcolor="#CCCCFF">      �ͻ�����</td>
    <td width="29%"><%=khxm%> </td>
    <td width="20%" align="right">      ��ϵ��ʽ</td>
    <td width="30%"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="21%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="10%">��Ʒ���</td>
	<td  width="14%">����</td>
	<td  width="10%">������Ϣ</td>
	<td  width="15%">���</td>
	<td  width="10%">���</td>
	<td  width="7%">����</td>
	<td  width="6%">����</td>
	<td  width="8%">�ܼ�</td>
	<td  width="14%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jc_cgdtmx.type_name,usercode,name,msxx,style,spec,TO_CHAR(price),qty,total,note";
	ls_sql+=" FROM jc_cgdtmx";
    ls_sql+=" where jc_cgdtmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by type_name,jc_cgdtmx.item_num";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

	
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("type_name","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	
	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>

</body>
</html>
