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

	String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
	String dqbm=request.getParameter("dqbm");
	dqbm=cf.executeQuery("select dqmc from dm_dqbm where dqbm='"+dqbm+"'");
	khbh=cf.executeQuery("select khxm from crm_zxkhxx where khbh='"+khbh+"'");

%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 15px'>
  <tr> 
    <td colspan="2" height="37" align="center">ѡ�񡾷����ڡ�������Ŀ</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">���䣺</td>
    <td width="51%" height="42">��<font color="#000099"><b><%=jgwzbm%></b></font>��</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">�ͻ�������</td>
    <td width="51%" height="42">��<font color="#000099"><b><%=khbh%></b></font>��</td>
  </tr>
  <tr> 
    <td colspan="2" height="35"> 
      <table width="100%" border="0" style='FONT-SIZE: 15px'>
        <tr align="center"> 
          <td height="47"><font color="#CC0000"><b>���ѡ������Ŀ�أ�</b></font></td>
        </tr>
        <tr> 
          <td width="64%" align="center">�����࣫��չ���˵��������ѡ�񱨼���Ŀ</td>
        </tr>
    </table>    </td>
  </tr>
</table>
</body>
</html>
