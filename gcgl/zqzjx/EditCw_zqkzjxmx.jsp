<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

%>


<html>
<head>
<title>����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="editform" >
  <div align="center">�޸����ڿ���������ϸ���ͻ���ţ�<%=khbh%>����<span class="STYLE1">ע�⣺�޸�ʱ��С�ơ����ᷢ���仯��������С���롾ˢ�¡�</span>��</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>

    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="5%">&nbsp;</td>
		<td width="6%">����</td>
		<td width="5%">���</td>
		<td width="20%">����</td>
		<td width="10%">���</td>
		<td width="20%">������</td>
		<td width="9%">��ͬ��</td>
		<td width="20%">��ע</td>
    </tr>

<%
	String ptr=null;
	String mc=null;
	String cls=null;
	double je=0;
	String zjxbz=null;
	String zjxbzmc=null;
	String bz=null;

	int row=0;
	double allje=0;
	double xj=0;

	ls_sql="select ptr,mc,cls,je,zjxbz,DECODE(zjxbz,'1','���','2','���') zjxbzmc,bz ";
	ls_sql+=" FROM cw_zqkzjxmx";
	ls_sql+=" where cw_zqkzjxmx.khbh='"+khbh+"' and zjxbz='1'";//1�����2������
	ls_sql+=" order by zjxbz,ptr";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ptr=cf.fillNull(rs.getString("ptr"));
		mc=cf.fillNull(rs.getString("mc"));
		cls=cf.fillNull(rs.getString("cls"));
		je=rs.getDouble("je");
		zjxbz=cf.fillNull(rs.getString("zjxbz"));
		zjxbzmc=cf.fillNull(rs.getString("zjxbzmc"));
		bz=cf.fillNull(rs.getString("bz"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><A HREF="DeleteCw_zqkzjxmx.jsp?khbh=<%=khbh%>&mc=<%=mc%>" target="_blank">ɾ��</A></td>
		  <td><%=zjxbzmc%></td>
		  <td><%=row%>
			  <input type="hidden" name="zjxbz"  value="<%=zjxbz%>" >
		  </td>
		  <td> 
			<input type="text" name="mc" value="<%=mc%>" size="30" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="je" value="<%=je%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="cls" value="<%=cls%>" size="30" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="ptr" value="<%=ptr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="bz" value="<%=bz%>" size="30" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="3">����С��</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(xj)%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
</table>
<P>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="5%">&nbsp;</td>
		<td width="6%">����</td>
		<td width="5%">���</td>
		<td width="20%">����</td>
		<td width="10%">���</td>
		<td width="20%">������</td>
		<td width="9%">��ͬ��</td>
		<td width="20%">��ע</td>
    </tr>

<%
	xj=0;
	ls_sql="select ptr,mc,cls,je,zjxbz,DECODE(zjxbz,'1','���','2','���') zjxbzmc,bz ";
	ls_sql+=" FROM cw_zqkzjxmx";
	ls_sql+=" where cw_zqkzjxmx.khbh='"+khbh+"' and zjxbz='2'";//1�����2������
	ls_sql+=" order by zjxbz,ptr";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ptr=cf.fillNull(rs.getString("ptr"));
		mc=cf.fillNull(rs.getString("mc"));
		cls=cf.fillNull(rs.getString("cls"));
		je=rs.getDouble("je");
		zjxbz=cf.fillNull(rs.getString("zjxbz"));
		zjxbzmc=cf.fillNull(rs.getString("zjxbzmc"));
		bz=cf.fillNull(rs.getString("bz"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><A HREF="DeleteCw_zqkzjxmx.jsp?khbh=<%=khbh%>&mc=<%=mc%>" target="_blank">ɾ��</A></td>
		  <td><%=zjxbzmc%></td>
		  <td><%=row%>
			  <input type="hidden" name="zjxbz"  value="<%=zjxbz%>" >
		  </td>
		  <td> 
			<input type="text" name="mc" value="<%=mc%>" size="30" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="je" value="<%=je%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="cls" value="<%=cls%>" size="30" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="ptr" value="<%=ptr%>" size="8" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="bz" value="<%=bz%>" size="30" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="3">����С��</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(xj)%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="3">�ܼ�</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(allje)%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
  </table>

    <tr> 
      <td colspan="9" align="center" > 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button"  value="����" onClick="f_do(editform)" >

      </td>
    </tr>
  </table>
</form>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	FormName.action="SaveEditCw_zqkzjxmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

