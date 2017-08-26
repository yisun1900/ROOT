<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050103'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[签单客户--查询]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}

	String ssfgs=request.getParameter("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:16">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>客户合并（<font color="#FF0000"><b><font color="#0000FF">把两个客户资料合并在一起，删除一个，保留一个</font></b></font>）</p>
        <p><b><font color="#CC00CC">『合并原则：保留<font size="5" color="#FF0000">家装客户</font>、删除<font size="5" color="#FF0000">集成客户</font>』</font></b></p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="ViewHbKhxx.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="42%" height="36"> 
                <div align="right">分公司</div>
              </td>
              <td width="58%" height="36"> <%
	out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	out.println("        </select>");
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="42%" align="right" height="49"><font color="#FF0000"><b>保留客户编号（家装或集成客户）</b></font></td>
              <td width="58%" height="49"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="42%" height="55"> 
                <div align="right"><font color="#0000FF">删除客户编号（集成客户）</font></div>
              </td>
              <td width="58%" height="55"> 
                <input type="text" name="khbh2" size="20" maxlength="7" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="继续" onClick="f_do(selectform)">
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请输入[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[保留客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh2)=="") {
		alert("请输入[删除客户编号]！");
		FormName.khbh2.focus();
		return false;
	}

	if (FormName.khbh.value==FormName.khbh2.value)
	{
		alert("[保留客户编号]与[删除客户编号]不能相同！");
		FormName.khbh2.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
