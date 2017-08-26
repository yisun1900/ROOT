<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String gysbm=null;
String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xh,gysmc gysbm,lxrxm,zw,sj,bgdh,cz,DECODE(sflz,'Y','��ְ','N','��ְ') sflz,jxc_gyslxr.bz bz ";
	ls_sql+=" from  jxc_gyslxr,jxc_gysxx";
	ls_sql+=" where jxc_gyslxr.gysbm=jxc_gysxx.gysbm and  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		lxrxm=cf.fillNull(rs.getString("lxrxm"));
		zw=cf.fillNull(rs.getString("zw"));
		sj=cf.fillNull(rs.getString("sj"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		cz=cf.fillNull(rs.getString("cz"));
		sflz=cf.fillNull(rs.getString("sflz"));
		bz=cf.fillNull(rs.getString("bz"));
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
<div align="center"> �鿴��Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ���  </td>
  <td width="35%"> 
    <%=xh%>  </td>
  <td align="right" width="15%"> 
    ��Ӧ�̱���  </td>
  <td width="35%"> 
    <%=gysbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ϵ������  </td>
  <td width="35%"> 
    <%=lxrxm%>  </td>
  <td align="right" width="15%"> 
    ְ��  </td>
  <td width="35%"> 
    <%=zw%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ֻ�  </td>
  <td width="35%"> 
    <%=sj%>  </td>
  <td align="right" width="15%"> 
    �칫�绰  </td>
  <td width="35%"> 
    <%=bgdh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ����  </td>
  <td width="35%"> 
    <%=cz%>  </td>
  <td align="right" width="15%"> 
    �Ƿ���ְ  </td>
  <td width="35%"> 
    <%=sflz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ע  </td>
  <td colspan="3"> 
    <%=bz%>    </td>
  </tr>
</table>
</body>
</html>
