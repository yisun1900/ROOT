<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String khbh=request.getParameter("khbh");
	String zjxxh=request.getParameter("zjxxh");
	String bjjb=cf.executeQuery("select bjjb from crm_zxkhxx where khbh='"+khbh+"'");
	bjjb=cf.executeQuery("select bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'");
	String jzbz=request.getParameter("jzbz");
	if (jzbz.equals("1"))
	{
		jzbz="��װ����";
	}
	else if (jzbz.equals("2"))
	{
		jzbz="��װ����";
	}

	String dqbm=request.getParameter("dqbm");
	dqbm=cf.executeQuery("select dqmc from dm_dqbm where dqbm='"+dqbm+"'");
	khbh=cf.executeQuery("select khxm from crm_zxkhxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 15px'>
  <tr> 
    <td colspan="2" height="37" align="center">���������-->>>>ѡ�񱨼���Ŀ</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">��������ţ�</td>
    <td width="51%" height="42">��<font color="#000099"><b><%=zjxxh%></b></font>��</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">���۵�����</td>
    <td width="51%" height="42">��<font color="#000099"><b><%=dqbm%></b></font>��</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">�ͻ�������</td>
    <td width="51%" height="42">��<font color="#000099"><b><%=khbh%></b></font>��</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="35">���ͻ���ѡ���ۼ���</td>
    <td width="51%" height="35">��<font color="#000099"><b><%=bjjb%></b></font>��</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="35">��װ��־��</td>
    <td width="51%" height="35">��<font color="#000099"><b><%=jzbz%></b></font>��</td>
  </tr>
  <tr> 
    <td colspan="2" height="35"> 
      <table width="100%" border="0" style='FONT-SIZE: 15px'>
        <tr align="center"> 
          <td colspan="2" height="47"><font color="#CC0000"><b>��������ӱ����أ�</b></font></td>
        </tr>
        <tr> 
          <td width="36%" align="right">��һ����</td>
          <td width="64%">���ȴ����˵���ѡ�񱨼���Ŀ</td>
        </tr>
        <tr> 
          <td width="36%" align="right">�ڶ�����</td>
          <td width="64%">¼�뷿���и���Ŀ�Ĺ�����</td>
        </tr>
        <tr align="center"> 
          <td colspan="2" height="46"><b><font color="#CC0000">����¼�빤��������ť˵��</font></b></td>
        </tr>
        <tr> 
          <td width="36%" align="right">[<font color="#0000CC"><b>��Ŀ������</b></font>]��ť��</td>
          <td width="64%">����ѡ��ĳ��[<b>��Ŀ</b>]��Ȼ��¼�����Ŀ��[<b>������</b>]������</td>
        </tr>
        <tr> 
          <td width="36%" align="right">[<b><font color="#0000FF">���乤����</font></b>]��ť��</td>
          <td width="64%">����ѡ��ĳ��[<b>����</b>]��Ȼ��¼��÷�����[<b>����Ŀ</b>]������</td>
        </tr>
        <tr>
          <td width="36%" align="right">[<b><font color="#0000FF">�ۺ�¼��</font></b>]��ť��</td>
          <td width="64%">��ͬʱѡ���������ַ�ʽ�������Ŀ����200�����ܽ���</td>
        </tr>
        <tr> 
          <td width="36%" align="right">[<font color="#0000FF"><b>ɾ��δ����</b></font>]��ť��</td>
          <td width="64%">ɾ������δ¼����������ѡ��Ŀ��ɾ���󲻿ɻָ�</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
