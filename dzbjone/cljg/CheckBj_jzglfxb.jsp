<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%

String dqbm=request.getParameter("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int allsl=0;
int clsl=0;
int wbmsl=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    allsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT count(*)";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    clsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT count(*)";
	ls_sql+="  FROM bj_jzglfxb";
	ls_sql+=" where dqbm='"+dqbm+"' and glflbm='1'  and wlbm is null";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
	    wbmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>

<CENTER>
  <p>���£���װ���Ϸ�����bj_jzglfxb��</p>
  <p>����[��װ���ϼ۸��bj_jzcljgb��]���޸ġ�bj_jzglfxb���е�[���ϱ���]<BR>
  </p>
  <HR>
<form method="post" action="" name="loadform" target="_blank">
    <table width="100%" border="0">
      <tr align="center"> 
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">��װ���Ϸ�����bj_jzglfxb����¼����<%=allsl%></td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">���в������¼����<%=clsl%></td>
      </tr>
      <tr align="center">
        <td height="34" align="right" width="25%">&nbsp;</td>
        <td height="34" align="left" width="75%">�������ޡ����ϱ��롿��¼����<%=wbmsl%></td>
      </tr>
      <tr align="center"> 
        <td height="91" align="right" width="25%">&nbsp;</td>
        <td height="91" align="left" width="75%"> 
          <p>
            <input type="radio" name="xzfw" value="1">
            ����ȫ�� </p>
          <p>
            <input type="radio" name="xzfw" value="2" checked>
            ���¡����ϱ��롿Ϊ�ռ�¼ </p>
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center" height="170"> 
          <p> 
            <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
            <input type="button"  value="���������ơ��ͺŹ��Ʒ�ơ���ƥ��" onClick="f_do1(loadform)" >
          </p>
          <p> 
            <input type="button"  value="���������ơ��ͺŹ����ƥ��" onClick="f_do2(loadform)" >
          </p>
          <p> 
            <input type="button"  value="���������ơ���ƥ��" onClick="f_do3(loadform)" >
          </p>
          <p> 
            <input type="button"  value="�鿴�����ϱ��롿Ϊ�ռ�¼" onClick="f_do4(loadform)" >
          </p>
          <p> 
            <input type="button"  value="���ݡ����ϱ��롿���¡��������ơ��ͺŹ��Ʒ�ơ�" onClick="f_do5(loadform)" >
          </p>
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do1(FormName)
{
	if (!confirm("ע�⣡�޸ĺ󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateBj_jzglfxb1.jsp";
	FormName.submit();
	return true;
} 
function f_do2(FormName)
{
	if (!confirm("ע�⣡�޸ĺ󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateBj_jzglfxb2.jsp";
	FormName.submit();
	return true;
} 
function f_do3(FormName)
{
	if (!confirm("ע�⣡�޸ĺ󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateBj_jzglfxb3.jsp";
	FormName.submit();
	return true;
} 
function f_do4(FormName)
{
	if (!confirm("ע�⣡�޸ĺ󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="EditNullBj_jzglfxb.jsp";
	FormName.submit();
	return true;
} 
function f_do5(FormName)
{
	if (!confirm("ע�⣡�޸ĺ󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="SaveUpdateMcPpGg.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>

