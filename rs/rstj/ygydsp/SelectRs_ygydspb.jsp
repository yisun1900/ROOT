<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_ygydspbList.jsp" name="selectform">
<div align="center">员工变动登记维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">变动序号</td>
      <td width="32%"> 
        <input type="text" name="bdxh" size="20" maxlength="10" >
      </td>
      <td align="right" width="18%">员工序号</td>
      <td width="32%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">员工名称</td>
      <td width="32%"> 
        <input type="text" name="yhmc" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">工号</td>
      <td width="32%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">变动性质</td>
      <td width="32%"> 
        <select name="bdxz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+转正&02+调薪&03+升职&04+降职&05+调职&06+调动&07+升级&08+降级&99+其他","");
%> 
        </select>
      </td>
      <td align="right" width="18%">变动原因</td>
      <td width="32%"> 
        <input type="text" name="bdyy" size="20" maxlength="200" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">申报分公司</td>
      <td width="32%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','F0') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' ","");
	}
%> 
        </select>
      </td>
      <td align="right" width="18%">提出方</td>
      <td width="32%"> 
        <input type="text" name="tcf" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">变动前部门</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A1','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}
	else
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}	
%> 
        </select>
      </td>
      <td align="right" width="18%">变动后部门</td>
      <td width="32%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A1','F1','F2') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}
	else
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' and dwlx in ('F1','F2') and cxbz='N' order by dwlx,dwbh","");
	}	
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">变动前岗位</td>
      <td width="32%"> 
        <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm","");
%> 
        </select>
      </td>
      <td align="right" width="18%">变动后岗位</td>
      <td width="32%"> 
        <select name="zwbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">变动生效时间 从</td>
      <td width="32%"> 
        <input type="text" name="bdsxrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="bdsxrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">处理状态</td>
      <td width="32%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="00">不需审批</option>
          <option value="01">等待审批</option>
        </select>
      </td>
      <td align="right" width="18%">审批状态</td>
      <td width="32%"> 
        <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='03' and  ztbm not in ('0388','0399') order by ztbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%">
        <input type="text" name="lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="18%">到</td>
      <td width="32%"> 
        <input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input name="button" type="button" onClick="f_do(selectform)"  value="查询">
        <input name="reset" type="reset"  value="重输">
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
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.bdsxrq, "变动生效时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bdsxrq2, "变动生效时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
