<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">人工调整库存</font></B>
</CENTER>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");

String	dqbm=request.getParameter("dqbm");
String	ckbh=request.getParameter("ckbh");



%>



<form method="post" action="" name="selectform">
<table width="100%" border="1">
  <tr bgcolor="#FFFFFF">
    <td width="50%" height="42" align="right"><span class="STYLE1">*</span>地区</td>
    <td width="50%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="40" align="right"><span class="STYLE1">*</span>仓库</td>
    <td><select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
	cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc where ckbh='"+ckbh+"'  order by ckmc","");
%>
    </select></td>
  </tr>
      <tr>
        <td height="42" align="right">材料编码</td>
        <td><input type="text" name="clbm" size="20" maxlength="13"  ></td>
      </tr>
      <tr>
        <td height="39" align="right">内部编码</td>
        <td><input type="text" name="nbbm" size="20" maxlength="100"  ></td>
      </tr>
      <tr align="center" bgcolor="#999999">
        <td colspan="2"><input type="button"  value="继续" onClick="f_do(selectform)">
          &nbsp;&nbsp;
          <input type="reset"  value="重输">        </td>
      </tr>
</table>
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("请选择[仓库]！");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clbm)=="" && javaTrim(FormName.nbbm)=="") {
		alert("请输入[材料编码]或[内部编码]！");
		FormName.clbm.focus();
		return false;
	}

	FormName.action="DisCkxx.jsp";
	FormName.submit();
	return true;

}
//-->
</SCRIPT>
