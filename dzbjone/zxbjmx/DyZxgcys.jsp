<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
double fwmj=0;

double wdzgce=0;
double qye=0;
double zhhtzcbj=0;
String zxjlh=null;
String zxqk="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,fwdz,fwmj,zxjlh";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		fwmj=rs.getDouble("fwmj");
		zxjlh=cf.fillNull(rs.getString("zxjlh"));
	}
	rs.close();
	ps.close();


	ls_sql="select zxqk";
	ls_sql+=" from  crm_sjszxqk";
	ls_sql+=" where zxjlh='"+zxjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxqk=cf.fillNull(rs.getString("zxqk"));
	}
	rs.close();
	ps.close();



	//ȡ���ӱ������ݣ�������������������ʼ
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();

	wdzgce=dzbjje.getZqBjje(conn,khbh,"sxyd");//��ȡ����ǰ�����ӱ��۽�ֱ�ӷѣ������շ�
	qye=dzbjje.getZhBjje(conn,khbh,"sxyd");//��ȡ���ۺ󡻵��ӱ��۽�ֱ�ӷѣ������շ�
	zhhtzcbj=cf.round(dzbjje.getZhZcbj(conn,khbh,"sxyd"),2);//��ͬ���ı��ۣ��ۺ�
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" rowspan="2"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="140"></span></td>
    <td colspan="5" rowspan="2"><b><font size="5">װ�޹��̣�Ԥ������</font></b></td>
   <td width="9%" height="35" >Ԥ�����:</td>
   <td width="12%" >&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="35" >Ԥ�����:</td>
   <td >&nbsp;</td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="3"  bgcolor="#000000" style='FONT-SIZE: 14px'>
 <tr bgcolor="#FFFFFF" height="30">
   <td width="50%">�������ƣ�<%=fwdz%></td>
   <td width="50%" >���������<%=fwmj%>ƽ��</td>
 </tr>
 <tr bgcolor="#FFFFFF"  height="30">
   <td>�ͻ���ţ�<%=khbh%></td>
   <td >����ָ�꣺<%=cf.round((qye+zhhtzcbj)/fwmj,2)%></td>
 </tr>
 <tr bgcolor="#FFFFFF"  height="30">
   <td>������ۣ�<%=cf.round(qye+zhhtzcbj,2)%></td>
   <td >�˸�ָ�꣺<%=cf.round(qye/fwmj,2)%></td>
 </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="3"  bgcolor="#000000" style='FONT-SIZE: 14px'>
 <tr bgcolor="#FFFFFF" align="center" height="30"> 
    <td width="25%">��������</td>
    <td colspan="2" width="25%">Ԥ����</td>
    <td colspan="2" width="25%">��������</td>
	<td width="25%" >������</td>
  </tr>
 <tr bgcolor="#FFFFFF" align="center" height="30"> 
    <td >�˸�����</td>
    <td colspan="2" ><%=qye%></td>
    <td colspan="2" >�˸�����</td>
	<td  >&nbsp;</td>
  </tr>
 <tr bgcolor="#FFFFFF" align="center" height="30"> 
    <td  >���Ĳ���</td>
    <td colspan="2" ><%=zhhtzcbj%></td>
    <td colspan="2" >���Ĳ���</td>
	<td  >&nbsp;</td>
  </tr>
 <tr bgcolor="#FFFFFF" align="center" height="30"> 
    <td  >�ϼ�</td>
    <td colspan="2" ><%=cf.round(qye+zhhtzcbj,2)%></td>
    <td colspan="2" >�ϼ�</td>
	<td  >&nbsp;</td>
  </tr>
 <tr bgcolor="#FFFFFF" > 
    <td height="126" colspan="6" valign="top" >˵��:
	<BR>
	&nbsp;&nbsp;&nbsp;&nbsp;<%=zxqk%>
	</td>
  </tr>
 <tr bgcolor="#FFFFFF" align="center"> 
    <td height="99" colspan="2" valign="top" width="35%">���Ƶ�λ����ͬ�£�
	<BR><BR><BR><BR><BR><BR><BR>
	��������ʱ��װ�ι������޹�˾
	<BR><BR>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��	</td>
    <td colspan="2" valign="top" >�ͻ�ȷ�ϣ�ǩ�֣�
	<BR><BR><BR><BR><BR><BR><BR><BR><BR>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��
    </td>
    <td colspan="2" valign="top" width="35%">��  ע
	<BR><BR><BR><BR><BR><BR><BR><BR><BR>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��
    </td>
  </tr>
</table>
<BR>
</body>
</html>
