<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

int txts1=0;
int txts2=0;
int txts3=0;
int txts4=0;
int txts5=0;
int txts6=0;


String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select txts";
	ls_sql+=" from  crm_txxxsz";
	ls_sql+=" where ssfgs='"+dwbh+"' and txlx='1'";//1��¼��ʱ�䳬����2��������泬����3���������ʦ������4�����������𳬹���5������Ʒѳ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txts1=rs.getInt("txts");
	}
	rs.close();
	ps.close();

	ls_sql="select txts";
	ls_sql+=" from  crm_txxxsz";
	ls_sql+=" where ssfgs='"+dwbh+"' and txlx='2'";//1��¼��ʱ�䳬����2��������泬����3���������ʦ������4�����������𳬹���5������Ʒѳ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txts2=rs.getInt("txts");
	}
	rs.close();
	ps.close();

	ls_sql="select txts";
	ls_sql+=" from  crm_txxxsz";
	ls_sql+=" where ssfgs='"+dwbh+"' and txlx='3'";//1��¼��ʱ�䳬����2��������泬����3���������ʦ������4�����������𳬹���5������Ʒѳ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txts3=rs.getInt("txts");
	}
	rs.close();
	ps.close();

	ls_sql="select txts";
	ls_sql+=" from  crm_txxxsz";
	ls_sql+=" where ssfgs='"+dwbh+"' and txlx='4'";//1��¼��ʱ�䳬����2��������泬����3���������ʦ������4�����������𳬹���5������Ʒѳ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txts4=rs.getInt("txts");
	}
	rs.close();
	ps.close();

	ls_sql="select txts";
	ls_sql+=" from  crm_txxxsz";
	ls_sql+=" where ssfgs='"+dwbh+"' and txlx='5'";//1��¼��ʱ�䳬����2��������泬����3���������ʦ������4�����������𳬹���5������Ʒѳ���
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		txts5=rs.getInt("txts");
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="editform">
      <div align="center">���ã����ѻط�����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ���</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ����</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="18%" align="right"><font color="#0000FF">����</font></td>
	  <td width="32%"><%=bianma%></td>
	  <td width="18%" align="right"><font color="#0000FF">�绰����</font></td>
	  <td width="32%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ�绰</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ����</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">��ע</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��������</td>
	  <td>
		<select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
		  <option value="1">¼��ʱ�䳬��</option>
		</select>	  </td>
	  <td align="right">��������</td>
	  <td><input type="text" name="txts" value="<%=txts1%>" size="10" maxlength="10" >
	  ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��������</td>
	  <td>
		<select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
		  <option value="2">������泬��</option>
		</select>	  </td>
	  <td align="right">��������</td>
	  <td><input type="text" name="txts" value="<%=txts2%>" size="10" maxlength="10" >
      ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��������</td>
	  <td>
		<select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
		  <option value="3">�������ʦ����</option>
		</select>	  </td>
	  <td align="right">��������</td>
	  <td><input type="text" name="txts" value="<%=txts3%>" size="10" maxlength="10" >
      ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��������</td>
	  <td>
		<select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
		  <option value="4">���������𳬹�</option>
		</select>	  </td>
	  <td align="right">��������</td>
	  <td><input type="text" name="txts" value="<%=txts4%>" size="10" maxlength="10" >
      ��</td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td align="right">��������</td>
	  <td>
		<select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
		  <option value="5">����Ʒѳ���</option>
		</select>	  </td>
	  <td align="right">��������</td>
	  <td><input type="text" name="txts" value="<%=txts5%>" size="10" maxlength="10" >
      ��</td>
	</tr>
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
		  <input type="reset"  value="����"></td>
	</tr>
</table>
</form>

<%
	
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--



function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}



	FormName.action="SaveEditTxszSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











