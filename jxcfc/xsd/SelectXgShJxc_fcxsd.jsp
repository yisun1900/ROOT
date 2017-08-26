<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_fcxsdXgShList.jsp" name="selectform">
<div align="center">销售单－审核维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售批号</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_xsph" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">销售单状态</td> 
  <td width="32%">
  <select name="jxc_fcxsd_xsdzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
	<option value="2">等待出库</option>
	<option value="9">取消</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">地区</td>
  <td><select name="jxc_fcxsd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
  <td align="right">所属分公司</td>
  <td><select name="jxc_fcxsd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售单类型</td> 
  <td width="32%"> 
    <select name="jxc_fcxsd_xsdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx order by xsdlx","");
%>
    </select>	</td>
  <td align="right" width="18%">收款类型</td> 
  <td width="32%"> 
    <select name="jxc_fcxsd_sklx" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="1">现金</option>
		<option value="2">转账</option>
		<option value="3">支票</option>
		<option value="9">其它</option>
    </select>	</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否全款</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_fcxsd_sfqk" value="1">全款
    <INPUT type="radio" name="jxc_fcxsd_sfqk" value="2">部分款
    <INPUT type="radio" name="jxc_fcxsd_sfqk" value="3">未付款  </td>
  <td align="right" width="18%">收货方名称</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_shfmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">收货人联系方式</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_shrlxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">收货方地址</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_shfdz" size="20" maxlength="2000" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">销售员</td> 
  <td width="32%"> 
    <input type="text" name="jxc_fcxsd_xsy" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">销售日期 从</td>
  <td><input type="text" name="jxc_fcxsd_xsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_fcxsd_xsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="jxc_fcxsd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_fcxsd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"><input type="text" name="jxc_fcxsd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="jxc_fcxsd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isDatetime(FormName.jxc_fcxsd_xsrq, "销售日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_fcxsd_xsrq2, "销售日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_fcxsd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_fcxsd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
