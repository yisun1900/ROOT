<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jsjlh=request.getParameter("jsjlh");

double jsjsze=0;
double sjbk=0;

double ycsjbk=0;
double ecsjbk=0;
double scsjbk=0;


String khbh=null;
String khxm=null;
String fwdz=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
double qye=0;
double zkl=0;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select khbh,sjbk";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sjbk=rs.getDouble("sjbk");
	}
	rs.close();
	ps.close();

	int row=0;
	ls_sql="select jsjsze,sjbk";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by jsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jsjsze=rs.getDouble("jsjsze");
		sjbk=rs.getDouble("sjbk");

		row++;
		if (row==1)
		{
			ycsjbk=sjbk;
		}
		else if (row==2)
		{
			ecsjbk=sjbk;
		}
		else if (row==3)
		{
			scsjbk=sjbk;
		}
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,sjs,sgdmc,zjxm,qye,zkl";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qye=rs.getDouble("qye");
		zkl=rs.getDouble("zkl");
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>���̽��㵥</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<div align="center">���̽��㵥</div>

<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="34">
        <td width="25%">�ͻ���ţ�<U><%=khbh%></U></td>
        <td width="25%">�ͻ�������<U><%=khxm%></U></td>
        <td width="25%">���ʦ��<U><%=sjs%></U></td>
        <td width="25%">����<U><%=zjxm%></U></td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="3">���ݵ�ַ��<U><%=fwdz%></U></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>ʩ������ ��</td>
        <td>ʵ�ʹ��� �� </td>
        <td>�������ڣ�</td>
        <td>�������ڣ�</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>ʩ���ӣ�<u><%=sgdmc%></u></td>
        <td>ʩ�����Ǽ���</td>
        <td>��������� </td>
        <td>&nbsp;</td>
      </tr>
      
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">

      <tr bgcolor="#FFFFFF" height="34">
        <td width="25%">��ͬ��<U><%=qye%></U></td>
        <td width="25%">������ۣ�</td>
        <td width="25%">����ǰ�����</td>
        <td width="25%">����������</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>ʵ�ʽ�</td>
        <td>Ӧ���㣺</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>�����ѣ�</td>
        <td>Ӧ���㣺</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>ˮ��Ԥ�գ�</td>
        <td>ˮ������</td>
        <td>ʵ��ˮ�磺 </td>
        <td>Ӧ���㣺</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>Զ��ʩ����������</td>
        <td>Ӧ���ʱ���</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="4" align="center">�ϼƣ�</td>
        </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="34">
        <td width="25%">�ͻ�Ƿ�</td>
        <td width="25%">β�</td>
        <td width="25%">���� �� </td>
        <td width="25%">���ڷѣ�</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>���ش�����</td>
        <td>����ԭ��</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>�ͻ�����ȣ�</td>
        <td>�ͻ������⣺</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>���ʦ������</td>
        <td>��������</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>���̾�������</td>
        <td>��Ŀ��������</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>����ԭ�� </td>
        <td>������</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="4" align="center">�ϼƴ����� Ԫ</td>
        </tr>
    </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td><table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="34">
        <td width="33%">����һ�Σ� Ԫ </td>
        <td width="34%">���Ϸѣ�</td>
        <td width="33%">������Ʒ��</td>
        </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>���ڶ��Σ� Ԫ </td>
        <td>���Ϸѣ�</td>
        <td>������Ʒ��</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="34">
        <td>����һ�Σ� Ԫ </td>
        <td>���Ϸѣ�</td>
        <td>������Ʒ��</td>
      </tr>
      
      <tr bgcolor="#FFFFFF" height="34">
        <td>Ѳ�콱����</td>
        <td>Ѳ�촦����</td>
        <td>&nbsp;</td>
        </tr>
      
      <tr bgcolor="#FFFFFF" height="34">
        <td colspan="3" align="center">�ϼ��Ѹ���</td>
      </tr>
    </table></td>
  </tr>
</table>

<BR>
<table width="100%"  border="0" cellpadding="1" cellspacing="0" bgcolor="#999999" style="FONT-SIZE:14">
  <tr bgcolor="#FFFFFF" height="44">
    <td colspan="4">����Ӧ���㣺</td>
  </tr>
  <tr bgcolor="#FFFFFF" height="34">
    <td width="25%">���̾���<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">������<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">�ܾ���<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
    <td width="25%">����ˣ�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
  </tr>
  <tr bgcolor="#FFFFFF" height="44">
    <td width="25%">&nbsp;</td>
    <td width="25%">&nbsp;</td>
    <td colspan="2" align="center"><U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U>��<U>&nbsp;&nbsp;&nbsp;&nbsp;</U>��<U>&nbsp;&nbsp;&nbsp;&nbsp;</U>��</td>
  </tr>
</table>


</body>
</html>

