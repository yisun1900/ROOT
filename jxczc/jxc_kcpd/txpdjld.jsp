<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<CENTER >
  <B><font size="3">����̵�</font></B>
</CENTER>

<table width="100%" bgcolor="#000000"  style='FONT-SIZE: 12px' border="0" cellspacing="1">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="6%">&nbsp;</td>
	<td width="6%">&nbsp;</td>
    <td width="8%">&nbsp;</td>
    <td width="4%">&nbsp;</td>
    <td width="3%">����</td>
    <td width="4%">����</td>
    <td width="8%">�ֿ�</td>
	<td width="6%">״̬</td>
	<td width="7%">�̵���</td>
	<td width="6%">�ֹ�˾</td>
    <td width="7%">�̵�ʱ��</td>
    <td width="10%">��ע</td>
  </tr>
  <%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String pdph=null;
String dqbm=null;
String ckbh=null;
String pdzt=null;
String pdr=null;
String pdrssfgs=null;
String pdsj=null;
String bz=null;

try {
	conn=cf.getConnection();
	ls_sql=" select pdph,dqmc dqbm,ckmc ckbh,DECODE(pdzt,'1','�����̵�','2','�̵����') pdzt,pdr,dwmc pdrssfgs,to_char(pdsj,'YYYY-MM-DD') pdsj,jxc_kcpdjl.bz bz ";
	ls_sql+=" from jxc_kcpdjl,jxc_ckmc,dm_dqbm,sq_dwxx ";
	ls_sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.pdrssfgs=sq_dwxx.dwbh and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and pdr='"+yhmc+"' and pdzt='1' and pdlb='0' ";
	ls_sql+=" order by pdph ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	int count=0;
	while (rs.next())
	{
		count++;

		pdph=cf.fillNull(rs.getString("pdph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		pdzt=cf.fillNull(rs.getString("pdzt"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdrssfgs=cf.fillNull(rs.getString("pdrssfgs"));
		pdsj=cf.fillNull(rs.getString("pdsj"));
		bz=cf.fillNull(rs.getString("bz"));
%> 
  <tr bgcolor="#FFFFFF" align="center" > 
  <td><A HREF="llwj.jsp?pdph=<%=pdph%>" target="_blank">������ϸ</A></td>
   <td><A HREF="Jxc_kcpdmxList.jsp?pdph=<%=pdph%>" target="_blank">����ά��</A></td>
  <td><A HREF="dckcexcel.jsp?pdph=<%=pdph%>">���ؿ������</A></td>
    <td><A HREF="tjkcpd.jsp?pdph=<%=pdph%>" target="_blank">�ύ</A></td>
    <td><A HREF="ViewJxc_kcpdjl.jsp?pdph=<%=pdph%>" target="_blank"><%=pdph%></A></td>
	<td><%=dqbm%></td>
    <td><%=ckbh%></td>
	<td><%=pdzt%></td>
	<td><%=pdr%></td>
    <td><%=pdrssfgs%></td>
    <td><%=pdsj%></td>
    <td><%=bz%></td>
  </tr>
  <%
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
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
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 
</table>


<form action="InsertJxc_kcpdjl.jsp" method="post">
<table width="100%">
  <tr bgcolor="#FFFFFF" align="center" > 
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" >
      <td> 
      <input type="hidden" name="dolx" value="new">
      <input type="submit"  value="�����µ��̵�����">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF" align="center" > 
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
