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
		jzbz="家装报价";
	}
	else if (jzbz.equals("2"))
	{
		jzbz="公装报价";
	}

	String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
	String dqbm=request.getParameter("dqbm");
	dqbm=cf.executeQuery("select dqmc from dm_dqbm where dqbm='"+dqbm+"'");
	khbh=cf.executeQuery("select khxm from crm_zxkhxx where khbh='"+khbh+"'");

%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 15px'>
  <tr> 
    <td colspan="2" height="37" align="center">选择【房间内】报价项目</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">房间：</td>
    <td width="51%" height="42">『<font color="#000099"><b><%=jgwzbm%></b></font>』</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">客户姓名：</td>
    <td width="51%" height="42">『<font color="#000099"><b><%=khbh%></b></font>』</td>
  </tr>
  <tr> 
    <td colspan="2" height="35"> 
      <table width="100%" border="0" style='FONT-SIZE: 15px'>
        <tr align="center"> 
          <td height="47"><font color="#CC0000"><b>如何选报价项目呢？</b></font></td>
        </tr>
        <tr> 
          <td width="64%" align="center">点击左侧＋号展开菜单，按类别选择报价项目</td>
        </tr>
    </table>    </td>
  </tr>
</table>
</body>
</html>
