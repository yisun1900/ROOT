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
<table width="100%">
  <tr> 
    <td width="93%"> 
      <div align="center"> 请输入价格批量修改公式(<font color="#FF0000">注意：此次操作将修改所有选中材料价格</font>)</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="SavePltzcljgfc.jsp" name="selectform">
          <table width="100%" >
            <tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="57%" bgcolor="#FFFFFF"> 

	<input type="hidden" name="dqbm" value="<%=dqbm%>" >
<%
for (int i=0;i<clbm.length ;i++ )
{
	%>
	<input type="hidden" name="clbm" value="<%=clbm[i]%>" >
	<%
}

%>
              </td>
            </tr>
			<tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right">保留小数位数（四舍五入）</td>
              <td width="57%" bgcolor="#FFFFFF"> 
                <select name="xsws" style="FONT-SIZE:12px;WIDTH:152px">
				<option value=""></option>
				<option value="2">小数后2位（88888.88）</option>
				<option value="1">小数后1位（88888.9）</option>
				<option value="0">保留整数（88889）</option>
				<option value="-1">保留十位（88890）</option>
				<option value="-2">保留百位（88900）</option>
				<option value="-3">保留千位（89000）</option>
              </select>
              </td>
            </tr>
			<tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right"><font color="red"><b>选择需要调整的价格:</b></font></td>
              <td width="57%" bgcolor="#FFFFFF"> 
                <select name="jgmc" style="FONT-SIZE:12px;WIDTH:152px">
				<option value="">请选择要调整的价格</option>
				<option value="dfgsjg">对分公司价格</option>
				<option value="dgzjg">对工长价格</option>
				</select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="43%" align="right">价格修改公式：</td>
              <td width="57%"> 
                <select name="fh" style="FONT-SIZE:12px;WIDTH:152px">
				<option value=""></option>
				<option value="(">(</option>
				<option value=")">)</option>
				<option value="*">乘</option>
				<option value="/">除</option>
				<option value="+">+</option>
				<option value="-">-</option>
				<option value="dfgsjg">对分公司价格</option>
				<option value="dgzjg">对工长价格</option>
                </select>
                <input type="text" name="xs" size="14">
                <input type="button"  value="增加" onClick="gs.value+=fh.value+xs.value" name="button">
              </td>
            </tr>
            <tr> 
              <td width="43%" height="2" bgcolor="#FFFFFF" align="right"><font color="blue"><b>价格公式：</b></font> 
              </td>
              <td width="57%" height="2" bgcolor="#FFFFFF"> 
                <input type="text" name="gs" size="30" readonly="true">
              </td>
            </tr>
            <tr> 
              <td width="43%" height="73" bgcolor="#FFFFFF"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="57%" height="73" bgcolor="#FFFFFF"> 
                <input type="button"  value="批量调整价格" onClick="submit_onclick(selectform)">
                <input type="reset" name="Reset" value="重输">
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

function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xsws)=="") {
		alert("请选择您要保留的小数位数！");
		FormName.xsws.focus();
		return false;
	}if(	javaTrim(FormName.jgmc)=="") {
		alert("请选择您要调整的价格！");
		FormName.jgmc.focus();
		return false;
	}if(	javaTrim(FormName.gs)=="") {
		alert("请输入[价格公式]！");
		FormName.gs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
