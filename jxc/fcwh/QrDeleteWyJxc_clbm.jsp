<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ɾ���۸��Ϳ��������δ�ø���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<CENTER><B>ɾ�����۸���͡���桿�ж�û��ʹ�õĸ���</B><BR><HR>

<form method="post" action="" name="insertform" >
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="5%">����С��</td>
	<td  width="5%">���ϱ���</td>
	<td  width="5%">�ڲ�����</td>
	<td  width="9%">��������</td>

	<td  width="5%">�ͺ�</td>
	<td  width="6%">���</td>
	<td  width="3%">������λ</td>
	<td  width="8%">��Ʒ��</td>
	<td  width="3%">�ɹ����</td>
</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int sl=0;

try {
	conn=cf.getConnection();


	String clbm=null;
	String clxlbm=null;
	String nbbm=null;
	String clmc=null;
	String xh=null;
	String gg=null;
	String jldwbm=null;
	String ppmc=null;
	String cglb=null;
	ls_sql=" select clbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,ppmc,DECODE(cglb,'J','���Ųɹ�','D','�ط��ɹ�') cglb" ;
	ls_sql+=" from jxc_clbm " ;
	ls_sql+=" where cllb='1'" ;
	ls_sql+=" order by clxlbm,nbbm" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{         
		clbm=cf.fillNull(rs.getString("clbm"));
		clxlbm=cf.fillHtml(rs.getString("clxlbm"));
		nbbm=cf.fillHtml(rs.getString("nbbm"));
		clmc=cf.fillHtml(rs.getString("clmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldwbm=cf.fillHtml(rs.getString("jldwbm"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		cglb=cf.fillHtml(rs.getString("cglb"));

		int count=0;
		ls_sql=" select count(*) " ;
		ls_sql+=" from jxc_cljgb " ;
		ls_sql+=" where clbm='"+clbm+"'" ;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int count1=0;
		ls_sql=" select count(*) " ;
		ls_sql+=" from jxc_kcb " ;
		ls_sql+=" where clbm='"+clbm+"'" ;
		ps1= conn.prepareStatement(ls_sql);
		rs1=ps1.executeQuery();
		if(rs1.next())
		{         
			count1=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0 && count1==0)//�������ڣ�ɾ��
		{

			sl++;

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td >
				<input name="clbm" type="checkbox" value="<%=clbm%>" checked>
				</td>
				<td><%=clxlbm%></td>
				<td><%=clbm%></td>
				<td><%=nbbm%></td>
				<td><%=clmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldwbm%></td>
				<td><%=ppmc%></td>
				<td><%=cglb%></td>
			</tr>
			<%
		}
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
</table>

    <table width="100%" border="0">
      
      <tr align="center">
        <td width="48%" height="33" align="right">δʹ�ø��Ĺ���<%=sl%>���֣�</td>
        <td width="52%" height="33" align="left">
		<input name="button" type="button" onClick="f_delete(insertform)"  value="ɾ��δ�ø���"></td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_delete(FormName)
{
	if (!confirm("���ѣ���Ҫɾ������δ�ò��ϣ�ɾ���󲻿ɻ�ԭ��ȷʵҪɾ����") )	
	{
		return;
	}

	FormName.action="DeleteWyJxc_clbm.jsp";
	FormName.submit();
	return true;
} 


//-->
</script>