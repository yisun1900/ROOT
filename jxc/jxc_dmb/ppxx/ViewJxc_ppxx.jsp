<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ppbm=null;
String ppmc=null;
String pplb=null;
String clxl=null;
String scsmc=null;
String bz=null;
String whereppbm=null;
whereppbm=cf.GB2Uni(request.getParameter("ppbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ppbm,ppmc,DECODE(pplb,'1','ľ��','2','����','3','�Ҿ�','4','����','5','����') pplb,clxl,scsmc,bz ";
	ls_sql+=" from  jxc_ppxx";
	ls_sql+=" where (1=1) and  (ppbm="+whereppbm+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		pplb=cf.fillNull(rs.getString("pplb"));
		clxl=cf.fillNull(rs.getString("clxl"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
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
    ��Ʒ�Ʊ���  </td>
  <td width="35%"> 
    <%=ppbm%>  </td>
  <td align="right" width="15%"> 
    ��Ʒ������  </td>
  <td width="35%"> 
    <%=ppmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%"> 
    ����С��  </td>
  <td width="35%"> 
    <%=clxl%>  </td>
  <td align="right" width="15%"> 
    Ʒ������  </td>
  <td width="35%"> 
    <%=scsmc%>  </td>
  
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
