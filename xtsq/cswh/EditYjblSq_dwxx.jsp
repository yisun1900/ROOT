<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010116")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

double jryjbfb=0;
double sjjryjbfb=0;
double yjjzcs=0;


String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz ";
	ls_sql+=" ,jryjbfb,sjjryjbfb,yjjzcs ";
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

		jryjbfb=rs.getDouble("jryjbfb");
		sjjryjbfb=rs.getDouble("sjjryjbfb");
		yjjzcs=rs.getDouble("yjjzcs");
	}
	rs.close();
	ps.close();

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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="editform">
      <div align="center">����ҵ��������ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ���</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ����</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="23%" align="right"><font color="#0000FF">����</font></td>
	  <td width="27%"><%=bianma%></td>
	  <td width="20%" align="right"><font color="#0000FF">�绰����</font></td>
	  <td width="30%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ�绰</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ����</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="23%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">��ע</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	<tr>
	  <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>��װǩ������ҵ���տ����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="jryjbfb" value="<%=jryjbfb%>" size="10" maxlength="20" >
	    %
&nbsp;&nbsp;<strong><font color="#0000FF">��ǩ�����Ƿ���뵱��ҵ�����������ڿ��Ƿ���ȡ���ﵽ�趨�ٷֱ�</font></strong></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>��ƷѼ���ҵ���տ����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="sjjryjbfb" value="<%=sjjryjbfb%>" size="10" maxlength="20" >
	    %
&nbsp;&nbsp;<strong><font color="#0000FF">����Ʒѡ��Ƿ���뵱��ҵ���������Ʒ�ʵ�տ��Ƿ�ﵽ�趨�ٷֱ�</font></strong></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font>ҵ����ֵ����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="yjjzcs" value="<%=yjjzcs%>" size="10" maxlength="20" >
	    % <strong><font color="#0000FF">&nbsp;&nbsp;ҵ����ֵ��ë�����ҵ����ֵ����</font></strong></td>
    </tr>
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
		  <input type="reset"  value="����"></td>
	</tr>
</table>
</form>


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

	if(	javaTrim(FormName.jryjbfb)=="") {
		alert("������[��װǩ������ҵ���տ����]��");
		FormName.jryjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.jryjbfb, "��װǩ������ҵ���տ����"))) {
		return false;
	}
	if (parseFloat(FormName.jryjbfb.value) <0 || parseFloat(FormName.jryjbfb.value) >100)
	{
		alert("����[��װǩ������ҵ���տ����]Ӧ����0��100֮�䣡");
		FormName.jryjbfb.select();
		return false;
	}

	
	if(	javaTrim(FormName.sjjryjbfb)=="") {
		alert("������[��ƷѼ���ҵ���տ����]��");
		FormName.sjjryjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjryjbfb, "��ƷѼ���ҵ���տ����"))) {
		return false;
	}
	if (parseFloat(FormName.sjjryjbfb.value) <0 || parseFloat(FormName.sjjryjbfb.value) >100)
	{
		alert("����[��ƷѼ���ҵ���տ����]Ӧ����0��100֮�䣡");
		FormName.sjjryjbfb.select();
		return false;
	}
	
	if(	javaTrim(FormName.yjjzcs)=="") {
		alert("������[ҵ����ֵ����]��");
		FormName.yjjzcs.focus();
		return false;
	}
	if(!(isFloat(FormName.yjjzcs, "ҵ����ֵ����"))) {
		return false;
	}
	if (parseFloat(FormName.yjjzcs.value) <=0 || parseFloat(FormName.yjjzcs.value) >100)
	{
		alert("����[ҵ����ֵ����]Ӧ����0��100֮�䣡");
		FormName.yjjzcs.select();
		return false;
	}


	FormName.action="SaveEditYjblSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











