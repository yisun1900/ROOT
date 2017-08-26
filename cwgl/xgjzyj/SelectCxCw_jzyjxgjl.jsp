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
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jzsjxgjlCxList.jsp" name="selectform">
  <div align="center">查询－结转时间修改记录 </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">分公司</div>
      </td>
      <td width="32%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="20%"> 
        <div align="right">签约店面</div>
      </td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">合同号</td>
      <td width="32%"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
      <td width="20%" align="right">客户编号</td>
      <td width="30%"> 
        <input type="text" name="khbh" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">设计师</td>
      <td width="32%"> 
        <input type="text" name="sjs" size="20" maxlength="20">
      </td>
      <td width="20%" align="right">质检</td>
      <td width="30%"> 
        <input type="text" name="zjxm" size="20" maxlength="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
      <td width="32%"> 
        <input type="text" name="khxm" size="20" maxlength="50">
      </td>
      <td width="20%" align="right">客户姓名</td>
      <td width="30%"> 
        <input type="text" name="khxm2" size="14" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000CC"><b>联系方式</b></font></div>
      </td>
      <td width="32%"> 
        <input type="text" name="lxfs" size="20" maxlength="50">
      </td>
      <td width="20%"> 
        <div align="right">联系方式</div>
      </td>
      <td width="30%"> 
        <input type="text" name="lxfs2" size="14" maxlength="50">
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
      <td colspan="3"> 
        <input type="text" name="fwdz" size="71" maxlength="100">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">房屋地址</div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz2" size="65" maxlength="50" >
        （模糊查询） </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">修改时间 从</td>
      <td width="32%"> 
        <input type="text" name="cw_jzsjxgjl_xgsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">到</td>
      <td width="30%"> 
        <input type="text" name="cw_jzsjxgjl_xgsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">修改人</td>
      <td width="32%"> 
        <input type="text" name="cw_jzsjxgjl_xgr" size="20" maxlength="20" >
      </td>
      <td align="right" width="20%">修改类型</td>
      <td width="30%"><%
	cf.radioToken(out, "cw_jzsjxgjl_xglx","1+修改&2+删除&3+增加","");
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">原签单结转时间</td>
      <td width="32%"> 
        <input type="text" name="yqdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">修改后签单结转时间</td>
      <td width="30%"> 
        <input type="text" name="xghqdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">原退单结转时间</td>
      <td width="32%"> 
        <input type="text" name="ytdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="20%">修改后退单结转时间</td>
      <td width="30%"> 
        <input type="text" name="xghtdjzsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cw_jzsjxgjl_xgsj, "修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzsjxgjl_xgsj2, "修改时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yqdjzsj, "原签单结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghqdjzsj, "修改后签单结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ytdjzsj, "原退单结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghtdjzsj, "修改后退单结转时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
