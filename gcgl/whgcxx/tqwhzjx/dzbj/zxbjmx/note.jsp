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
		jzbz="家装报价";
	}
	else if (jzbz.equals("2"))
	{
		jzbz="公装报价";
	}

	String dqbm=request.getParameter("dqbm");
	dqbm=cf.executeQuery("select dqmc from dm_dqbm where dqbm='"+dqbm+"'");
	khbh=cf.executeQuery("select khxm from crm_zxkhxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 15px'>
  <tr> 
    <td colspan="2" height="37" align="center">增减项管理-->>>>选择报价项目</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">增减项序号：</td>
    <td width="51%" height="42">『<font color="#000099"><b><%=zjxxh%></b></font>』</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">报价地区：</td>
    <td width="51%" height="42">『<font color="#000099"><b><%=dqbm%></b></font>』</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="42">客户姓名：</td>
    <td width="51%" height="42">『<font color="#000099"><b><%=khbh%></b></font>』</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="35">本客户所选报价级别：</td>
    <td width="51%" height="35">『<font color="#000099"><b><%=bjjb%></b></font>』</td>
  </tr>
  <tr> 
    <td width="49%" align="right" height="35">家装标志：</td>
    <td width="51%" height="35">『<font color="#000099"><b><%=jzbz%></b></font>』</td>
  </tr>
  <tr> 
    <td colspan="2" height="35"> 
      <table width="100%" border="0" style='FONT-SIZE: 15px'>
        <tr align="center"> 
          <td colspan="2" height="47"><font color="#CC0000"><b>如何做电子报价呢？</b></font></td>
        </tr>
        <tr> 
          <td width="36%" align="right">第一步：</td>
          <td width="64%">首先从左侧菜单中选择报价项目</td>
        </tr>
        <tr> 
          <td width="36%" align="right">第二步：</td>
          <td width="64%">录入房间中各项目的工程量</td>
        </tr>
        <tr align="center"> 
          <td colspan="2" height="46"><b><font color="#CC0000">上述录入工程量各按钮说明</font></b></td>
        </tr>
        <tr> 
          <td width="36%" align="right">[<font color="#0000CC"><b>项目工程量</b></font>]按钮：</td>
          <td width="64%">首先选择某个[<b>项目</b>]，然后录入该项目下[<b>各房间</b>]工程量</td>
        </tr>
        <tr> 
          <td width="36%" align="right">[<b><font color="#0000FF">房间工程量</font></b>]按钮：</td>
          <td width="64%">首先选择某个[<b>房间</b>]，然后录入该房间下[<b>各项目</b>]工程量</td>
        </tr>
        <tr>
          <td width="36%" align="right">[<b><font color="#0000FF">综合录入</font></b>]按钮：</td>
          <td width="64%">可同时选择上述两种方式，如果项目超过200个可能较慢</td>
        </tr>
        <tr> 
          <td width="36%" align="right">[<font color="#0000FF"><b>删除未用项</b></font>]按钮：</td>
          <td width="64%">删除所有未录工程量的已选项目，删除后不可恢复</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
