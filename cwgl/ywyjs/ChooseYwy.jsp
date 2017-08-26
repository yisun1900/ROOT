<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String fgsbh=request.getParameter("fgsbh");
	String csz=cf.executeQuery("select csz from cw_ywyjscs where fgsbh='"+fgsbh+"' and csbm='sk'");
	if (csz==null)
	{
		out.println("错误！没有设置参数：限定实收款百分比");
		return;
	}
%>

<body bgcolor="#FFFFFF" onLoad="selectform.hth.focus();">
<center>
<table width="60%">
  <tr>
    <td width="100%" height="49"> 
      <div align="center">业务员结算</div>
    </td>
  </tr>
  <tr>
    <td width="100%" height="122" > 
      <div align="center">

<form method="post" action="" name="selectform" >
            <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
              <tr bgcolor="#FFFFFF"> 
                <td width="43%" align="right">分公司</td>
                <td width="57%"> 
                  <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
                  </select>
                </td>
              </tr>
              <tr bgcolor="#FFFFFF"> 
                <td align="right">业务员</td>
                <td> 
                  <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX">
                    <option value=""></option>
                    <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx where sq_yhxx.ssfgs='"+fgsbh+"' and sfzszg in('Y','N') and zwbm='19' order by yhmc","");
%> 
                  </select>
                </td>
              </tr>
              <tr bgcolor="#FFFFFF"> 
                <td align="right">限定实收款百分比（&gt;＝）</td>
                <td> 
                  <input type="text" name="xdsskbfb" size="8" maxlength="10" value="<%=csz%>" readonly>
                  %</td>
              </tr>
              <tr bgcolor="#FFFFFF"> 
                <td align="right">时间范围 从</td>
                <td> 
                  <input type="text" name="sjfw" size="20" maxlength="10"  value="<%=cf.firstDay(-1)%>" onDblClick="JSCalendar(this)">
                </td>
              </tr>
              <tr bgcolor="#FFFFFF"> 
                <td align="right">时间范围 到</td>
                <td> 
                  <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay(-1)%>" onDblClick="JSCalendar(this)">
                </td>
              </tr>
              <tr align="center"> 
                <td height="46" colspan="2"> 
                  <input type="button"  value="继续" name="butt" onClick="f_do(selectform)">
                  <input type="reset"  value="重输">
                </td>
              </tr>
            </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</center>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ywy)=="") {
		alert("请输入[业务员]！");
		FormName.ywy.focus();
		return false;
	}
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围"))) {
		return false;
	}

	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围"))) {
		return false;
	}

	if(!(isFloat(FormName.xdsskbfb, "限定实收款百分比"))) {
		return false;
	}
	FormName.action="ChooseKhbh.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
