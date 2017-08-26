<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="FgsFcjgtzmx.jsp" name="selectform">
<div align="center">调工队价</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">分公司</td>
      <td width="32%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td align="right" width="19%"><b><font color="#0000CC">维护人</font></b></td>
      <td width="31%">
        <input type="text" name="wxr" size="20" maxlength="20" value="">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">材料编码</td>
      <td width="32%"><input name="clbm3" type="text" id="clbm2" size="20" maxlength="20" ></td>
      <td align="right" width="19%">材料名称</td>
      <td width="31%"><input name="clmc" type="text" id="clmc" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">材料大类</div>      </td>
      <td width="32%"> 
        <select name="cldlmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select cldlmc c1,cldlmc c2 from cl_cldlbm order by cldlbm","");
				%> 
        </select>      </td>
      <td width="19%" align="right">材料规格 </td>
      <td width="31%"><input type="text" name="clgg" size="20" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">利润计算方式</td>
      <td width="32%"> 
        <select name="lrjsfs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">差价方式</option>
          <option value="2">百分比方式</option>
        </select>      </td>
      <td width="19%"> 
        <div align="right">计量单位</div>      </td>
      <td width="31%"> 
        <select name="jldwmc" style="FONT-SIZE:12px;WIDTH:152px">
          <option value=""></option>
          <%
				cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
	%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">利润百分比 从</td>
      <td width="32%"> 
        <input type="text" name="lrbfb" size="20" maxlength="9" >
        % </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="lrbfb2" size="20" maxlength="9" >
        % </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">分公司单价 从</td>
      <td width="32%"> 
        <input type="text" name="fgsdj" size="20" maxlength="9" >      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="fgsdj2" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">价格调整状态</td>
      <td width="32%"> 
        <select name="xjgsfgx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">未更新</option>
          <option value="2">已更新</option>
        </select>      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
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
	if(!(isFloat(FormName.lrbfb, "利润百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.lrbfb2, "利润百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.fgsdj, "分公司单价"))) {
		return false;
	}
	if(!(isFloat(FormName.fgsdj2, "分公司单价"))) {
		return false;
	}

	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[分公司]！");
		FormName.fgs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
