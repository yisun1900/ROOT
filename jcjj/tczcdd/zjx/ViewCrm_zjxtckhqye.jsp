<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");

String khbh=null;
double tcbzjg=0;
double tcmjzjje=0;
double tczcsjcj=0;
double tczccljj=0;
double tcxsfzc=0;
double tczcjm=0;
double tcdpsj=0;
double tcdpdlsf=0;
double tcxpx=0;
double tcwsgzj=0;
double tcwgccljj=0;
double tcwzjzc=0;
double tcsgze=0;
double tcqtsf=0;

double zctcje=0;
double wntcje=0;
double jytcje=0;
double sctcje=0;
double jktcje=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje";
	ls_sql+=" ,jytcje,sctcje,jktcje";
	ls_sql+=" from  crm_zjxtckhqye";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jytcje=rs.getDouble("jytcje");
		sctcje=rs.getDouble("sctcje");
		jktcje=rs.getDouble("jktcje");

		khbh=cf.fillNull(rs.getString("khbh"));
		tcbzjg=rs.getDouble("tcbzjg");
		tcmjzjje=rs.getDouble("tcmjzjje");
		tczcsjcj=rs.getDouble("tczcsjcj");
		tczccljj=rs.getDouble("tczccljj");
		tcxsfzc=rs.getDouble("tcxsfzc");
		tczcjm=rs.getDouble("tczcjm");
		tcdpsj=rs.getDouble("tcdpsj");
		tcdpdlsf=rs.getDouble("tcdpdlsf");
		tcxpx=rs.getDouble("tcxpx");
		tcwsgzj=rs.getDouble("tcwsgzj");
		tcwgccljj=rs.getDouble("tcwgccljj");
		tcwzjzc=rs.getDouble("tcwzjzc");
		tcsgze=rs.getDouble("tcsgze");
		tcqtsf=rs.getDouble("tcqtsf");
		zctcje=rs.getDouble("zctcje");
		wntcje=rs.getDouble("wntcje");
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">�ײ��˲����۸��˲�����ţ�<%=zjxxh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">�ײͣ���׼�۸�</td>
  <td width="70%"><%=tcbzjg%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%"> 
    �ײͣ�������ӽ��  </td>
  <td width="70%"> 
    <%=tcmjzjje%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײͣ������������</td>
  <td><%=tczcsjcj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%"> 
    �ײͣ����ĳ����Ӽ�  </td>
  <td width="70%"> 
    <%=tczccljj%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײͣ����շ�����</td>
  <td><%=tcxsfzc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%"> 
    �ײͣ����ļ���  </td>
  <td width="70%"> 
    <%=tczcjm%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײͣ���������</td>
  <td><%=tcdpsj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%"> 
    �ײͣ���������շ�  </td>
  <td width="70%"> 
    <%=tcdpdlsf%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײͣ�ѡ����</td>
  <td><%=tcxpx%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%"> 
    �ײ���ʩ�������  </td>
  <td width="70%"> 
    <%=tcwsgzj%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײͣ����̳����Ӽ�</td>
  <td><%=tcwgccljj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײͣ������շ�</td>
  <td><%=tcqtsf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%"> 
    �ײ�����������  </td>
  <td width="70%"> 
    <%=tcwzjzc%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>С ��</strong></td>
  <td><%=cf.round(tcbzjg+tcmjzjje+tczcsjcj+tczccljj+tcxsfzc-tczcjm+tcdpsj+tcdpdlsf+tcxpx+tcwsgzj+tcwgccljj+tcwzjzc+tcqtsf,2)%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ҿ��ײͽ��</td>
  <td><%=zctcje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ů�ײͽ��</td>
  <td><%=wntcje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ײͽ��</td>
  <td><%=jytcje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ɫ���ײͽ��</td>
  <td><%=sctcje%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����ײͽ��</td>
  <td><%=jktcje%></td>
  </tr>
</table>
</body>
</html>
