<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwbh=null;
String dwmc=null;
String dh=null;
String cz=null;
String jbr=null;
String jbrsj=null;
String shr=null;
String shrsj=null;
String fzr=null;
String fzrsj=null;
String dz=null;
String khyh=null;
String zh=null;
String khrxm=null;
String sm1=null;
String sm2=null;
String ydwmc=null;
String wheredwbh=null;
wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	sql="select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ydwmc=rs.getString("dwmc");
	}
	rs.close();
	ps.close();

	ls_sql="select dwbh,dwmc,dh,cz,jbr,jbrsj,shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2 ";
	ls_sql+=" from  jxc_fgslxr";
	ls_sql+=" where (1=1) and  (dwbh='"+wheredwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dh=cf.fillNull(rs.getString("dh"));
		cz=cf.fillNull(rs.getString("cz"));
		jbr=cf.fillNull(rs.getString("jbr"));
		jbrsj=cf.fillNull(rs.getString("jbrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shrsj=cf.fillNull(rs.getString("shrsj"));
		fzr=cf.fillNull(rs.getString("fzr"));
		fzrsj=cf.fillNull(rs.getString("fzrsj"));
		dz=cf.fillNull(rs.getString("dz"));
		khyh=cf.fillNull(rs.getString("khyh"));
		zh=cf.fillNull(rs.getString("zh"));
		khrxm=cf.fillNull(rs.getString("khrxm"));
		sm1=cf.fillNull(rs.getString("sm1"));
		sm2=cf.fillNull(rs.getString("sm2"));
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
    ��λ���
  </td>
  <td width="35%"> 
    <%=dwbh%>
  </td>
  <td align="right" width="15%"> 
    ��λ����
  </td>
  <td width="35%"> 
    <%=dwmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �绰
  </td>
  <td width="35%"> 
    <%=dh%>
  </td>
  <td align="right" width="15%"> 
    ����
  </td>
  <td width="35%"> 
    <%=cz%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ������
  </td>
  <td width="35%"> 
    <%=jbr%>
  </td>
  <td align="right" width="15%"> 
    �������ֻ�
  </td>
  <td width="35%"> 
    <%=jbrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ջ���
  </td>
  <td width="35%"> 
    <%=shr%>
  </td>
  <td align="right" width="15%"> 
    �ջ����ֻ�
  </td>
  <td width="35%"> 
    <%=shrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ������
  </td>
  <td width="35%"> 
    <%=fzr%>
  </td>
  <td align="right" width="15%"> 
    �������ֻ�
  </td>
  <td width="35%"> 
    <%=fzrsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ��ַ
  </td>
  <td width="35%"> 
    <%=dz%>
  </td>
  <td align="right" width="15%"> 
    ��������
  </td>
  <td width="35%"> 
    <%=khyh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �˺�
  </td>
  <td width="35%"> 
    <%=zh%>
  </td>
  <td align="right" width="15%"> 
    ����������
  </td>
  <td width="35%"> 
    <%=khrxm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    ˵��1
  </td>
  <td width="35%"> 
    <%=sm1%>
  </td>
  <td align="right" width="15%"> 
    ˵��2
  </td>
  <td width="35%"> 
    <%=sm2%>
  </td>
</tr>
</table>
</body>
</html>
