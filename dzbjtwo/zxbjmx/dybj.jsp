
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

String sfkdybj="";
String bjjb=null;
String lx="";

String mark="";
String ysshbz="";
try {
	conn=cf.getConnection();

	//��飺�Ƿ�ɴ�ӡ���ۣ���������������������������ʼ
	String bjdysq="";
	sql="select bjjb,bjdysq,ysshbz";
	sql+=" from  crm_zxkhxx";
	sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
	}
	rs.close();
	ps.close();

	sql="select sfkdybj";
	sql+=" from  sq_yhxx";
	sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//�Ƿ�ɴ�ӡ����  Y������Ȩ��ӡ��N��������Ȩ��ӡ��M�����ܴ�ӡ
	}
	rs.close();
	ps.close();

	if (sfkdybj.equals("M"))//M�����ܴ�ӡ
	{
		out.println("���ѣ�����Ȩ��ӡ����");
		mark="disabled";
	}
	else if (sfkdybj.equals("Y"))//Y������Ȩ��ӡ
	{
		if ( !bjdysq.equals("1") && !bjdysq.equals("2"))//0��δ��Ȩ��1���ɵ�����2���ɴ�ӡ
		{
			out.println("���ѣ�������Ȩ���ܴ�ӡ���ۣ�Ŀǰδ��Ȩ");
			mark="disabled";
		}
	}

	if (!ysshbz.equals("Y") && !ysshbz.equals("S"))
	{
		out.println("Ԥ��δ��ˣ�����Ȩ��ӡ����:"+ysshbz);
		mark="disabled";
	}
	//��飺�Ƿ�ɴ�ӡ���ۣ�����������������������������


	//�ײ�
	sql="select lx";
	sql+=" from  bdm_bjjbbm";
	sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + sql);
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

<html>
<head>
<title>���ӱ��۴�ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr  align="center">
    <td height="90"><span class="STYLE1">��ӡ���ӱ��ۣ��ͻ���ţ�<%=khbh%>��</span></td>
  </tr>

  <tr  align="center">
	<td height="46">
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy4.jsp?khbh=<%=khbh%>')"  value="��ӡ4����ӱ���"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy6.jsp?khbh=<%=khbh%>')"  value="��ӡ6����ӱ���"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy7.jsp?khbh=<%=khbh%>')"  value="��ӡ7����ӱ���"   />
	  </p>
	  <p>
		<input type="button" <%=mark%> onClick="window.open('/dzbj/zxbjmx/Crm_khbjdy1.jsp?khbh=<%=khbh%>')"  value="��ӡ1����ӱ���"   />
	  </p>
	<p>
		<input type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxDyLsBjList.jsp?khbh=<%=khbh%>')"  value="��ӡ��ʱ����"   />
	  </p>
	</td>
  </tr>

</table>

</body>
</html>


