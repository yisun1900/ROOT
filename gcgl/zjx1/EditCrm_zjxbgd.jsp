<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=request.getParameter("zjxxh");


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
  <div align="center">�޸���������������������ţ�<%=zjxxh%>����<span class="STYLE1">ע�⣺�޸�ʱ��������С�ơ����ᷢ���仯��������С���롾ˢ�¡�</span>��</div>
<table border="1" cellspacing="0" cellpadding="1" width="180%" style='FONT-SIZE: 12px'>

    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="2%">&nbsp;</td>
		<td width="3%">����</td>
		<td width="2%">���</td>
		<td width="6%">Ԥ����</td>
		<td width="6%">����</td>
		<td width="13%">�����Ŀ</td>
		<td width="5%">����</td>
		<td width="5%">������λ</td>
		<td width="5%">����</td>
		<td width="5%">���</td>
		<td width="6%">����������</td>
		<td width="6%">������Ӳ��</td>
		<td width="6%">Ԥ��©�����ӽ��</td>
		<td width="6%">Ԥ��������</td>
		<td width="24%">˵��</td>
    </tr>

<%
	String xh=null;
	String xmbh=null;
	String fj=null;
	String bgxm=null;
	String jldw=null;
	double dj=0;
	double sl=0;
	double je=0;
	double sjzjje=0;
	double sjzjce=0;
	double yslxje=0;
	double yszjce=0;
	String lx=null;
	String lxmc=null;
	String sm=null;

	int row=0;
	double allje=0;
	double xj=0;

	ls_sql="select xh,xmbh,fj,bgxm,jldw,sl,dj,je,sjzjje,sjzjce,yslxje,yszjce,lx,DECODE(lx,'1','���','2','���') lxmc,sm ";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='1'";
	ls_sql+=" order by lx,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		fj=cf.fillNull(rs.getString("fj"));
		bgxm=cf.fillNull(rs.getString("bgxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		sjzjje=rs.getDouble("sjzjje");
		sjzjce=rs.getDouble("sjzjce");
		yslxje=rs.getDouble("yslxje");
		yszjce=rs.getDouble("yszjce");
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		sm=cf.fillNull(rs.getString("sm"));

		xj+=je;
		allje+=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><A HREF="DeleteCrm_zjxbgd.jsp?zjxxh=<%=zjxxh%>&xh=<%=xh%>" target="_blank">ɾ��</A></td>
		  <td><%=lxmc%></td>
		  <td><%=row%>
			  <input type="hidden" name="xh"  value="<%=row%>" >
		  </td>
		  <td><input name="xmbh" type="text"  value="<%=xmbh%>" size="12" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td><input name="fj" type="text"  value="<%=fj%>" size="12" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td> 
			<input type="text" name="bgxm" value="<%=bgxm%>" size="30" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="dj" value="<%=dj%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="jldw" value="<%=jldw%>" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sl" value="<%=sl%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td><%=je%> 
		  </td>
		  		  <td> 
			<input type="text" name="sjzjje" value="<%=sjzjje%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sjzjce" value="<%=sjzjce%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="yslxje" value="<%=yslxje%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="yszjce" value="<%=yszjce%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sm" value="<%=sm%>" size="57" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
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
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(xj)%></td>
		  <td>&nbsp;</td>
		</tr>
</table>
<P>
<table border="1" cellspacing="0" cellpadding="1" width="180%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
		<td width="2%">&nbsp;</td>
		<td width="3%">����</td>
		<td width="2%">���</td>
		<td width="6%">Ԥ����</td>
		<td width="6%">����</td>
		<td width="13%">�����Ŀ</td>
		<td width="5%">����</td>
		<td width="5%">������λ</td>
		<td width="5%">����</td>
		<td width="5%">���</td>
		<td width="6%">����������</td>
		<td width="6%">������Ӳ��</td>
		<td width="6%">Ԥ��©�����ӽ��</td>
		<td width="6%">Ԥ��������</td>
		<td width="24%">˵��</td>
    </tr>

<%
	xj=0;

	ls_sql="select xh,xmbh,fj,bgxm,jldw,sl,dj,je,sjzjje,sjzjce,yslxje,yszjce,lx,DECODE(lx,'1','���','2','���') lxmc,sm ";
	ls_sql+=" FROM crm_zjxbgd";
	ls_sql+=" where crm_zjxbgd.zjxxh='"+zjxxh+"' and lx='2'";
	ls_sql+=" order by lx,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		fj=cf.fillNull(rs.getString("fj"));
		bgxm=cf.fillNull(rs.getString("bgxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		je=rs.getDouble("je");
		sjzjje=rs.getDouble("sjzjje");
		sjzjce=rs.getDouble("sjzjce");
		yslxje=rs.getDouble("yslxje");
		yszjce=rs.getDouble("yszjce");
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		sm=cf.fillNull(rs.getString("sm"));

		xj+=je;
		allje-=je;

		row++;

		%>
		<tr bgcolor="#FFFFF"  align="center"> 
		  <td><A HREF="DeleteCrm_zjxbgd.jsp?zjxxh=<%=zjxxh%>&xh=<%=xh%>" target="_blank">ɾ��</A></td>
		  <td><%=lxmc%></td>
		  <td><%=row%>
			  <input type="hidden" name="xh"  value="<%=row%>" >
		  </td>
		  <td><input name="xmbh" type="text"  value="<%=xmbh%>" size="12" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td><input name="fj" type="text"  value="<%=fj%>" size="12" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
		  <td> 
			<input type="text" name="bgxm" value="<%=bgxm%>" size="30" maxlength="50" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="dj" value="<%=dj%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="jldw" value="<%=jldw%>" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sl" value="<%=sl%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td><%=je%> 
		  </td>
		  		  <td> 
			<input type="text" name="sjzjje" value="<%=sjzjje%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sjzjce" value="<%=sjzjce%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="yslxje" value="<%=yslxje%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="yszjce" value="<%=yszjce%>" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		  </td>
		  <td> 
			<input type="text" name="sm" value="<%=sm%>" size="57" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
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
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(xj)%></td>
		  <td>&nbsp;</td>
		</tr>

		<tr bgcolor="#FFFFF"  align="center"> 
		  <td colspan="3">�ܼ�</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=cf.formatDouble(allje)%></td>
		  <td>&nbsp;</td>
		</tr>
  </table>

    <tr> 
      <td colspan="9" align="center" > 
          <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
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

	FormName.action="SaveEditCrm_zjxbgd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>