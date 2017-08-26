<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">批量修改供应商</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="37%" align="right" height="54">家具工厂</td>
              <td width="63%" height="54"> 
                <select name="pdgc" style="FONT-SIZE:12PX;WIDTH:300PX">
                  <option value=""></option>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1") )
	{
		cf.selectItem(out,"select gysbh,gysmc||'（'||dqmc||'）' from sq_gysxx,dm_dqbm where  sq_gysxx.dqbm=dm_dqbm.dqbm and gyslb='3' order by gysmc","");
	}
	else{
		cf.selectItem(out,"select gysbh,gysmc from sq_gysxx where gyslb='3' and dqbm='"+dqbm+"' order by gysmc","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center"> 
<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
		  <input type="hidden" name="ddbh" value="<%=ddbh[i]%>" >
		<%
	}
%>
                  <input type="button"  value="批量修改工厂" onClick="f_do(editform)">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.pdgc)=="") {
		alert("请输入[工厂]！");
		FormName.pdgc.focus();
		return false;
	}


	FormName.action="SavePlxgGys.jsp";
	FormName.submit();
	return true;
}

</SCRIPT>
