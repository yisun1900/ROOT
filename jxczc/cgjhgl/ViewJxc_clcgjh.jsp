<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%

String cgjhmc=null;
String cgsqr=null;
String jhkssj=null;
String jhjssj=null;
String jhje=null;
String jhnr=null;
String jhdzt=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String shr=null;
String shsj=null;
String shjg=null;
String shnr=null;
String bz=null;
String jhfkjd=null;
String cgjhph=null;
cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select cgjhmc,cgsqr,jhkssj,jhjssj,jhje,jhnr,DECODE(jhdzt,'0','¼��δ�ύ','1','�ȴ����','2','������','9','�ƻ����') jhdzt,dwmc ssfgs,lrr,lrsj,shr,shsj,DECODE(shjg,'Y','���ͨ��','N','���δͨ��','�ȴ����') shjg,shnr,jxc_clcgjh.bz bz,jxc_clcgjh.jhfkjd jhfkjd ";
	ls_sql+=" from  jxc_clcgjh,sq_dwxx ";
	ls_sql+=" where jxc_clcgjh.ssfgs=sq_dwxx.dwbh and  (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgjhmc=cf.fillNull(rs.getString("cgjhmc"));
		cgsqr=cf.fillNull(rs.getString("cgsqr"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhje=cf.fillNull(rs.getString("jhje"));
		jhnr=cf.fillNull(rs.getString("jhnr"));
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjg=cf.fillNull(rs.getString("shjg"));
		shnr=cf.fillNull(rs.getString("shnr"));
		bz=cf.fillNull(rs.getString("bz"));
		jhfkjd=cf.fillNull(rs.getString("jhfkjd"));
	}
	rs.close();
	ps.close();

	out.print("���ɵĹ�Ӧ�̶�����");
	String gysddph="";
	ls_sql="select gysddph ";
	ls_sql+=" from  jxc_cgjhddb ";
	ls_sql+=" where cgjhph='"+cgjhph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		gysddph=cf.fillNull(rs.getString("gysddph"));

		out.print("<a href=\"/jxczc/gysddgl/ViewJxc_gysdd.jsp?gysddph="+gysddph+"\" target=\"_blank\">"+gysddph+"</a>&nbsp;&nbsp;&nbsp;");

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


<div align="center"> �ɹ��ƻ�</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ɹ��ƻ�����  </td>
  <td width="35%"> 
    <%=cgjhph%>  </td>
  <td align="right" width="15%"> 
    �ɹ��ƻ�����  </td>
  <td width="35%"> 
    <%=cgjhmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ɹ�������  </td>
  <td width="35%"> 
    <%=cgsqr%>  </td>
  <td align="right" width="15%">�ƻ����</td>
  <td width="35%"><%=jhje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ƻ���ʼʱ��  </td>
  <td width="35%"><%=jhkssj%></td>
  <td align="right" width="15%">�ƻ�����ʱ��</td>
  <td width="35%"><%=jhjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td>
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%">¼��ʱ��</td>
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �����ֹ�˾  </td>
  <td width="35%"> 
    <%=ssfgs%>  </td>
  <td align="right" width="15%">�ƻ���״̬</td>
  <td width="35%"><%=jhdzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����</td>
  <td><%=shr%></td>
  <td align="right">���ʱ��</td>
  <td><%=shsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��˽��</td>
  <td><%=shjg%></td>
  <td align="right">�������</td>
  <td><%=shnr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ�����</td>
  <td colspan="3"><%=jhnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ��������</td>
  <td colspan="3"><%=jhfkjd%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="22" align="right">��ע</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>


<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���</td>
	<td  width="8%">���ϱ���</td>
	<td  width="8%">�ڲ�����</td>
	<td  width="12%">��������</td>
	<td  width="10%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="19%">��Ӧ��</td>
	<td  width="5%">������λ</td>
	<td  width="6%">�ƻ��ɹ�����</td>
	<td  width="6%">�ƻ��ɹ�����</td>
	<td  width="8%">�ƻ��ɹ����</td>
	<td  width="6%">ʵ�ʲɹ�����</td>

</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT jhxh,clbm,nbbm,clmc,xh,gg,gysmc,jldwbm,TO_CHAR(jhcgdj),jhcgsl,jhcgje,sjcgsl";
	ls_sql+=" FROM jxc_cgjhmx ";
    ls_sql+=" where  jxc_cgjhmx.cgjhph='"+cgjhph+"'";
	ls_sql+=" order by jhxh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>