<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] clbm =request.getParameterValues("clbm");
	String dqbm =request.getParameter("dqbm");
%>
<body bgcolor="#FFFFFF">

      <div align="center"> 请输入价格批量修改公式(<font color="#FF0000">注意：此次操作将修改所有选中材料价格</font>)</div>

		<form method="post" action="SaveEnterPlJg.jsp" name="selectform">
          <table width="100%" >
            <tr>

<%
for (int i=0;i<clbm.length ;i++ )
{
	%>
	<input type="hidden" name="clbm" value="<%=clbm[i]%>" >
	<%
}


%>              <td colspan="4" align="center"  >
				<input name="button" type="button" onClick="f_do(selectform)"  value="批量调整价格">
				<input type="reset" name="Reset" value="重输">
				</td>
            </tr>

            <tr bgcolor="#FFFFCC">
              <td width="48%" height="15" align="right"><font color="#FF0000" size="5"><strong>输入新价格</strong></font></td>
              <td>&nbsp;</td>
              <td height="15"><font color="#FF0000" size="5"><strong>选择需调价地区</strong></font></td>
            </tr>
            

            <tr> 
			  <td height="73" valign="top">
          <table width="100%" >
				  <td width="43%" height="2" bgcolor="#FFFFFF" align="right">成本价
				  <input name="cbj" type="text" size="20" maxlength="20"></td>
				</tr>
				<tr>
				  <td height="15" align="right" bgcolor="#FFFFFF">对分公司价格
				  <input name="dfgsjg" type="text" size="20" maxlength="20"></td>
				</tr>
				<tr>
				  <td height="15" align="right" bgcolor="#FFFFFF">对工长价格
				  <input name="dgzjg" type="text" size="20" maxlength="20"></td>
				</tr>
				<tr>
				  <td height="15" align="right" bgcolor="#FFFFFF">销售价              
				  <input name="xsj" type="text" size="20" maxlength="20"></td>
				</tr>
          </table>			  </td>
              <td width="4%" rowspan="2" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="48%" rowspan="2" bgcolor="#FFFFFF">
			  <select name="dqbm" size="25" multiple style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
			%>
              </select></td>
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
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[成本价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "成本价"))) {
		return false;
	}
	if(	javaTrim(FormName.dfgsjg)=="") {
		alert("请输入[对分公司价格]！");
		FormName.dfgsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dfgsjg, "对分公司价格"))) {
		return false;
	}
	if(	javaTrim(FormName.dgzjg)=="") {
		alert("请输入[对工长价格]！");
		FormName.dgzjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzjg, "对工长价格"))) {
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[成本价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "成本价"))) {
		return false;
	}

	if(	!selectChecked(FormName.dqbm)) {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
